class AppConstants {
  // App Info
  static const String appName = 'Event237';
  static const String appVersion = '1.0.0';
  static const String appSlogan = 'VOTRE BILLETTERIE CAMEROUNAISE';

  // Colors
  static const int primaryColor = 0xFFFFA500; // Orange
  static const int darkBg = 0xFF1A1A2E; // Dark background
  static const int cardDark = 0xFF16213E; // Card background
  static const int textLight = 0xFFFFFFFF; // Light text
  static const int textGray = 0xFF9CA3AF; // Gray text
  static const int accentGreen = 0xFF10B981; // Green accent
  static const int accentRed = 0xFFEF4444; // Red accent

  // Durations
  static const int animationDuration = 300;
  static const int snackbarDuration = 2;

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'user_data';
  static const String isLoggedInKey = 'is_logged_in';
  static const String userRoleKey = 'user_role';
  static const String darkModeKey = 'dark_mode';

  // Regex
  static const String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phoneRegex = r'^\+?[0-9]{9,15}$';

  // Validation Messages
  static const String emailRequiredMsg = 'Email est requis';
  static const String emailInvalidMsg = 'Email invalide';
  static const String passwordRequiredMsg = 'Mot de passe est requis';
  static const String passwordMinLengthMsg = 'Le mot de passe doit avoir au moins 8 caractères';
  static const String phoneRequiredMsg = 'Téléphone est requis';
  static const String nameRequiredMsg = 'Le nom est requis';

  // API Error Messages
  static const String networkErrorMsg = 'Erreur réseau. Vérifiez votre connexion.';
  static const String serverErrorMsg = 'Erreur serveur. Veuillez réessayer plus tard.';
  static const String unauthorizedMsg = 'Non autorisé. Veuillez vous connecter.';
  static const String forbiddenMsg = 'Accès refusé.';
  static const String notFoundMsg = 'Non trouvé.';
  static const String unknownErrorMsg = 'Une erreur inconnue s\'est produite.';
}
