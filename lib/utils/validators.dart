import '../config/app_constants.dart';

/// Validation Helper Class
class Validators {
  /// Valider l'email
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppConstants.emailRequiredMsg;
    }
    final emailRegex = RegExp(AppConstants.emailRegex);
    if (!emailRegex.hasMatch(email)) {
      return AppConstants.emailInvalidMsg;
    }
    return null;
  }

  /// Valider le mot de passe
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppConstants.passwordRequiredMsg;
    }
    if (password.length < 8) {
      return AppConstants.passwordMinLengthMsg;
    }
    return null;
  }

  /// Valider la confirmation du mot de passe
  static String? validatePasswordMatch(String? password, String? confirmPassword) {
    final passwordError = validatePassword(password);
    if (passwordError != null) return passwordError;

    if (password != confirmPassword) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  /// Valider le nom
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return AppConstants.nameRequiredMsg;
    }
    if (name.length < 2) {
      return 'Le nom doit contenir au moins 2 caractères';
    }
    return null;
  }

  /// Valider le numéro de téléphone
  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return AppConstants.phoneRequiredMsg;
    }
    final phoneRegex = RegExp(AppConstants.phoneRegex);
    if (!phoneRegex.hasMatch(phone)) {
      return 'Numéro de téléphone invalide';
    }
    return null;
  }

  /// Valider le code OTP
  static String? validateOTP(String? otp) {
    if (otp == null || otp.isEmpty) {
      return 'Code OTP requis';
    }
    if (otp.length != 6 || !otp.contains(RegExp(r'^[0-9]{6}$'))) {
      return 'Code OTP invalide (6 chiffres)';
    }
    return null;
  }

  /// Valider le code promo
  static String? validatePromoCode(String? code) {
    if (code == null || code.isEmpty) {
      return 'Code promo requis';
    }
    if (code.length < 3) {
      return 'Code promo trop court';
    }
    return null;
  }

  /// Valider le titre d'événement
  static String? validateEventTitle(String? title) {
    if (title == null || title.isEmpty) {
      return 'Titre d\'événement requis';
    }
    if (title.length < 3) {
      return 'Le titre doit contenir au moins 3 caractères';
    }
    if (title.length > 100) {
      return 'Le titre ne doit pas dépasser 100 caractères';
    }
    return null;
  }

  /// Valider la description
  static String? validateDescription(String? description) {
    if (description == null || description.isEmpty) {
      return 'Description requise';
    }
    if (description.length < 10) {
      return 'La description doit contenir au moins 10 caractères';
    }
    return null;
  }

  /// Valider le lieu
  static String? validateLocation(String? location) {
    if (location == null || location.isEmpty) {
      return 'Lieu requis';
    }
    if (location.length < 2) {
      return 'Le lieu doit contenir au moins 2 caractères';
    }
    return null;
  }

  /// Valider le prix
  static String? validatePrice(String? price) {
    if (price == null || price.isEmpty) {
      return 'Prix requis';
    }
    try {
      final priceValue = double.parse(price);
      if (priceValue <= 0) {
        return 'Le prix doit être supérieur à 0';
      }
    } catch (e) {
      return 'Prix invalide';
    }
    return null;
  }

  /// Valider la quantité
  static String? validateQuantity(String? quantity) {
    if (quantity == null || quantity.isEmpty) {
      return 'Quantité requise';
    }
    try {
      final qty = int.parse(quantity);
      if (qty <= 0) {
        return 'La quantité doit être supérieur à 0';
      }
    } catch (e) {
      return 'Quantité invalide';
    }
    return null;
  }

  /// Valider la date (doit être future)
  static String? validateFutureDate(DateTime? date) {
    if (date == null) {
      return 'Date requise';
    }
    if (date.isBefore(DateTime.now())) {
      return 'La date doit être dans le futur';
    }
    return null;
  }

  /// Valider que la date fin est après la date début
  static String? validateDateRange(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) {
      return 'Dates requises';
    }
    if (endDate.isBefore(startDate)) {
      return 'La date de fin doit être après la date de début';
    }
    return null;
  }
}
