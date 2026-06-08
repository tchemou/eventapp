import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../config/app_theme.dart';
import '../../providers/auth_provider.dart';
import 'welcome_screen.dart';
import '../main_shell.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final bool isSignup;

  const OtpScreen({
    Key? key,
    required this.phoneNumber,
    this.isSignup = false,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinCtrl = TextEditingController();
  int _seconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinCtrl.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _seconds = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_seconds == 0) {
        t.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  Future<void> _verify(String code) async {
    if (code.length != 6) return;
    final auth = context.read<AuthProvider>();
    final ok = await auth.verifyOtp(
      phoneNumber: widget.phoneNumber,
      codeOtp: code,
      isSignup: widget.isSignup,
    );

    if (!mounted) return;

    if (ok) {
      if (widget.isSignup) {
        // Nouvel inscrit → WelcomeScreen
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, a, __) => const WelcomeScreen(),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(
              opacity: CurvedAnimation(parent: anim, curve: Curves.easeIn),
              child: child,
            ),
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      } else {
        // Connexion → retour au home
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const MainShell()),
          (route) => false,
        );
      }
    } else {
      _pinCtrl.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(children: [
          const Icon(Icons.error_outline_rounded, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              auth.error ?? 'Code incorrect',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ]),
        backgroundColor: const Color(0xFFB00020),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ));
    }
  }

  Future<void> _resend() async {
    final auth = context.read<AuthProvider>();
    await auth.loginMobile(widget.phoneNumber);
    _startTimer();
    _pinCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    // ── Couleurs alignées sur login_screen.dart ──────────────
    const Color bg         = Color(0xFFF5F0E8); // beige chaud (= scheme.surface)
    const Color cardBg     = Color(0xFFFFFFFF); // blanc (= scheme.surfaceContainerHighest)
    const Color fieldBg    = Color(0xFFFFFDE7); // jaune très pâle (champ actif)
    const Color decorCircle= Color(0xFFE8E0D0); // cercles décoratifs

    final pinTheme = PinTheme(
      width: 52,
      height: 58,
      textStyle: const TextStyle(
        color: Color(0xFF1A1200),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.gold.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.gold.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          // ── Cercles décoratifs (identiques à login_screen) ───
          Positioned(
            top: -120, left: -120,
            child: Container(
              width: 380, height: 380,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.gold.withOpacity(0.07),
              ),
            ),
          ),
          Positioned(
            bottom: -80, right: -80,
            child: Container(
              width: 250, height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.goldDark.withOpacity(0.06),
              ),
            ),
          ),

          SafeArea(
            child: Consumer<AuthProvider>(
              builder: (context, auth, _) => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── Bouton retour ──────────────────────────
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppTheme.gold.withOpacity(0.25)),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.gold.withOpacity(0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.gold,
                          size: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Titre ──────────────────────────────────
                    const Text(
                      'Vérification',
                      style: TextStyle(
                        color: Color(0xFF1A1200),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: const Color(0xFF1A1200).withOpacity(0.5),
                          fontSize: 14,
                          height: 1.6,
                        ),
                        children: [
                          const TextSpan(text: 'Code SMS envoyé au\n'),
                          TextSpan(
                            text: widget.phoneNumber,
                            style: TextStyle(
                              color: AppTheme.gold,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ── Champs PIN ────────────────────────────
                    Center(
                      child: Pinput(
                        controller: _pinCtrl,
                        length: 6,
                        autofocus: true,
                        defaultPinTheme: pinTheme,
                        focusedPinTheme: pinTheme.copyWith(
                          decoration: pinTheme.decoration!.copyWith(
                            color: fieldBg,
                            border: Border.all(
                                color: AppTheme.gold, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.gold.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        submittedPinTheme: pinTheme.copyWith(
                          decoration: pinTheme.decoration!.copyWith(
                            color: AppTheme.gold.withOpacity(0.08),
                            border: Border.all(
                                color: AppTheme.gold.withOpacity(0.5)),
                          ),
                        ),
                        onCompleted: _verify,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Badge timer ───────────────────────────
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppTheme.gold.withOpacity(0.25)),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.gold.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.timer_outlined,
                                color: AppTheme.gold, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Expire dans ',
                              style: TextStyle(
                                color: const Color(0xFF1A1200).withOpacity(0.45),
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '00:${_seconds.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                color: AppTheme.gold,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Bouton Vérifier ───────────────────────
                    GestureDetector(
                      onTap: auth.isLoading ? null : () => _verify(_pinCtrl.text),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: auth.isLoading
                                ? [Colors.grey.shade400, Colors.grey.shade300]
                                : [AppTheme.gold, AppTheme.goldDark],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: auth.isLoading
                              ? []
                              : [
                                  BoxShadow(
                                    color: AppTheme.gold.withOpacity(0.4),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                        ),
                        child: Center(
                          child: auth.isLoading
                              ? const SizedBox(
                                  width: 22, height: 22,
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF1A1200),
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text(
                                  'Vérifier le code',
                                  style: TextStyle(
                                    color: Color(0xFF1A1200),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Renvoyer le code ──────────────────────
                    Center(
                      child: _seconds > 0
                          ? Text(
                              'Renvoyer le code dans $_seconds s',
                              style: TextStyle(
                                color: const Color(0xFF1A1200).withOpacity(0.35),
                                fontSize: 13,
                              ),
                            )
                          : GestureDetector(
                              onTap: _resend,
                              child: Text(
                                'Renvoyer le code',
                                style: TextStyle(
                                  color: AppTheme.gold,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}