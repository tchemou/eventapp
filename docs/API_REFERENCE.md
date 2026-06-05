# NexGen Events API Reference

Documentation complète des endpoints API pour l'intégration avec le backend NexGen Events.

## Base URL
```
http://147.79.110.41:8080/api/v1
```

## Authentication
Tous les endpoints protégés nécessitent un JWT Bearer Token dans le header:
```
Authorization: Bearer <access_token>
```

---

## 🔐 Authentification (Public)

### Sign Up
**POST** `/auth/signup`

Créer un nouveau compte utilisateur.

**Request:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "firstName": "John",
  "lastName": "Doe",
  "phoneNumber": "+237123456789"
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "User created successfully",
  "data": {
    "user": {
      "id": "user_id",
      "email": "user@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "phoneNumber": "+237123456789",
      "roles": ["ACHETEUR"]
    },
    "accessToken": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
```

---

### Login
**POST** `/auth/login`

Se connecter avec email et mot de passe.

**Request:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "user": {...},
    "accessToken": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
```

---

### Request OTP
**POST** `/auth/request-otp`

Demander un code OTP pour l'authentification.

**Request:**
```json
{
  "email": "user@example.com"
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "OTP sent to your email"
}
```

---

### Verify OTP
**POST** `/auth/verify-otp`

Vérifier le code OTP reçu.

**Request:**
```json
{
  "email": "user@example.com",
  "otp": "123456"
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "OTP verified",
  "data": {
    "user": {...},
    "accessToken": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
```

---

### Refresh Token
**POST** `/auth/refresh-token` (Protected)

Renouveler le JWT access token.

**Request:**
```json
{
  "refreshToken": "eyJhbGc..."
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "Token refreshed",
  "data": {
    "accessToken": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
```

---

## 📅 Événements

### List Events (Public)
**GET** `/events`

Récupérer la liste paginée des événements.

**Query Parameters:**
- `page` (integer, default: 0) - Numéro de la page
- `pageSize` (integer, default: 10) - Nombre d'événements par page
- `category` (string, optional) - Filtrer par catégorie
- `search` (string, optional) - Rechercher par titre

**Response (200):**
```json
{
  "success": true,
  "data": {
    "content": [
      {
        "id": "event_id",
        "title": "Festival de Musique",
        "description": "Un grand festival...",
        "imageUrl": "https://...",
        "eventDate": "2024-06-15T19:00:00Z",
        "eventEndDate": "2024-06-16T02:00:00Z",
        "location": "Douala",
        "category": "Music",
        "organizer": "Org Name",
        "organizerId": "org_id",
        "attendeeCount": 1500,
        "isPublished": true,
        "isFavorite": false
      }
    ],
    "page": 0,
    "pageSize": 10,
    "totalElements": 250,
    "totalPages": 25,
    "hasNext": true,
    "hasPrevious": false
  }
}
```

---

### Get Event Details (Public)
**GET** `/events/{id}`

Récupérer les détails d'un événement spécifique.

**Response (200):**
```json
{
  "success": true,
  "data": {
    "id": "event_id",
    "title": "Festival de Musique",
    "description": "...",
    "imageUrl": "https://...",
    "eventDate": "2024-06-15T19:00:00Z",
    "eventEndDate": "2024-06-16T02:00:00Z",
    "location": "Douala",
    "locationDetails": "Stade Ahmadou Ahidjo",
    "category": "Music",
    "organizer": "Org Name",
    "organizerId": "org_id",
    "attendeeCount": 1500,
    "latitude": 4.0411,
    "longitude": 9.7679,
    "isPublished": true,
    "isFavorite": false,
    "ticketTypes": [
      {
        "id": "type_id",
        "name": "VIP",
        "description": "Accès VIP",
        "price": 50000,
        "quantity": 100,
        "availableQuantity": 45
      }
    ]
  }
}
```

---

### Search Events (Public)
**GET** `/events/search`

Rechercher des événements avec filtres avancés.

**Query Parameters:**
- `query` (string, required) - Terme de recherche
- `category` (string, optional)
- `startDate` (ISO 8601, optional)
- `endDate` (ISO 8601, optional)
- `location` (string, optional)
- `page` (integer)
- `pageSize` (integer)

---

### Create Event (Protected, ORGANISATEUR)
**POST** `/events`

Créer un nouvel événement.

**Request:**
```json
{
  "title": "Nouveau Festival",
  "description": "Description de l'événement",
  "eventDate": "2024-08-15T19:00:00Z",
  "eventEndDate": "2024-08-16T02:00:00Z",
  "location": "Yaoundé",
  "locationDetails": "Palais Polyvalent",
  "category": "Music",
  "imageUrl": "https://..."
}
```

**Response (201):**
```json
{
  "success": true,
  "message": "Event created successfully",
  "data": {
    "id": "event_id",
    ...
  }
}
```

---

### Update Event (Protected, ORGANISATEUR)
**PUT** `/events/{id}`

Modifier un événement (propriétaire uniquement).

**Request:**
```json
{
  "title": "Titre modifié",
  "description": "..."
}
```

---

### Delete Event (Protected, ORGANISATEUR)
**DELETE** `/events/{id}`

Supprimer un événement (propriétaire uniquement).

---

## 🎫 Ticket Types (Public)

### List Ticket Types
**GET** `/events/{eventId}/ticket-types`

Récupérer les types de billets d'un événement.

**Response (200):**
```json
{
  "success": true,
  "data": [
    {
      "id": "type_id",
      "name": "Standard",
      "description": "Accès standard",
      "price": 10000,
      "quantity": 500,
      "availableQuantity": 250
    },
    {
      "id": "type_vip",
      "name": "VIP",
      "description": "Accès VIP",
      "price": 50000,
      "quantity": 100,
      "availableQuantity": 45
    }
  ]
}
```

---

### Create Ticket Type (Protected, ORGANISATEUR)
**POST** `/events/{eventId}/ticket-types`

Créer un type de billet pour un événement.

**Request:**
```json
{
  "name": "Platinum",
  "description": "Accès Platinum avec cadeaux",
  "price": 100000,
  "quantity": 50
}
```

---

## 🛒 Commandes

### Create Order (Protected, ACHETEUR)
**POST** `/orders`

Créer une nouvelle commande.

**Request:**
```json
{
  "eventId": "event_id",
  "items": [
    {
      "ticketTypeId": "type_id",
      "quantity": 2
    },
    {
      "ticketTypeId": "type_vip",
      "quantity": 1
    }
  ],
  "promoCode": "PROMO10",
  "paymentMethodId": "payment_method_id"
}
```

**Response (201):**
```json
{
  "success": true,
  "data": {
    "id": "order_id",
    "eventId": "event_id",
    "buyerId": "user_id",
    "items": [...],
    "totalPrice": 70000,
    "status": "PENDING",
    "promoCode": "PROMO10",
    "discountAmount": 7000,
    "paymentMethod": "STRIPE",
    "paymentReference": "pi_123...",
    "createdAt": "2024-05-20T10:30:00Z"
  }
}
```

---

### Get My Orders (Protected, ACHETEUR)
**GET** `/orders/my-orders`

Récupérer mes commandes.

**Query Parameters:**
- `page` (integer)
- `pageSize` (integer)

**Response (200):**
```json
{
  "success": true,
  "data": {
    "content": [
      {
        "id": "order_id",
        "eventId": "event_id",
        "totalPrice": 70000,
        "status": "COMPLETED",
        "createdAt": "2024-05-20T10:30:00Z"
      }
    ],
    "page": 0,
    "pageSize": 10,
    "totalElements": 15
  }
}
```

---

### Get Order Details (Protected)
**GET** `/orders/{id}`

Récupérer les détails d'une commande.

---

### Validate Promo Code (Protected, ACHETEUR)
**POST** `/promo-codes/validate`

Valider un code promotionnel.

**Request:**
```json
{
  "code": "PROMO10",
  "eventId": "event_id"
}
```

**Response (200):**
```json
{
  "success": true,
  "data": {
    "code": "PROMO10",
    "discountPercentage": 10,
    "discountAmount": 0,
    "isValid": true,
    "message": "Code valide"
  }
}
```

---

## 🎟️ Billets

### Get My Tickets (Protected)
**GET** `/tickets`

Récupérer mes billets.

**Query Parameters:**
- `page` (integer)
- `pageSize` (integer)

---

### Get Ticket Details (Protected)
**GET** `/tickets/{id}`

Récupérer les détails d'un billet.

**Response (200):**
```json
{
  "success": true,
  "data": {
    "id": "ticket_id",
    "orderId": "order_id",
    "eventId": "event_id",
    "ticketTypeId": "type_id",
    "buyerId": "user_id",
    "ticketNumber": "EVT-2024-001",
    "qrCode": "data:image/png;base64,...",
    "status": "VALID",
    "createdAt": "2024-05-20T10:30:00Z"
  }
}
```

---

### Transfer Ticket (Protected)
**POST** `/tickets/{id}/transfer`

Transférer un billet à un autre utilisateur.

**Request:**
```json
{
  "recipientEmail": "recipient@example.com"
}
```

---

### Validate Ticket (Protected, ORGANISATEUR)
**POST** `/tickets/{id}/validate`

Valider un billet à l'entrée (marquer comme utilisé).

---

## ❤️ Favoris (Protected)

### Add to Favorites
**POST** `/favorites`

Ajouter un événement aux favoris.

**Request:**
```json
{
  "eventId": "event_id"
}
```

---

### Remove from Favorites
**DELETE** `/favorites/{eventId}`

Retirer un événement des favoris.

---

### Get My Favorites
**GET** `/favorites`

Récupérer mes événements favoris.

---

## 👤 Profil Utilisateur (Protected)

### Get Profile
**GET** `/users/profile`

Récupérer mon profil utilisateur.

---

### Update Profile
**PUT** `/users/profile`

Modifier mon profil.

**Request:**
```json
{
  "firstName": "John",
  "lastName": "Doe",
  "phoneNumber": "+237123456789",
  "bio": "Passionné d'événements"
}
```

---

### Become Organizer
**POST** `/users/organizer-profile`

Devenir organisateur d'événements.

**Request:**
```json
{
  "companyName": "Nom de l'entreprise",
  "companyDescription": "Description..."
}
```

---

## 🔧 Codes d'Erreur

| Code | Message | Description |
|------|---------|-------------|
| 400 | Bad Request | Requête invalide |
| 401 | Unauthorized | Non authentifié / Token expiré |
| 403 | Forbidden | Pas de permissions |
| 404 | Not Found | Ressource non trouvée |
| 409 | Conflict | Conflit (ex: email existe déjà) |
| 500 | Server Error | Erreur serveur |

---

## 📦 Rate Limiting

Limite: 100 requêtes par minute par IP

---

## 🔒 Sécurité

- Tous les passwords doivent avoir au minimum 8 caractères
- Les tokens JWT expirent après 1 heure
- Les refresh tokens expirent après 30 jours
- Utilisez HTTPS en production

---

## 📞 Support

Email: contact@nexgenit-solutions.com
