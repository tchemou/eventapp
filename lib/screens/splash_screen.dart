import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/app_theme.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onDone;
  const SplashScreen({Key? key, required this.onDone}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  // ── Couleurs fixes identité camerounaise ──────────────────────────
  static const _green  = Color(0xFF007A5E);
  static const _red    = Color(0xFFCE1126);
  static const _dark   = Color(0xFF0D0900); // noir chaud cohérent avec AppTheme

  late AnimationController _logoCtrl;
  late AnimationController _textCtrl;
  late AnimationController _btnCtrl;

  late Animation<double> _logoScale;
  late Animation<double> _logoFade;
  late Animation<double> _textFade;
  late Animation<Offset> _textSlide;
  late Animation<double> _btnFade;
  late Animation<Offset> _btnSlide;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:          Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    _logoCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _textCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _btnCtrl  = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _logoScale = Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(parent: _logoCtrl, curve: Curves.elasticOut));
    _logoFade  = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _logoCtrl, curve: const Interval(0, 0.5)));
    _textFade  = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _textCtrl, curve: Curves.easeOut));
    _textSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _textCtrl, curve: Curves.easeOutCubic));
    _btnFade   = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _btnCtrl, curve: Curves.easeOut));
    _btnSlide  = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
        .animate(CurvedAnimation(parent: _btnCtrl, curve: Curves.easeOutCubic));

    _logoCtrl.forward().then((_) {
      _textCtrl.forward().then((_) {
        _btnCtrl.forward();
      });
    });
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _textCtrl.dispose();
    _btnCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _dark,
      body: Stack(
        children: [

          // ── Carte Cameroun en background ────────────────────────────
          Positioned.fill(
            child: Image.asset(
              'assets/images/cameroon_map.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
              opacity: const AlwaysStoppedAnimation(0.45),
            ),
          ),

          // ── Overlay dégradé ─────────────────────────────────────────
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _dark.withOpacity(0.10),
                  _dark.withOpacity(0.25),
                  _dark.withOpacity(0.55),
                  _dark.withOpacity(0.92),
                ],
                stops: const [0, 0.3, 0.65, 1.0],
              ),
            ),
          ),

          // ── Cercle vert haut gauche ─────────────────────────────────
          Positioned(
            top: -size.width * 0.3,
            left: -size.width * 0.2,
            child: Container(
              width: size.width * 0.8,
              height: size.width * 0.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _green.withOpacity(0.06),
              ),
            ),
          ),

          // ── Cercle doré bas droite ──────────────────────────────────
          Positioned(
            bottom: size.height * 0.15,
            right: -size.width * 0.25,
            child: Container(
              width: size.width * 0.6,
              height: size.width * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.gold.withOpacity(0.06),
              ),
            ),
          ),



          // ── Texte principal ─────────────────────────────────────────
          Positioned(
            top: size.height * 0.42,
            left: 0, right: 0,
            child: SlideTransition(
              position: _textSlide,
              child: FadeTransition(
                opacity: _textFade,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Event',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -1,
                              ),
                            ),
                            TextSpan(
                              text: '237',
                              style: TextStyle(
                                color: AppTheme.gold, // ← or cohérent
                                fontSize: 38,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'VOTRE BILLETTERIE CAMEROUNAISE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.35),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Séparateur tricolore camerounais
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 32, height: 2, color: _green),
                          Container(width: 32, height: 2, color: _red),
                          Container(width: 32, height: 2,
                              color: AppTheme.gold), // ← or à la place du jaune vif
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Découvrez, achetez et vivez les\nmeilleurs événements au Cameroun.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Points de pagination ────────────────────────────────────
          Positioned(
            bottom: 170,
            left: 0, right: 0,
            child: FadeTransition(
              opacity: _btnFade,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24, height: 6,
                    decoration: BoxDecoration(
                      color: AppTheme.gold, // ← or cohérent
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 6, height: 6,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 6, height: 6,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Boutons bas ─────────────────────────────────────────────
          Positioned(
            bottom: 48,
            left: 24, right: 24,
            child: SlideTransition(
              position: _btnSlide,
              child: FadeTransition(
                opacity: _btnFade,
                child: Column(
                  children: [

                    // Bouton "Commencer"
                    GestureDetector(
                      onTap: widget.onDone,
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.gold, AppTheme.goldDark],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.gold.withOpacity(0.45),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Commencer',
                              style: TextStyle(
                                color: Color(0xFF1A1200), // texte sombre sur or
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1200).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Color(0xFF1A1200),
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Lien "Déjà un compte"
                    GestureDetector(
                      onTap: widget.onDone,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Déjà un compte ? ',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 13,
                            ),
                          ),
                          const Text(
                            'Se connecter',
                            style: TextStyle(
                              color: AppTheme.gold, // ← or cohérent
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
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