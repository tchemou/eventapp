import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/app_constants.dart';
import 'config/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/event_provider.dart';
import 'providers/order_provider.dart';
import 'providers/ticket_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/welcome_screen.dart';   // ✅ ajouté
import 'screens/main_shell.dart';
import 'screens/splash_screen.dart';
import 'services/auth_service.dart';
import 'services/event_service.dart';
import 'services/http_service.dart';
import 'services/order_service.dart';
import 'services/ticket_service.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);

  final httpService = HttpService();
  final authService = AuthService(httpService);

  try {
    await authService.init();
    print('✅ authService.init() OK');
  } catch (e, stack) {
    print('❌ authService.init() ERREUR : $e');
    print('Stack trace : $stack');
  }

  final eventService  = EventService(httpService);
  final orderService  = OrderService(httpService);
  final ticketService = TicketService(httpService);

  runApp(
    MultiProvider(
      providers: [
        Provider<HttpService>(create: (_) => httpService),
        Provider<AuthService>(create: (_) => authService),
        Provider<EventService>(create: (_) => eventService),
        Provider<OrderService>(create: (_) => orderService),
        Provider<TicketService>(create: (_) => ticketService),
        ChangeNotifierProvider(create: (_) => AuthProvider(authService)),
        ChangeNotifierProvider(create: (_) => EventProvider(eventService)),
        ChangeNotifierProvider(create: (_) => OrderProvider(orderService)),
        ChangeNotifierProvider(create: (_) => TicketProvider(ticketService)),
      ],
      child: const NexGenEventsApp(),
    ),
  );
}

class NexGenEventsApp extends StatefulWidget {
  const NexGenEventsApp({Key? key}) : super(key: key);

  @override
  State<NexGenEventsApp> createState() => _NexGenEventsAppState();
}

class _NexGenEventsAppState extends State<NexGenEventsApp> {
  bool _isInitialized = false;
  bool _showSplash    = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      final authProvider = context.read<AuthProvider>();
      await authProvider.init();
      print('✅ authProvider.init() OK — isLoggedIn: ${authProvider.isLoggedIn}');

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _showSplash    = !authProvider.isLoggedIn;
        });
      }
    } catch (e, stack) {
      print('❌ _initializeApp() ERREUR : $e');
      print('Stack trace : $stack');
      if (mounted) {
        setState(() {
          _isInitialized = true;
          _showSplash    = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme:     AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      home: !_isInitialized
          ? const _LoadingScreen()
          : Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                if (_showSplash) {
                  return SplashScreen(
                    onDone: () => setState(() => _showSplash = false),
                  );
                }
                
                // Si nouvel inscrit on affiche le WelcomeScreen
                if (authProvider.isLoggedIn && authProvider.isNewUser) {
                  return const WelcomeScreen();
                }

                // Toujours aller à l'accueil (MainShell) pour permettre le mode invité
                return const MainShell();
              },
            ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}