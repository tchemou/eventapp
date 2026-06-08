import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../config/api_config.dart';
import '../config/app_constants.dart';
import '../models/user.dart';
import 'http_service.dart';

class AuthService {
  final HttpService _httpService;
  late SharedPreferences _prefs;

  AuthService(this._httpService);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _loadTokenFromStorage();
  }

  void _loadTokenFromStorage() {
    final token = _prefs.getString(AppConstants.tokenKey);
    if (token != null) _httpService.setToken(token);
  }

  // ─── INSCRIPTION (OTP SMS) ────────────────────────────────────────────────

  /// Étape 1 inscription : envoie OTP SMS
  Future<void> signupMobile({
    required String fullName,
    required String phoneNumber,
    required String email,
  }) async {
    await _httpService.post(
      ApiConfig.authSignupMobile, // POST /auth/signup-mobile
      data: {
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'email': email,
      },
    );
  }

  // ─── CONNEXION (OTP SMS) ──────────────────────────────────────────────────

  /// Étape 1 connexion : envoie OTP SMS
  Future<void> loginMobile(String phoneNumber) async {
    await _httpService.post(
      ApiConfig.authLoginMobile, // POST /auth/login-mobile
      data: {'phoneNumber': phoneNumber},
    );
  }

  // ─── VÉRIFICATION OTP ────────────────────────────────────────────────────

  /// Étape 2 : vérifie le code OTP et retourne les tokens JWT
  Future<AuthResponse> verifyOtpMobile({
    required String phoneNumber,
    required String codeOtp,
  }) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.authVerifyOtpMobile, // POST /auth/verify-otp-mobile
      data: {
        'phoneNumber': phoneNumber,
        'codeOtp': codeOtp,
      },
    );

    final authResponse = AuthResponse.fromJson(response);
    await _saveAuthData(authResponse);
    return authResponse;
  }

  // ─── REFRESH TOKEN ────────────────────────────────────────────────────────

  Future<AuthResponse> refreshToken() async {
    final refreshToken = _prefs.getString(AppConstants.refreshTokenKey);
    if (refreshToken == null) throw Exception('No refresh token found');

    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.authRefreshToken,
      data: {'refreshToken': refreshToken},
    );

    final authResponse = AuthResponse.fromJson(response);
    await _saveAuthData(authResponse);
    return authResponse;
  }

  // ─── PROFIL UTILISATEUR ───────────────────────────────────────────────────

  Future<User> getMe() async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.authMe, // GET /auth/me
    );
    return User.fromJson(response['user'] ?? response);
  }

  // ─── LOGOUT ───────────────────────────────────────────────────────────────

  Future<void> logout() async {
    final refreshToken = _prefs.getString(AppConstants.refreshTokenKey);
    try {
      if (refreshToken != null) {
        await _httpService.post(
          ApiConfig.authLogout,
          data: {'refreshToken': refreshToken},
        );
      }
    } catch (_) {}
    _httpService.clearToken();
    await _prefs.clear();
  }

  // ─── HELPERS ──────────────────────────────────────────────────────────────

  Future<void> _saveAuthData(AuthResponse authResponse) async {
    await _prefs.setString(AppConstants.tokenKey, authResponse.accessToken);
    if (authResponse.refreshToken != null) {
      await _prefs.setString(
          AppConstants.refreshTokenKey, authResponse.refreshToken!);
    }
    await _prefs.setString(
        AppConstants.userKey, jsonEncode(authResponse.user.toJson()));
    await _prefs.setBool(AppConstants.isLoggedInKey, true);
    _httpService.setToken(authResponse.accessToken);
  }

  User? getCurrentUser() {
    final userStr = _prefs.getString(AppConstants.userKey);
    if (userStr != null) {
      try {
        return User.fromJson(jsonDecode(userStr));
      } catch (_) {}
    }
    return null;
  }

  bool isLoggedIn() => _prefs.getBool(AppConstants.isLoggedInKey) ?? false;
  String? getToken() => _prefs.getString(AppConstants.tokenKey);

  Future<User> updateProfile({
    String? fullName,
    String? phoneNumber,
  }) async {
    final data = <String, dynamic>{};
    if (fullName != null) data['fullName'] = fullName.trim();
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber.trim();

    final response = await _httpService.put<Map<String, dynamic>>(
      ApiConfig.updateUserProfile,
      data: data,
    );
    return User.fromJson(response['data'] ?? response);
  }
}

// ─── MODÈLES RÉPONSE AUTH ────────────────────────────────────────────────────

class AuthResponse {
  final User user;
  final String accessToken;
  final String? refreshToken;

  AuthResponse({
    required this.user,
    required this.accessToken,
    this.refreshToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json['user'] ?? {}),
        accessToken: json['access_token'] ?? '',
        refreshToken: json['refresh_token'],
      );
}