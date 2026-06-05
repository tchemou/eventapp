import 'package:intl/intl.dart';

/// String Extensions
extension StringExtensions on String {
  /// Vérifier si c'est un email valide
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Vérifier si c'est un numéro de téléphone valide
  bool get isValidPhone {
    final phoneRegex = RegExp(r'^\+?[0-9]{9,15}$');
    return phoneRegex.hasMatch(this);
  }

  /// Vérifier si le mot de passe est fort
  bool get isStrongPassword {
    return length >= 8 &&
        contains(RegExp(r'[A-Z]')) &&
        contains(RegExp(r'[a-z]')) &&
        contains(RegExp(r'[0-9]'));
  }

  /// Capitaliser la première lettre
  String get capitalizeFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Capitaliser chaque mot
  String get capitalizeEachWord {
    return split(' ').map((word) => word.capitalizeFirst).join(' ');
  }

  /// Tronquer le texte
  String truncate({int length = 50, String ellipsis = '...'}) {
    if (this.length <= length) return this;
    return substring(0, length) + ellipsis;
  }

  /// Supprimer les espaces inutiles
  String get cleanWhitespace {
    return trim().replaceAll(RegExp(r'\s+'), ' ');
  }
}

/// DateTime Extensions
extension DateTimeExtensions on DateTime {
  /// Obtenir la date formatée en français
  String get formattedDate {
    return DateFormat('dd MMMM yyyy', 'fr_FR').format(this);
  }

  /// Obtenir l'heure formatée
  String get formattedTime {
    return DateFormat('HH:mm', 'fr_FR').format(this);
  }

  /// Obtenir la date et l'heure
  String get formattedDateTime {
    return DateFormat('dd MMMM yyyy à HH:mm', 'fr_FR').format(this);
  }

  /// Obtenir le jour de la semaine
  String get dayOfWeek {
    const days = [
      'Lundi',
      'Mardi',
      'Mercredi',
      'Jeudi',
      'Vendredi',
      'Samedi',
      'Dimanche'
    ];
    return days[weekday - 1];
  }

  /// Vérifier si c'est aujourd'hui
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Vérifier si c'est demain
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Vérifier si l'événement est en cours
  bool get isOngoing {
    final now = DateTime.now();
    return now.isAfter(this);
  }

  /// Obtenir le temps jusqu'à l'événement
  String get timeUntilEvent {
    final now = DateTime.now();
    if (isToday) {
      final hours = difference(now).inHours;
      return 'Aujourd\'hui dans $hours h';
    } else if (isTomorrow) {
      return 'Demain';
    } else {
      final days = difference(now).inDays;
      return 'Dans $days jours';
    }
  }
}

/// Double Extensions
extension DoubleExtensions on double {
  /// Formater comme devise (FCFA)
  String get formattedCurrency {
    return '${toStringAsFixed(0)} FCFA';
  }

  /// Formater avec 2 décimales
  String get formattedDecimal {
    return toStringAsFixed(2);
  }

  /// Vérifier si c'est positif
  bool get isPositive => this > 0;

  /// Vérifier si c'est négatif
  bool get isNegative => this < 0;

  /// Vérifier si c'est zéro
  bool get isZero => this == 0;
}

/// Int Extensions
extension IntExtensions on int {
  /// Formater comme devise
  String get formattedCurrency {
    return '$this FCFA';
  }

  /// Formater comme prix avec séparateur
  String get formattedPrice {
    final formatter = NumberFormat('#,##0', 'fr_FR');
    return '${formatter.format(this)} FCFA';
  }

  /// Obtenir le nom du mois
  String get monthName {
    const months = [
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre'
    ];
    return months[this - 1];
  }
}

/// List Extensions
extension ListExtensions<T> on List<T> {
  /// Vérifier si la liste est vide
  bool get isEmpty => length == 0;

  /// Vérifier si la liste n'est pas vide
  bool get isNotEmpty => length > 0;

  /// Obtenir le premier élément ou null
  T? get firstOrNull => isEmpty ? null : first;

  /// Obtenir le dernier élément ou null
  T? get lastOrNull => isEmpty ? null : last;

  /// Diviser la liste en chunks
  List<List<T>> chunk(int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be > 0');

    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}

/// Map Extensions
extension MapExtensions<K, V> on Map<K, V> {
  /// Vérifier si la clé existe
  bool containsKey(K key) {
    return super.containsKey(key);
  }

  /// Obtenir une valeur avec une valeur par défaut
  V? getOrDefault(K key, V? defaultValue) {
    return containsKey(key) ? this[key] : defaultValue;
  }

  /// Obtenir une valeur en toute sécurité
  V? safeGet(K key) {
    try {
      return this[key];
    } catch (e) {
      return null;
    }
  }
}
