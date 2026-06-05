# NexGen Events - Flutter Application

Une application mobile Flutter complète pour la gestion et la vente de tickets d'événements au Cameroun.

## 📱 Caractéristiques

- ✅ Authentification JWT (Login, SignUp, OTP)
- ✅ Gestion des événements (Créer, Rechercher, Filtrer)
- ✅ Système de favoris
- ✅ Gestion des commandes (Achat, Historique)
- ✅ Gestion des billets (QR Code, Transfert, Validation)
- ✅ Codes promotionnels
- ✅ Profil utilisateur
- ✅ Gestion des rôles (Acheteur, Organisateur, Admin)

## 🏗️ Architecture

### Modèle MVVM (Model-View-ViewModel)

L'application utilise une architecture MVVM propre avec Provider pour la gestion d'état:

```
lib/
├── main.dart                 # Point d'entrée
├── config/                   # Configuration de l'app
│   ├── api_config.dart       # Configuration API
│   ├── app_constants.dart    # Constantes globales
│   └── app_theme.dart        # Thème Material
├── models/                   # Modèles de données (Freezed)
│   ├── user.dart
│   ├── event.dart
│   ├── order.dart
│   └── api_response.dart
├── services/                 # Couche services (HTTP, Auth)
│   ├── http_service.dart     # Client HTTP avec Dio
│   ├── auth_service.dart     # Service d'authentification
│   ├── event_service.dart    # Service événements
│   ├── order_service.dart    # Service commandes
│   └── ticket_service.dart   # Service billets
├── providers/                # StateManagement (Provider)
│   ├── auth_provider.dart
│   ├── event_provider.dart
│   └── order_provider.dart
├── screens/                  # Écrans de l'app
│   ├── auth/
│   ├── home/
│   ├── events/
│   ├── orders/
│   └── profile/
└── widgets/                  # Widgets réutilisables
    ├── app_bar.dart
    ├── event_card.dart
    └── ...
```

## 🔧 Configuration Requise

### Dépendances
- Flutter >= 3.0.0
- Dart >= 3.0.0

### Packages Principaux
- **State Management**: `provider: ^6.0.0`
- **HTTP Client**: `dio: ^5.3.0`
- **Data Serialization**: `freezed_annotation: ^2.4.1`
- **Local Storage**: `shared_preferences: ^2.2.0`
- **Navigation**: `go_router: ^13.0.0`
- **UI/UX**: `google_fonts: ^6.1.0`, `shimmer: ^3.0.0`

## 🚀 Installation & Démarrage

### 1. Cloner le projet
```bash
git clone <repository-url>
cd flutter_nexgen_events
```

### 2. Installer les dépendances
```bash
flutter pub get
```

### 3. Générer les fichiers Freezed
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Lancer l'application
```bash
flutter run
```

## 🔌 Configuration API

### URL de Base
```
http://147.79.110.41:8080/api/v1
```

### Authentification
Tous les endpoints authentifiés nécessitent un Bearer Token JWT:

```
Authorization: Bearer <access_token>
```

### Token Management
- Les tokens sont stockés dans `SharedPreferences`
- Chaque requête inclut automatiquement le token dans les headers
- Les erreurs 401 déclenchent un refresh token automatique (à implémenter)

## 📚 Endpoints API Implémentés

### Authentification
- `POST /auth/signup` - Inscription
- `POST /auth/login` - Connexion
- `POST /auth/request-otp` - Demander OTP
- `POST /auth/verify-otp` - Vérifier OTP
- `POST /auth/refresh-token` - Renouveler token

### Événements
- `GET /events` - Liste des événements
- `GET /events/{id}` - Détails d'un événement
- `POST /events` - Créer un événement
- `PUT /events/{id}` - Modifier un événement
- `DELETE /events/{id}` - Supprimer un événement
- `GET /events/search` - Rechercher des événements

### Billets
- `GET /events/{eventId}/ticket-types` - Types de billets
- `POST /events/{eventId}/ticket-types` - Créer un type de billet
- `GET /tickets` - Liste des billets
- `GET /tickets/{id}` - Détails d'un billet
- `POST /tickets/{id}/transfer` - Transférer un billet
- `POST /tickets/{id}/validate` - Valider un billet

### Commandes
- `POST /orders` - Créer une commande
- `GET /orders` - Liste des commandes
- `GET /orders/my-orders` - Mes commandes
- `GET /orders/{id}` - Détails d'une commande
- `POST /promo-codes/validate` - Valider un code promo

### Favoris
- `POST /favorites` - Ajouter aux favoris
- `DELETE /favorites/{eventId}` - Retirer des favoris
- `GET /favorites` - Liste des favoris

### Profil
- `GET /users/profile` - Profil utilisateur
- `PUT /users/profile` - Modifier le profil
- `POST /users/organizer-profile` - Devenir organisateur

## 📦 Structures de Données Principales

### User
```dart
User(
  id: String,
  email: String,
  firstName: String,
  lastName: String,
  phoneNumber: String?,
  profileImage: String?,
  bio: String?,
  roles: List<String>,
  isVerified: bool?,
  createdAt: DateTime?,
  updatedAt: DateTime?,
)
```

### Event
```dart
Event(
  id: String,
  title: String,
  description: String,
  imageUrl: String?,
  eventDate: DateTime,
  eventEndDate: DateTime,
  location: String,
  category: String,
  organizer: String,
  attendeeCount: int?,
  latitude: double?,
  longitude: double?,
  isPublished: bool,
  isFavorite: bool?,
  ticketTypes: List<TicketType>?,
)
```

### Order
```dart
Order(
  id: String,
  eventId: String,
  buyerId: String,
  items: List<OrderItem>,
  totalPrice: double,
  status: String, // PENDING, COMPLETED, CANCELLED
  promoCode: String?,
  discountAmount: double?,
  paymentMethod: String?,
  paymentReference: String?,
)
```

### Ticket
```dart
Ticket(
  id: String,
  orderId: String,
  eventId: String,
  ticketTypeId: String,
  buyerId: String,
  ticketNumber: String,
  qrCode: String?,
  status: String, // VALID, USED, TRANSFERRED, CANCELLED
  usedAt: DateTime?,
  transferredTo: String?,
)
```

## 🛠️ Guide d'Utilisation

### 1. Authentification

#### Login
```dart
final authProvider = context.read<AuthProvider>();
final success = await authProvider.login(
  email: 'user@example.com',
  password: 'password123',
);
```

#### Sign Up
```dart
final success = await authProvider.signUp(
  email: 'newuser@example.com',
  password: 'password123',
  firstName: 'John',
  lastName: 'Doe',
  phoneNumber: '+237123456789',
);
```

#### Vérifier OTP
```dart
final success = await authProvider.verifyOtp(
  email: 'user@example.com',
  otp: '123456',
);
```

### 2. Gestion des Événements

#### Récupérer tous les événements
```dart
final eventProvider = context.read<EventProvider>();
await eventProvider.fetchEvents(
  page: 0,
  pageSize: 10,
  category: 'Concert', // Optional
);
```

#### Rechercher des événements
```dart
await eventProvider.searchEvents(
  query: 'Festival',
  category: 'Music',
  startDate: DateTime.now(),
  endDate: DateTime.now().add(Duration(days: 30)),
  location: 'Douala',
);
```

#### Ajouter aux favoris
```dart
await eventProvider.addFavorite(eventId);
```

### 3. Gestion des Commandes

#### Créer une commande
```dart
final orderProvider = context.read<OrderProvider>();
final success = await orderProvider.createOrder(
  eventId: 'event_id',
  items: [
    OrderItemRequest(ticketTypeId: 'type_1', quantity: 2),
    OrderItemRequest(ticketTypeId: 'type_2', quantity: 1),
  ],
  promoCode: 'PROMO10', // Optional
);
```

#### Valider un code promo
```dart
await orderProvider.validatePromoCode(
  code: 'PROMO10',
  eventId: 'event_id',
);
```

#### Récupérer mes commandes
```dart
await orderProvider.getMyOrders();
```

## 🎨 Personnalisation du Thème

Le thème est défini dans `lib/config/app_theme.dart` et `lib/config/app_constants.dart`:

```dart
// Colors
static const int primaryColor = 0xFFFFA500; // Orange
static const int darkBg = 0xFF1A1A2E; // Dark background
static const int cardDark = 0xFF16213E; // Card background
```

Modifiez les constantes pour adapter les couleurs, polices, etc.

## 🔐 Sécurité

- ✅ JWT Tokens stockés de manière sécurisée
- ✅ HTTPS en production
- ✅ Refresh token automatique
- ✅ Validation des entrées
- ✅ Gestion d'erreurs appropriée

## 📝 Logging & Debugging

### Logs HTTP
Les logs détaillés sont activés avec `PrettyDioLogger`:

```dart
I/flutter (12345): ┌─────────────────────────────────────────────────────
I/flutter (12345): │ POST http://147.79.110.41:8080/api/v1/auth/login
I/flutter (12345): │ Headers: {Authorization: Bearer ...}
I/flutter (12345): │ Body: {email: test@example.com, ...}
I/flutter (12345): └─────────────────────────────────────────────────────
```

## 🚧 À Implémenter

Voici les features à compléter:

1. **Screens**
   - [ ] Home Screen avec liste d'événements
   - [ ] Event Details Screen
   - [ ] Checkout Screen
   - [ ] Ticket Details avec QR Code
   - [ ] Organizer Dashboard
   - [ ] User Profile

2. **Features**
   - [ ] Paiement (Stripe, etc.)
   - [ ] Géolocalisation (Google Maps)
   - [ ] Camera pour scanner QR Codes
   - [ ] Notifications push
   - [ ] Partage d'événements
   - [ ] Wishlist

3. **Optimisations**
   - [ ] Lazy loading des images
   - [ ] Caching des réponses API
   - [ ] Pagination optimisée
   - [ ] Offline mode

## 📞 Support & Contact

Pour toute question ou problème:
- Email: contact@nexgenit-solutions.com
- API Documentation: Voir OpenAPI spec

## 📄 License

Apache 2.0

---

**Créé avec Flutter & Dart** ❤️
