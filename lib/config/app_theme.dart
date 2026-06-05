import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_constants.dart';

// ════════════════════════════════════════════════════════════════════
//  AppTheme — Thème doré adaptatif (Dark / Light / Luminosité système)
//
//  Dans main.dart :
//    theme:      AppTheme.lightTheme,
//    darkTheme:  AppTheme.darkTheme,
//    themeMode:  ThemeMode.system,   ← suit le téléphone automatiquement
// ════════════════════════════════════════════════════════════════════

class AppTheme {

  AppTheme._();

  // ── Palette dorée (constantes) ─────────────────────────────────────
  static const Color gold        = Color(AppConstants.primaryColor); // or principal
  static const Color goldLight   = Color(0xFFE8C547);  // or clair / hover
  static const Color goldBright  = Color(0xFFFCD116);  // or vif / accent
  static const Color goldDark    = Color(0xFFA87C10);  // or foncé / pressed
  static const Color goldOnDark  = Color(0xFFF5E6C0);  // texte doré sur fond sombre

  // ── Neutres chauds ──────────────────────────────────────────────────
  static const Color _darkBg       = Color(AppConstants.darkBg);
  static const Color _darkCard     = Color(AppConstants.cardDark);
  static const Color _darkSurface  = Color(0xFF1E1800);
  static const Color _lightBg      = Color(0xFFFFFBF0);
  static const Color _lightSurface = Color(0xFFFFF3CC);
  static const Color _lightCard    = Color(0xFFFFF8DC);

  // ════════════════════════════════════════════════════════════════════
  //  THÈME SOMBRE (reprend et enrichit ton thème existant)
  // ════════════════════════════════════════════════════════════════════
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkBg,
      primaryColor: gold,

      colorScheme: ColorScheme.dark(
        primary:             gold,
        onPrimary:           const Color(0xFF1A1200),
        primaryContainer:    const Color(0xFF3D2E00),
        onPrimaryContainer:  goldOnDark,
        secondary:           goldLight,
        onSecondary:         const Color(0xFF1A1200),
        secondaryContainer:  const Color(0xFF2A2000),
        onSecondaryContainer: goldOnDark,
        tertiary:            goldBright,
        onTertiary:          const Color(0xFF1A1200),
        surface:             _darkCard,
        onSurface:           goldOnDark,
        error:               const Color(AppConstants.accentRed),
        onError:             const Color(0xFF1A1200),
        outline:             const Color(0xFF7A6020),
      ),

      // ── AppBar ────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor:  _darkBg,
        foregroundColor:  goldOnDark,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: goldOnDark,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:           Colors.transparent,
          statusBarIconBrightness:  Brightness.light,
          systemNavigationBarColor: _darkBg,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      // ── Text Theme ────────────────────────────────────────────────
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ).apply(
        bodyColor:    goldOnDark,
        displayColor: goldOnDark,
      ).copyWith(
        bodySmall:   GoogleFonts.poppins(color: const Color(0xFFAA8E55), fontSize: 12),
        labelSmall:  GoogleFonts.poppins(color: const Color(0xFF7A6020), fontSize: 11),
        labelMedium: GoogleFonts.poppins(color: const Color(0xFFAA8E55), fontSize: 12, fontWeight: FontWeight.w600),
      ),

      // ── Input fields ──────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled:    true,
        fillColor: _darkCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: gold),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: gold.withOpacity(0.25)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: gold, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(AppConstants.accentRed)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(AppConstants.accentRed), width: 2),
        ),
        hintStyle:  GoogleFonts.poppins(color: const Color(AppConstants.textGray), fontSize: 14),
        labelStyle: GoogleFonts.poppins(color: gold, fontSize: 14),
        prefixIconColor: gold,
        suffixIconColor: gold,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── Elevated Button ───────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: gold,
          foregroundColor: const Color(0xFF1A1200),
          elevation: 6,
          shadowColor: gold.withOpacity(0.5),
          minimumSize: const Size(double.infinity, 52),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // ── Outlined Button ───────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: gold,
          side: BorderSide(color: gold.withOpacity(0.7), width: 1.5),
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // ── Text Button ───────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: goldLight,
          textStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // ── Cards ─────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color:       _darkCard,
        elevation:   4,
        shadowColor: gold.withOpacity(0.3),
        shape:       RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin:      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // ── Dialog ────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor:  _darkCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle:   GoogleFonts.poppins(color: goldOnDark, fontSize: 18, fontWeight: FontWeight.w700),
        contentTextStyle: GoogleFonts.poppins(color: const Color(0xFFD4B878), fontSize: 14, height: 1.5),
      ),

      // ── BottomNavigationBar ───────────────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:      _darkBg,
        selectedItemColor:    gold,
        unselectedItemColor:  const Color(0xFF7A6020),
        selectedLabelStyle:   GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 11),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 11),
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),

      // ── NavigationBar Material 3 ──────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:  _darkBg,
        indicatorColor:   gold.withOpacity(0.22),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: gold, size: 24);
          }
          return const IconThemeData(color: Color(0xFF7A6020), size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.poppins(color: gold, fontWeight: FontWeight.w700, fontSize: 11);
          }
          return GoogleFonts.poppins(color: const Color(0xFF7A6020), fontSize: 11);
        }),
      ),

      // ── Chips ─────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor:     _darkCard,
        selectedColor:       gold.withOpacity(0.3),
        labelStyle:          GoogleFonts.poppins(color: goldOnDark, fontSize: 13),
        secondaryLabelStyle: GoogleFonts.poppins(color: gold, fontWeight: FontWeight.w700),
        side:                BorderSide(color: gold.withOpacity(0.3)),
        shape:               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:             const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // ── Divider ───────────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: gold.withOpacity(0.15), thickness: 1, space: 16,
      ),

      // ── Icons ─────────────────────────────────────────────────────
      iconTheme:        const IconThemeData(color: gold, size: 24),
      primaryIconTheme: const IconThemeData(color: gold, size: 24),

      // ── Progress ──────────────────────────────────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: gold),

      // ── Switch / Checkbox / Radio ─────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor:  WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold : const Color(0xFF5A4A20)),
        trackColor:  WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold.withOpacity(0.4) : const Color(0xFF3A3020)),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor:  WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold : Colors.transparent),
        checkColor: WidgetStateProperty.all(const Color(0xFF1A1200)),
        side:       BorderSide(color: gold.withOpacity(0.5), width: 1.5),
        shape:      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold : const Color(0xFF7A6020)),
      ),

      // ── Snackbar ──────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor:  _darkCard,
        contentTextStyle: GoogleFonts.poppins(color: goldOnDark, fontSize: 14),
        actionTextColor:  goldBright,
        shape:            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior:         SnackBarBehavior.floating,
      ),

      // ── FAB ───────────────────────────────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: gold,
        foregroundColor: const Color(0xFF1A1200),
        elevation:       8,
        shape:           RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // ── Tab bar ───────────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor:           gold,
        unselectedLabelColor: const Color(0xFF7A6020),
        indicatorColor:       gold,
        labelStyle:           GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 14),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
        dividerColor:         Colors.transparent,
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════════
  //  THÈME CLAIR
  // ════════════════════════════════════════════════════════════════════
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _lightBg,
      primaryColor: gold,

      colorScheme: ColorScheme.light(
        primary:             gold,
        onPrimary:           const Color(0xFF1A1200),
        primaryContainer:    const Color(0xFFFFE082),
        onPrimaryContainer:  const Color(0xFF1A1200),
        secondary:           goldDark,
        onSecondary:         Colors.white,
        secondaryContainer:  const Color(0xFFFFF0B3),
        onSecondaryContainer: const Color(0xFF1A1200),
        tertiary:            goldBright,
        onTertiary:          const Color(0xFF1A1200),
        surface:             _lightBg,
        onSurface:           const Color(0xFF1A1200),
        error:               const Color(AppConstants.accentRed),
        onError:             Colors.white,
        outline:             const Color(0xFFB8901A),
      ),

      // ── AppBar ────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor:  _lightBg,
        foregroundColor:  const Color(0xFF1A1200),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1A1200),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:           Colors.transparent,
          statusBarIconBrightness:  Brightness.dark,
          systemNavigationBarColor: _lightBg,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),

      // ── Text Theme ────────────────────────────────────────────────
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.light).textTheme,
      ).apply(
        bodyColor:    const Color(0xFF3D2E00),
        displayColor: const Color(0xFF1A1200),
      ).copyWith(
        bodySmall:   GoogleFonts.poppins(color: const Color(0xFF6B5010), fontSize: 12),
        labelSmall:  GoogleFonts.poppins(color: const Color(0xFF8A7040), fontSize: 11),
        labelMedium: GoogleFonts.poppins(color: const Color(0xFF6B5010), fontSize: 12, fontWeight: FontWeight.w600),
      ),

      // ── Input fields ──────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled:    true,
        fillColor: _lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: gold),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: gold.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: gold, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(AppConstants.accentRed)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(AppConstants.accentRed), width: 2),
        ),
        hintStyle:  GoogleFonts.poppins(color: const Color(0xFF8A7040), fontSize: 14),
        labelStyle: GoogleFonts.poppins(color: gold, fontSize: 14),
        prefixIconColor: gold,
        suffixIconColor: gold,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── Elevated Button ───────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: gold,
          foregroundColor: const Color(0xFF1A1200),
          elevation: 4,
          shadowColor: gold.withOpacity(0.4),
          minimumSize: const Size(double.infinity, 52),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // ── Outlined Button ───────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: gold,
          side: const BorderSide(color: gold, width: 1.5),
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // ── Text Button ───────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: gold,
          textStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // ── Cards ─────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color:       _lightCard,
        elevation:   2,
        shadowColor: gold.withOpacity(0.2),
        shape:       RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin:      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // ── Dialog ────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor:  _lightBg,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle:   GoogleFonts.poppins(color: const Color(0xFF1A1200), fontSize: 18, fontWeight: FontWeight.w700),
        contentTextStyle: GoogleFonts.poppins(color: const Color(0xFF3D2E00), fontSize: 14, height: 1.5),
      ),

      // ── BottomNavigationBar ───────────────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:      _lightBg,
        selectedItemColor:    gold,
        unselectedItemColor:  const Color(0xFF8A7040),
        selectedLabelStyle:   GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 11),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 11),
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),

      // ── NavigationBar Material 3 ──────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:  _lightBg,
        indicatorColor:   gold.withOpacity(0.18),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: gold, size: 24);
          }
          return const IconThemeData(color: Color(0xFF8A7040), size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.poppins(color: gold, fontWeight: FontWeight.w700, fontSize: 11);
          }
          return GoogleFonts.poppins(color: const Color(0xFF8A7040), fontSize: 11);
        }),
      ),

      // ── Chips ─────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor:     _lightSurface,
        selectedColor:       gold.withOpacity(0.25),
        labelStyle:          GoogleFonts.poppins(color: const Color(0xFF1A1200), fontSize: 13),
        secondaryLabelStyle: GoogleFonts.poppins(color: const Color(0xFF1A1200), fontWeight: FontWeight.w700),
        side:                BorderSide(color: gold.withOpacity(0.4)),
        shape:               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:             const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // ── Divider ───────────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: gold.withOpacity(0.2), thickness: 1, space: 16,
      ),

      // ── Icons ─────────────────────────────────────────────────────
      iconTheme:        const IconThemeData(color: gold, size: 24),
      primaryIconTheme: const IconThemeData(color: gold, size: 24),

      // ── Progress ──────────────────────────────────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: gold),

      // ── Switch / Checkbox / Radio ─────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor:  WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold : Colors.grey.shade400),
        trackColor:  WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold.withOpacity(0.4) : Colors.grey.shade300),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor:  WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold : Colors.transparent),
        checkColor: WidgetStateProperty.all(const Color(0xFF1A1200)),
        side:       BorderSide(color: gold.withOpacity(0.6), width: 1.5),
        shape:      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? gold : const Color(0xFF8A7040)),
      ),

      // ── Snackbar ──────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor:  _darkCard,
        contentTextStyle: GoogleFonts.poppins(color: goldOnDark, fontSize: 14),
        actionTextColor:  goldBright,
        shape:            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior:         SnackBarBehavior.floating,
      ),

      // ── FAB ───────────────────────────────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: gold,
        foregroundColor: const Color(0xFF1A1200),
        elevation:       6,
        shape:           RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // ── Tab bar ───────────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor:           gold,
        unselectedLabelColor: const Color(0xFF8A7040),
        indicatorColor:       gold,
        labelStyle:           GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 14),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
        dividerColor:         Colors.transparent,
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  Extension utilitaire — accès rapide depuis n'importe quel widget
//  Exemple : color: context.gold
//            if (context.isDark) { ... }
// ════════════════════════════════════════════════════════════════════
extension AppColors on BuildContext {
  Color get gold         => AppTheme.gold;
  Color get goldBright   => AppTheme.goldBright;
  Color get goldOnDark   => AppTheme.goldOnDark;
  Color get surface      => Theme.of(this).colorScheme.surface;
  Color get onSurface    => Theme.of(this).colorScheme.onSurface;
  bool  get isDark       => Theme.of(this).brightness == Brightness.dark;
  Color goldWithOpacity(double opacity) => AppTheme.gold.withOpacity(opacity);
}