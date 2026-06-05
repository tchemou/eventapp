import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

enum AuthStep { idle, otpSent, authenticated }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;

  AuthProvider(this._authService);

  User? _user;
  bool _isLoading  = false;
  String? _error;
  bool _isLoggedIn = false;
  bool _isNewUser  = false;  // ✅ nouveau
  AuthStep _step   = AuthStep.idle;
  String? _pendingPhone;
  String? _devOtpCode;

  User?     get user         => _user;
  bool      get isLoading    => _isLoading;
  String?   get error        => _error;
  bool      get isLoggedIn   => _isLoggedIn;
  bool      get isNewUser    => _isNewUser;   // ✅ nouveau
  AuthStep  get step         => _step;
  String?   get pendingPhone => _pendingPhone;
  String?   get devOtpCode   => _devOtpCode;

  Future<void> init() async {
    await _authService.init();
    _isLoggedIn = _authService.isLoggedIn();
    if (_isLoggedIn) _user = _authService.getCurrentUser();
    notifyListeners();
  }

  Future<bool> signupMobile({
    required String fullName,
    required String phoneNumber,
    required String email,
  }) async {
    _setLoading(true);
    try {
      await _authService.signupMobile(
        fullName: fullName,
        phoneNumber: phoneNumber,
        email: email,
      );
      _pendingPhone = phoneNumber;
      _step = AuthStep.otpSent;
      notifyListeners();
      return true;
    } catch (e) {
      _setError(_parseError(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> loginMobile(String phoneNumber) async {
    _setLoading(true);
    try {
      await _authService.loginMobile(phoneNumber);
      _pendingPhone = phoneNumber;
      _step = AuthStep.otpSent;
      notifyListeners();
      return true;
    } catch (e) {
      _setError(_parseError(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> verifyOtp({
    required String phoneNumber,
    required String codeOtp,
    bool isSignup = false,   // ✅ nouveau
  }) async {
    _setLoading(true);
    try {
      final response = await _authService.verifyOtpMobile(
        phoneNumber: phoneNumber,
        codeOtp: codeOtp,
      );
      _user      = response.user;
      _isLoggedIn = true;
      _isNewUser  = isSignup;   // ✅ nouveau
      _step       = AuthStep.authenticated;
      _pendingPhone = null;
      notifyListeners();
      return true;
    } catch (e) {
      _setError(_parseError(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // ✅ Appelé quand l'utilisateur quitte WelcomeScreen
  void clearNewUser() {
    _isNewUser = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      await _authService.logout();
      _user       = null;
      _isLoggedIn = false;
      _isNewUser  = false;
      _step       = AuthStep.idle;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> updateProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) async {
    _setLoading(true);
    try {
      _user = await _authService.updateProfile(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      );
      notifyListeners();
      return true;
    } catch (e) {
      _setError(_parseError(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  bool hasRole(String role) => _user?.roles.contains(role) ?? false;
  bool get isOrganizer => hasRole('ORGANISATEUR');
  bool get isBuyer     => hasRole('ACHETEUR');
  bool get isAdmin     => hasRole('SUPER_ADMIN');

  void clearError() { _error = null; notifyListeners(); }

  void resetStep() {
    _step = AuthStep.idle;
    _pendingPhone = null;
    notifyListeners();
  }

  void _setLoading(bool v) { _isLoading = v; notifyListeners(); }
  void _setError(String msg) { _error = msg; notifyListeners(); }

  String _parseError(dynamic e) {
    final str = e.toString();
    if (str.contains('USER_NOT_FOUND'))    return 'Numéro non enregistré. Inscrivez-vous.';
    if (str.contains('INVALID_OTP'))       return 'Code OTP incorrect.';
    if (str.contains('OTP_EXPIRED'))       return 'Code expiré. Demandez un nouveau.';
    if (str.contains('TOO_MANY'))          return 'Trop de tentatives. Réessayez plus tard.';
    if (str.contains('already registered')) return 'Ce numéro est déjà utilisé.';
    return 'Une erreur est survenue. Réessayez.';
  }
}