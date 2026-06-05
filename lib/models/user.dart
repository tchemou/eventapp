import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// ── Convertisseur roles : [{name: ACHETEUR}] → ["ACHETEUR"] ──────────────
class _RolesConverter implements JsonConverter<List<String>, dynamic> {
  const _RolesConverter();

  @override
  List<String> fromJson(dynamic json) {
    if (json == null) return [];
    if (json is List) {
      return json.map((e) {
        if (e is String) return e;
        if (e is Map) return (e['name'] ?? e['role'] ?? '').toString();
        return e.toString();
      }).toList();
    }
    return [];
  }

  @override
  dynamic toJson(List<String> roles) => roles;
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? email,
    String? fullName,       // ✅ champ serveur
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImage,
    String? bio,
    String? status,         // ✅ champ serveur (ACTIF)
    @_RolesConverter() @Default([]) List<String> roles,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required User user,
    @JsonKey(name: 'access_token') required String accessToken,  // ✅ snake_case
    @JsonKey(name: 'refresh_token') String? refreshToken,        // ✅ snake_case
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phoneNumber,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}

@freezed
class OtpRequest with _$OtpRequest {
  const factory OtpRequest({
    required String email,
    required String otp,
  }) = _OtpRequest;

  factory OtpRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestFromJson(json);
}