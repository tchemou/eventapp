class ApiConfig {
  ApiConfig._();

  static const String baseUrl = 'http://147.79.110.41:8080/api/v1';

  // ─── Auth (OTP SMS) ───────────────────────────────────────────────────────
  static const String authSignupMobile    = '/auth/signup-mobile';
  static const String authLoginMobile     = '/auth/login-mobile';
  static const String authVerifyOtpMobile = '/auth/verify-otp-mobile';
  static const String authRefreshToken    = '/auth/refresh';
  static const String authLogout          = '/auth/logout';
  static const String authMe              = '/auth/me';

  // ─── Events (public) ──────────────────────────────────────────────────────
  static const String getEvents    = '/events';
  static const String getEventById = '/events/{id}';
  static const String searchEvents = '/events/search';

  // ─── Events (organizer CRUD) ──────────────────────────────────────────────
  static const String createEvent  = '/organizer/events';
  static const String updateEvent  = '/organizer/events/{id}';
  static const String deleteEvent  = '/organizer/events/{id}';

  // ─── Organizer ────────────────────────────────────────────────────────────
  static const String createOrganizerProfile = '/organizer/become';
  static const String organizerEvents        = '/organizer/events';
  static const String organizerEventsMe      = '/organizer/events/me';

  // ─── Orders ───────────────────────────────────────────────────────────────
  static const String createOrder  = '/client/orders';
  static const String getOrders    = '/client/orders';
  static const String getOrderById = '/client/orders/{id}';
  static const String getMyOrders  = '/client/orders/me';

  // ─── Tickets ──────────────────────────────────────────────────────────────
  static const String getTickets     = '/client/tickets';
  static const String getTicketById  = '/client/tickets/{id}';
  static const String transferTicket = '/client/tickets/{id}/transfer';
  static const String validateTicket = '/organizer/tickets/{id}/validate';

  // ─── Ticket Types ─────────────────────────────────────────────────────────
  static const String getTicketTypes    = '/ticket-types/event/{eventId}';
  static const String createTicketType  = '/organizer/events/{eventId}/ticket-types';
  static const String updateTicketType  = '/organizer/ticket-types/{id}';
  static const String deleteTicketType  = '/organizer/ticket-types/{id}';

  // ─── Favorites ────────────────────────────────────────────────────────────
  static const String addFavorite    = '/client/favorites/{eventId}';
  static const String removeFavorite = '/client/favorites/{eventId}';
  static const String getFavorites   = '/client/favorites';

  // ─── Places (public) ──────────────────────────────────────────────────────
  static const String getPlaces = '/places';

  // ─── Promo Codes ──────────────────────────────────────────────────────────
  static const String validatePromoCode = '/organizer/promo-codes/validate';

  // ─── Profile ──────────────────────────────────────────────────────────────
  static const String updateUserProfile = '/auth/me';

  // ─── Waiting List ─────────────────────────────────────────────────────────
  static const String joinWaitingList   = '/client/waiting-list';
  static const String leaveWaitingList  = '/client/waiting-list/{id}';

  // ─── Headers & Timeouts ───────────────────────────────────────────────────
  static const String authorizationHeader = 'Authorization';
  static const String contentTypeHeader   = 'Content-Type';
  static const String contentTypeJson     = 'application/json';

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout    = 30000;
}