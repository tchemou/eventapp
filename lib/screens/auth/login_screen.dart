import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../config/app_theme.dart';
import '../../providers/auth_provider.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _phoneCtrl    = TextEditingController();
  final _fullNameCtrl = TextEditingController();
  final _emailCtrl    = TextEditingController();

  bool _isLogin = true;

  static const _countryCode = '+237';
  static const _countryFlag = '🇨🇲';

  late AnimationController _anim;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _fade = CurvedAnimation(parent: _anim, curve: Curves.easeOut);
    _anim.forward();
  }

  @override
  void dispose() {
    _anim.dispose();
    _phoneCtrl.dispose();
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  void _switch(bool toLogin) {
    if (_isLogin == toLogin) return;
    _anim.reset();
    setState(() => _isLogin = toLogin);
    _anim.forward();
  }

  String get _fullPhone => '$_countryCode${_phoneCtrl.text.trim()}';

  Future<void> _submit() async {
    final auth = context.read<AuthProvider>();
    bool ok;

    if (_isLogin) {
      ok = await auth.loginMobile(_fullPhone);
    } else {
      ok = await auth.signupMobile(
        fullName:    _fullNameCtrl.text.trim(),
        phoneNumber: _fullPhone,
        email:       _emailCtrl.text.trim(),
      );
    }

    if (ok && mounted) {
      Navigator.push(
        context,
        PageRouteBuilder(
          // ✅ isSignup passé selon le mode actif
          pageBuilder: (_, a, __) => OtpScreen(
            phoneNumber: _fullPhone,
            isSignup: !_isLogin,
          ),
          transitionsBuilder: (_, anim, __, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: anim, curve: Curves.easeOutCubic)),
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    } else if (mounted) {
      final err = auth.error;
      if (err != null) _showError(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark  = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: Stack(
        children: [
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Consumer<AuthProvider>(
                builder: (context, auth, _) {
                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      _buildLogo(isDark),
                      const SizedBox(height: 40),
                      _buildTabs(scheme),
                      const SizedBox(height: 28),
                      FadeTransition(
                        opacity: _fade,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!_isLogin) ...[
                              _buildField(
                                label:  'NOM COMPLET',
                                ctrl:   _fullNameCtrl,
                                hint:   'Jean Dupont',
                                icon:   Icons.person_outline_rounded,
                                scheme: scheme,
                              ),
                              const SizedBox(height: 16),
                              _buildField(
                                label:  'EMAIL',
                                ctrl:   _emailCtrl,
                                hint:   'jean@example.com',
                                icon:   Icons.mail_outline_rounded,
                                type:   TextInputType.emailAddress,
                                scheme: scheme,
                              ),
                              const SizedBox(height: 16),
                            ],
                            _buildPhoneField(scheme, isDark),
                            const SizedBox(height: 24),
                            _buildButton(auth),
                            const SizedBox(height: 28),
                            _buildToggle(scheme),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(bool isDark) => Column(
    children: [
      Container(
        width: 72, height: 72,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.gold, AppTheme.goldDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppTheme.gold.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.gold.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.confirmation_number_outlined,
            color: Color(0xFF1A1200), size: 36),
      ),
      const SizedBox(height: 16),
      Text(
        'Event237',
        style: TextStyle(
          color: isDark ? AppTheme.goldOnDark : const Color(0xFF1A1200),
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        'Découvrez & achetez vos billets',
        style: TextStyle(
          color: AppTheme.gold.withOpacity(0.5),
          fontSize: 13,
        ),
      ),
    ],
  );

  Widget _buildTabs(ColorScheme scheme) => Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: scheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppTheme.gold.withOpacity(0.15)),
    ),
    child: Row(children: [
      _tab('Connexion',   _isLogin,  () => _switch(true),  scheme),
      _tab('Inscription', !_isLogin, () => _switch(false), scheme),
    ]),
  );

  Widget _tab(String label, bool active, VoidCallback onTap,
      ColorScheme scheme) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              gradient: active
                  ? LinearGradient(
                      colors: [AppTheme.gold, AppTheme.goldDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: active ? null : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: active
                  ? [BoxShadow(
                      color: AppTheme.gold.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    )]
                  : null,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: active
                    ? const Color(0xFF1A1200)
                    : scheme.onSurface.withOpacity(0.35),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget _buildField({
    required String label,
    required TextEditingController ctrl,
    required String hint,
    required IconData icon,
    required ColorScheme scheme,
    TextInputType type = TextInputType.text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppTheme.gold.withOpacity(0.6),
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.gold.withOpacity(0.15)),
            ),
            child: TextField(
              controller: ctrl,
              keyboardType: type,
              style: TextStyle(color: scheme.onSurface, fontSize: 15),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    color: scheme.onSurface.withOpacity(0.25), fontSize: 15),
                prefixIcon: Icon(icon,
                    color: AppTheme.gold.withOpacity(0.5), size: 20),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 16),
              ),
            ),
          ),
        ],
      );

  Widget _buildPhoneField(ColorScheme scheme, bool isDark) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'NUMÉRO DE TÉLÉPHONE',
        style: TextStyle(
          color: AppTheme.gold.withOpacity(0.6),
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.gold.withOpacity(0.4)),
        ),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppTheme.gold.withOpacity(0.15)),
              ),
            ),
            child: Row(children: [
              const Text(_countryFlag, style: TextStyle(fontSize: 18)),
              const SizedBox(width: 6),
              Text(
                _countryCode,
                style: TextStyle(
                  color: AppTheme.gold,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
          Expanded(
            child: TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: TextStyle(color: scheme.onSurface, fontSize: 15),
              decoration: InputDecoration(
                hintText: '697 859 625',
                hintStyle: TextStyle(
                    color: scheme.onSurface.withOpacity(0.25), fontSize: 15),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 16),
              ),
            ),
          ),
        ]),
      ),
    ],
  );

  Widget _buildButton(AuthProvider auth) => GestureDetector(
    onTap: auth.isLoading ? null : _submit,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: auth.isLoading
              ? [Colors.grey.shade700, Colors.grey.shade600]
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
                    color: Color(0xFF1A1200), strokeWidth: 2.5))
            : Text(
                _isLogin ? 'Recevoir le code SMS' : 'Créer mon compte',
                style: const TextStyle(
                  color: Color(0xFF1A1200),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    ),
  );

  Widget _buildToggle(ColorScheme scheme) => Center(
    child: GestureDetector(
      onTap: () => _switch(!_isLogin),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              color: scheme.onSurface.withOpacity(0.35), fontSize: 13),
          children: [
            TextSpan(
              text: _isLogin
                  ? 'Pas encore de compte ? '
                  : 'Déjà un compte ? ',
            ),
            TextSpan(
              text: _isLogin ? 'S\'inscrire' : 'Se connecter',
              style: const TextStyle(
                color: AppTheme.gold,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: [
        const Icon(Icons.error_outline_rounded, color: Colors.white, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(msg, style: const TextStyle(color: Colors.white)),
        ),
      ]),
      backgroundColor: const Color(0xFFB00020),
      behavior: SnackBarBehavior.floating,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
    ));
  }
}