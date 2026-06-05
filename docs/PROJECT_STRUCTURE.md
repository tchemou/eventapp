# Structure du Projet Flutter NexGen Events

Documentation complète de l'architecture et la structure du projet.

## 📂 Arborescence du Projet

```
flutter_nexgen_events/
│
├── android/                          # Fichiers de configuration Android
│   ├── app/
│   ├── gradle/
│   └── settings.gradle
│
├── ios/                              # Fichiers de configuration iOS
│   ├── Runner/
│   └── Podfile
│
├── lib/                              # Code source principal
│   │
│   ├── main.dart                     # Point d'entrée de l'application
│   │
│   ├── config/                       # Configuration de l'application
│   │   ├── api_config.dart           # Configuration des endpoints API
│   │   ├── app_constants.dart        # Constantes (couleurs, messages, clés)
│   │   └── app_theme.dart            # Thème Material (dark theme)
│   │
│   ├── models/                       # Modèles de données (Freezed)
│   │   ├── user.dart                 # Modèle User, AuthResponse, LoginRequest
│   │   ├── event.dart                # Modèle Event, TicketType, FilterParams
│   │   ├── order.dart                # Modèle Order, Ticket, Requests
│   │   └── api_response.dart         # ApiResponse, ApiError, Pagination
│   │
│   ├── services/                     # Couche Services (Business Logic)
│   │   ├── http_service.dart         # Client HTTP Dio avec interceptors
│   │   ├── auth_service.dart         # Service d'authentification (SignUp, Login, OTP)
│   │   ├── event_service.dart        # Service pour les événements
│   │   ├── order_service.dart        # Service pour les commandes
│   │   └── ticket_service.dart       # Service pour les billets
│   │
│   ├── providers/                    # State Management (Provider)
│   │   ├── auth_provider.dart        # Gestion de l'authentification & profil
│   │   ├── event_provider.dart       # Gestion des événements & favoris
│   │   └── order_provider.dart       # Gestion des commandes & billets
│   │
│   ├── screens/                      # Écrans (UI)
│   │   ├── auth/
│   │   │   └── login_screen.dart     # Écran de connexion
│   │   ├── home/
│   │   │   └── home_screen.dart      # Écran d'accueil (À créer)
│   │   ├── events/
│   │   │   ├── events_list_screen.dart
│   │   │   ├── event_details_screen.dart
│   │   │   └── search_screen.dart
│   │   ├── orders/
│   │   │   ├── cart_screen.dart
│   │   │   ├── checkout_screen.dart
│   │   │   └── order_history_screen.dart
│   │   ├── tickets/
│   │   │   ├── tickets_screen.dart
│   │   │   └── ticket_details_screen.dart
│   │   └── profile/
│   │       └── profile_screen.dart
│   │
│   ├── widgets/                      # Widgets réutilisables (Components)
│   │   ├── app_bar_widget.dart
│   │   ├── event_card.dart
│   │   ├── ticket_card.dart
│   │   ├── order_item.dart
│   │   ├── loading_shimmer.dart
│   │   ├── error_widget.dart
│   │   └── empty_state.dart
│   │
│   └── utils/                        # Utilitaires
│       ├── extensions.dart           # Extensions sur String, DateTime, List, etc.
│       └── validators.dart           # Validations (email, password, OTP, etc.)
│
├── assets/                           # Ressources statiques
│   ├── images/                       # Images PNG, JPG
│   ├── icons/                        # Icônes SVG
│   ├── animations/                   # Fichiers Lottie
│   └── fonts/                        # Polices personnalisées
│
├── test/                             # Tests unitaires & intégration
│   ├── unit/
│   ├── widget/
│   └── integration/
│
├── docs/                             # Documentation
│   ├── API_REFERENCE.md              # Référence complète de l'API
│   ├── SETUP_GUIDE.md                # Guide d'installation & configuration
│   ├── PROJECT_STRUCTURE.md          # Ce fichier
│   └── ARCHITECTURE.md               # Architecture détaillée
│
├── pubspec.yaml                      # Dépendances & configuration du projet
├── pubspec.lock                      # Fichier de verrouillage des versions
├── analysis_options.yaml             # Configuration du linter
├── README.md                         # Documentation principale
└── .gitignore                        # Fichiers à ignorer par Git
```

## 🏗️ Architecture en Couches

### 1. **Couche Modèles (Models)**
Contient les structures de données sérialisées avec Freezed:

```
Models/
├── User                    # Utilisateur, AuthResponse, LoginRequest
├── Event                   # Événement, TicketType, FilterParams
├── Order                   # Commande, Ticket, OrderItem
└── ApiResponse             # Wrappers pour réponses API
```

**Exemple:**
```dart
@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String title,
    required DateTime eventDate,
    // ...
  }) = _Event;
  
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
```

### 2. **Couche Services (Services)**
Gère la logique métier et les appels API:

```
Services/
├── HttpService              # Client HTTP (Dio avec interceptors)
├── AuthService              # Authentification (signup, login, OTP)
├── EventService             # Gestion des événements
├── OrderService             # Gestion des commandes
└── TicketService            # Gestion des billets
```

**Responsabilités:**
- Effectuer les appels API
- Sérialiser/désérialiser les données
- Gérer les tokens
- Gérer les sessions

### 3. **Couche Providers (State Management)**
Utilise Provider pour la gestion d'état:

```
Providers/
├── AuthProvider             # État de l'authentification
├── EventProvider            # État des événements
└── OrderProvider            # État des commandes
```

**Responsabilités:**
- Exposer les services aux Screens
- Gérer l'état de l'application
- Notifier les listeners des changements
- Gérer le loading, erreurs, data

### 4. **Couche Screens (UI)**
Présentations de l'application:

```
Screens/
├── auth/                    # Authentification
├── home/                    # Accueil
├── events/                  # Événements
├── orders/                  # Commandes & paiement
├── tickets/                 # Mes billets
└── profile/                 # Profil utilisateur
```

### 5. **Couche Widgets**
Composants réutilisables:

```
Widgets/
├── AppBar                   # Barre d'en-tête personnalisée
├── EventCard                # Carte d'événement
├── TicketCard               # Carte de billet
├── LoadingShimmer           # Placeholder de chargement
├── ErrorWidget              # Affichage des erreurs
└── EmptyState               # État vide
```

## 🔄 Flux de Données

### Exemple: Authentification

```
LoginScreen
    ↓ (utilisateur tape email/password)
    ↓
AuthProvider.login()
    ↓ (appel le service)
    ↓
AuthService.login()
    ↓ (effectue l'appel HTTP)
    ↓
HttpService.post()
    ↓ (envoie à API)
    ↓
API Backend
    ↓ (retourne le token)
    ↓
HttpService (retourne la réponse)
    ↓
AuthService (parse et sauvegarde le token)
    ↓
AuthProvider (met à jour l'état)
    ↓
Consumer<AuthProvider> (rebuild le widget)
    ↓
NaviguerVers HomeScreen
```

## 🔌 Intégration Services

### 1. HttpService (Client HTTP)
```dart
// Initialisation dans main.dart
final httpService = HttpService();

// Utilisation dans un service
await httpService.post<Map>(endpoint, data: data);
```

**Features:**
- ✅ Interceptors pour les headers
- ✅ Gestion automatique des erreurs
- ✅ Logging détaillé (PrettyDioLogger)
- ✅ Timeouts configurables
- ✅ Support multipart/form-data

### 2. AuthService
```dart
// Dépend de HttpService
class AuthService {
  final HttpService _httpService;
  
  // Utilise SharedPreferences pour stocker tokens
  late SharedPreferences _prefs;
}
```

**Méthodes principales:**
- `signUp()` - Inscription
- `login()` - Connexion
- `requestOtp()` - Demander OTP
- `verifyOtp()` - Vérifier OTP
- `refreshToken()` - Renouveler token
- `logout()` - Déconnexion

### 3. EventService
```dart
class EventService {
  final HttpService _httpService;
  
  Future<List<Event>> getEvents() => _httpService.get(...);
  Future<Event> getEventById(String id) => _httpService.get(...);
  // etc.
}
```

### 4. Providers (Provider Pattern)
```dart
class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  
  // État
  User? _user;
  bool _isLoading = false;
  String? _error;
  
  // Getters
  User? get user => _user;
  bool get isLoading => _isLoading;
  
  // Méthodes publiques
  Future<bool> login(...) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final response = await _authService.login(...);
      _user = response.user;
      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    }
  }
}
```

## 🎯 Utilisation dans les Screens

### Exemple: LoginScreen

```dart
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return Column(
            children: [
              TextField(
                controller: _emailController,
              ),
              TextField(
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () async {
                  final success = await authProvider.login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  
                  if (success) {
                    // Navigate to home
                  }
                },
                child: authProvider.isLoading 
                  ? CircularProgressIndicator() 
                  : Text('Login'),
              ),
            ],
          );
        },
      ),
    );
  }
}
```

## 📊 Diagramme UML Simplifié

```
┌─────────────────────────────────────────────────────┐
│                   PRESENTATION                      │
│  (Screens, Widgets, MaterialApp)                    │
└────────────────────┬────────────────────────────────┘
                     │ Consumer<Provider>
                     ↓
┌─────────────────────────────────────────────────────┐
│              STATE MANAGEMENT                       │
│  (AuthProvider, EventProvider, OrderProvider)       │
└────────────────────┬────────────────────────────────┘
                     │ appelle
                     ↓
┌─────────────────────────────────────────────────────┐
│                   SERVICES                          │
│  (AuthService, EventService, OrderService)          │
└────────────────────┬────────────────────────────────┘
                     │ utilise
                     ↓
┌─────────────────────────────────────────────────────┐
│              HTTP CLIENT                            │
│              (HttpService - Dio)                    │
└────────────────────┬────────────────────────────────┘
                     │ envoie requêtes à
                     ↓
┌─────────────────────────────────────────────────────┐
│              BACKEND API                            │
│      http://147.79.110.41:8080/api/v1               │
└─────────────────────────────────────────────────────┘
```

## 🔐 Gestion des Tokens

### Flux d'authentification

1. **Login** → API retourne `accessToken` + `refreshToken`
2. **Stockage** → Tokens sauvegardés dans `SharedPreferences`
3. **Utilisation** → HttpService ajoute le token dans les headers
4. **Expiration** → Erreur 401 → Refresh token automatique
5. **Logout** → Tokens supprimés de `SharedPreferences`

## 🧪 Patterns & Best Practices

### 1. **Separation of Concerns**
- Models: Structures de données
- Services: Logique métier
- Providers: Gestion d'état
- Screens: Interface utilisateur

### 2. **Error Handling**
```dart
try {
  // Appel service
} on ApiError catch (e) {
  // Erreur API (réseau, serveur, etc.)
  _error = e.message;
} catch (e) {
  // Erreur non prévue
  _error = 'Erreur inconnue';
}
```

### 3. **Loading States**
```dart
bool _isLoading = false;

// Avant appel
_isLoading = true;
notifyListeners();

// Après appel
_isLoading = false;
notifyListeners();
```

### 4. **Form Validation**
```dart
// Utiliser les validators
if (_formKey.currentState!.validate()) {
  // Formulaire valide
}

// Dans TextFormField
validator: (value) => Validators.validateEmail(value),
```

## 📈 Scalabilité

Pour ajouter une nouvelle fonctionnalité:

1. **Créer le Modèle** (models/)
2. **Créer le Service** (services/)
3. **Créer le Provider** (providers/)
4. **Créer les Screens** (screens/)
5. **Créer les Widgets** (widgets/)

**Exemple: Ajouter gestion des notifications**

```
1. models/notification.dart
   └─ Notification model

2. services/notification_service.dart
   └─ NotificationService (appels API)

3. providers/notification_provider.dart
   └─ NotificationProvider (état)

4. screens/notifications/
   └─ NotificationsScreen

5. widgets/
   └─ NotificationCard, NotificationBadge
```

## 🔗 Dépendances Principales

| Package | Version | Utilisation |
|---------|---------|------------|
| provider | ^6.0.0 | State management |
| dio | ^5.3.0 | HTTP client |
| freezed_annotation | ^2.4.1 | Data models |
| json_annotation | ^4.8.1 | Serialization |
| shared_preferences | ^2.2.0 | Local storage |
| intl | ^0.19.0 | Internationalization |
| google_fonts | ^6.1.0 | Fonts |

## 📝 Conventions de Nommage

### Fichiers
- **Modèles**: `snake_case.dart` (ex: `user.dart`, `event.dart`)
- **Services**: `snake_case_service.dart` (ex: `auth_service.dart`)
- **Providers**: `snake_case_provider.dart` (ex: `auth_provider.dart`)
- **Screens**: `snake_case_screen.dart` (ex: `login_screen.dart`)
- **Widgets**: `snake_case_widget.dart` ou `snake_case.dart` (ex: `event_card.dart`)

### Classe & Variables
- **Classes**: `PascalCase` (ex: `AuthProvider`, `EventService`)
- **Variables privées**: `_camelCase` (ex: `_isLoading`, `_user`)
- **Constantes**: `camelCase` ou `UPPER_SNAKE_CASE` (ex: `appName`, `API_TIMEOUT`)

### Méthodes
- **Publiques**: `camelCase` (ex: `login()`, `fetchEvents()`)
- **Privées**: `_camelCase` (ex: `_validateEmail()`, `_handleError()`)

---

**Document créé pour l'équipe de développement NexGen Events** 🚀
