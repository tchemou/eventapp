# Guide de Configuration - NexGen Events Flutter

Guide complet pour configurer et démarrer l'application NexGen Events.

## 📋 Prérequis

### 1. Installer Flutter
- Télécharger Flutter depuis [flutter.dev](https://flutter.dev/docs/get-started/install)
- Version requise: Flutter >= 3.0.0
- Dart >= 3.0.0 (inclus avec Flutter)

### 2. IDE Recommandé
- **Android Studio** + plugin Flutter & Dart
- **VS Code** + extensions Flutter et Dart
- **Xcode** (pour iOS)

### 3. Dépendances de Développement
- Git
- Android SDK (API level 21+)
- Xcode (pour compilation iOS)

---

## 🚀 Installation Étape par Étape

### 1. Cloner le Projet
```bash
# Via Git
git clone https://github.com/your-repo/flutter_nexgen_events.git
cd flutter_nexgen_events

# Ou décompresser le ZIP
unzip flutter_nexgen_events.zip
cd flutter_nexgen_events
```

### 2. Installer les Dépendances
```bash
# Obtenir toutes les dépendances
flutter pub get

# Optionnel: Upgrade les packages
flutter pub upgrade
```

### 3. Générer les Fichiers Freezed
Les modèles utilisent Freezed pour la sérialisation. Il faut générer les fichiers:

```bash
# Générer les fichiers Freezed et json_serializable
flutter pub run build_runner build --delete-conflicting-outputs

# ou en mode watch (regenerate à chaque modification)
flutter pub run build_runner watch
```

### 4. Vérifier la Configuration Flutter
```bash
# Vérifier l'environnement
flutter doctor

# Résultat attendu:
# ✓ Flutter
# ✓ Android toolchain
# ✓ Xcode (pour iOS)
# ✓ VS Code or Android Studio
```

---

## 💻 Lancer l'Application

### Sur Émulateur/Appareil
```bash
# Lancer sur appareil connecté ou émulateur par défaut
flutter run

# Spécifier un device
flutter run -d <device_id>

# Lister les devices disponibles
flutter devices

# Lancer en mode release (production)
flutter run --release

# Lancer en mode profile (performance)
flutter run --profile
```

### Sur Web (optionnel)
```bash
# Activer le support web
flutter config --enable-web

# Lancer sur web
flutter run -d chrome

# Lancer sur Firefox
flutter run -d firefox
```

---

## 🔧 Configuration API

### 1. Modifier l'URL de Base
Fichier: `lib/config/api_config.dart`

```dart
class ApiConfig {
  static const String baseUrl = 'http://147.79.110.41:8080/api/v1';
  // Modifier cette URL si le backend change
}
```

### 2. Timeouts API
Vous pouvez ajuster les timeouts selon votre réseau:

```dart
class ApiConfig {
  static const int connectTimeout = 30000; // 30 secondes
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;
}
```

### 3. Logging HTTP
Pour désactiver les logs HTTP en production:

Fichier: `lib/services/http_service.dart`

```dart
// Commenter/retirer le bloc PrettyDioLogger
// _dio.interceptors.add(PrettyDioLogger(...));
```

---

## 📝 Structure des Fichiers

```
lib/
├── main.dart                      # Entrée de l'app
├── config/
│   ├── api_config.dart           # Config API
│   ├── app_constants.dart        # Constantes
│   └── app_theme.dart            # Thème Material
├── models/
│   ├── user.dart                 # Modèle utilisateur
│   ├── event.dart                # Modèle événement
│   ├── order.dart                # Modèle commande
│   └── api_response.dart         # Réponse API
├── services/
│   ├── http_service.dart         # Client HTTP
│   ├── auth_service.dart         # Service auth
│   ├── event_service.dart        # Service événements
│   ├── order_service.dart        # Service commandes
│   └── ticket_service.dart       # Service billets
├── providers/
│   ├── auth_provider.dart        # Provider auth
│   ├── event_provider.dart       # Provider événements
│   └── order_provider.dart       # Provider commandes
├── screens/
│   ├── auth/
│   │   └── login_screen.dart
│   ├── home/
│   ├── events/
│   ├── orders/
│   └── profile/
└── widgets/
    └── (components réutilisables)
```

---

## 🎨 Personnalisation

### Changer les Couleurs
Fichier: `lib/config/app_constants.dart`

```dart
static const int primaryColor = 0xFFFFA500; // Orange actuel
static const int darkBg = 0xFF1A1A2E;       // Fond sombre

// Modifier ces valeurs pour adapter les couleurs
```

### Changer les Polices
Fichier: `lib/config/app_theme.dart`

```dart
textTheme: GoogleFonts.poppinsTextTheme(
  ThemeData(brightness: Brightness.dark).textTheme,
),
// Remplacer 'poppins' par votre police favorite
```

### Changer le Nom de l'App
Fichier: `lib/config/app_constants.dart`

```dart
static const String appName = 'Event237';
static const String appSlogan = 'VOTRE BILLETTERIE CAMEROUNAISE';
```

Aussi dans `pubspec.yaml`:
```yaml
name: nexgen_events
description: "NexGen Events - Event Ticketing Application"
```

---

## 🧪 Tests

### Tester l'Authentification
```dart
// Dans main.dart ou un test file
final authProvider = context.read<AuthProvider>();

// Test login
bool success = await authProvider.login(
  email: 'test@example.com',
  password: 'password123',
);

print('Login: $success');
print('Error: ${authProvider.error}');
```

### Tester la Connexion API
```dart
// Vérifier les logs
// Les requêtes HTTP s'afficheront dans la console avec PrettyDioLogger
flutter logs | grep "PrettyDioLogger"
```

---

## 🚨 Dépannage Courant

### Erreur: "flutter not found"
```bash
# Ajouter Flutter au PATH
export PATH="$PATH:/path/to/flutter/bin"

# Ou installer Flutter correctement
# Voir: https://flutter.dev/docs/get-started/install
```

### Erreur: "Freezed files not generated"
```bash
# Régénérer les fichiers
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Erreur: "Cannot connect to API"
1. Vérifier la connexion Internet
2. Vérifier que le backend est actif: `http://147.79.110.41:8080/api/v1/events`
3. Modifier le baseUrl si le backend a changé d'adresse
4. Vérifier les logs HTTP dans la console

### Erreur: "Connection timeout"
Augmenter les timeouts dans `lib/config/api_config.dart`:
```dart
static const int connectTimeout = 60000; // 60 secondes
```

### Erreur: "Unauthorized (401)"
- Tokens expirés: Se reconnecter
- Token invalide: Vérifier le stockage local avec SharedPreferences
- Backend retourne 401: Vérifier les logs serveur

### Erreur de Build
```bash
# Nettoyer le build
flutter clean

# Régénérer les dépendances
flutter pub get

# Relancer
flutter run
```

---

## 📦 Construire pour Production

### Android APK/AAB
```bash
# APK pour tests
flutter build apk

# AAB pour Google Play
flutter build appbundle

# APK optimisé (split APKs)
flutter build apk --split-per-abi
```

### iOS IPA
```bash
# Construire pour iOS
flutter build ios

# Archive pour TestFlight/App Store
flutter build ios --release
```

### Web
```bash
# Construire pour web
flutter build web

# Fichiers générés dans: build/web/
```

---

## 🔐 Sécurité en Production

### 1. Variables d'Environnement
Créer un fichier `.env`:
```
API_BASE_URL=https://api.nexgenevents.com
API_KEY=your_api_key_here
```

Charger avec `flutter_dotenv`:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main async {
  await dotenv.load();
  runApp(const MyApp());
}
```

### 2. Désactiver les Logs en Production
```dart
// main.dart
if (kReleaseMode) {
  // Désactiver les logs
  _dio.interceptors.removeAt(0); // Retirer PrettyDioLogger
}
```

### 3. Sécuriser les Tokens
```dart
// Utiliser flutter_secure_storage pour les tokens sensibles
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();
await storage.write(key: 'token', value: token);
```

### 4. SSL Pinning (optionnel)
```dart
// Implémenter SSL pinning pour les requêtes API
// https://pub.dev/packages/dio#httpclientadapter
```

---

## 📱 Tester sur Appareil Réel

### Android
```bash
# Connecter un appareil via USB
# Activer mode développement et débogage USB

# Lancer l'app
flutter run

# Ou installer l'APK
adb install build/app/outputs/flutter-apk/app-release.apk
```

### iOS
```bash
# Connecter un appareil via USB
# Approuver l'appareil dans Xcode

# Lancer l'app
flutter run

# Ou installer avec Xcode
open ios/Runner.xcworkspace
```

---

## 🐛 Debugging

### Flutter DevTools
```bash
# Lancer DevTools
flutter pub global activate devtools
devtools

# Ou intégré dans IDE: Cmd+Shift+P -> "Flutter: Open DevTools"
```

### Console Logs
```bash
# Voir tous les logs
flutter logs

# Filtrer les logs
flutter logs | grep "YourTag"

# Imprimer des logs personnalisés
print('Mon message');
debugPrint('Debug: $message');
```

### Inspecteur Widget
```bash
# En cours de lecture: Press 'w' pour toggle l'inspecteur
# Ou ajouter un bouton dans votre UI:
if (kDebugMode) {
  // Afficher le widget inspector
  WidgetsApp.debugShowWidgetInspectorOverride = true;
}
```

---

## 📚 Ressources Utiles

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Provider Package](https://pub.dev/packages/provider)
- [Dio Documentation](https://pub.dev/packages/dio)
- [Freezed Package](https://pub.dev/packages/freezed)
- [Go Router](https://pub.dev/packages/go_router)

---

## ✅ Checklist de Lancement

- [ ] Flutter installé et `flutter doctor` OK
- [ ] Dépendances téléchargées: `flutter pub get`
- [ ] Fichiers Freezed générés: `flutter pub run build_runner build`
- [ ] API configurée dans `api_config.dart`
- [ ] Backend actif et accessible
- [ ] Tests sur émulateur
- [ ] Tests sur appareil réel
- [ ] Version bump dans `pubspec.yaml`
- [ ] Build APK/AAB/IPA pour production
- [ ] Soumission sur app stores

---

## 📞 Support

En cas de problème:
1. Consulter les logs: `flutter logs`
2. Checker [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
3. Contacter: contact@nexgenit-solutions.com

---

**Bon développement!** 🚀
