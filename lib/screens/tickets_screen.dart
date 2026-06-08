import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/app_theme.dart';
import '../providers/ticket_provider.dart';
import '../providers/auth_provider.dart';
import '../models/order.dart';
import 'tickets/ticket_detail_screen.dart';
import 'auth/login_screen.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    // Fetch tickets on load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<AuthProvider>().isLoggedIn) {
        context.read<TicketProvider>().getTickets();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Billets'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'À venir / Valides'),
            Tab(text: 'Passés / Utilisés'),
          ],
        ),
      ),
      body: !context.watch<AuthProvider>().isLoggedIn 
          ? _buildGuestView(context)
          : Consumer<TicketProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          final validTickets = provider.tickets.where((t) => t.status == 'VALID').toList();
          final pastTickets = provider.tickets.where((t) => t.status != 'VALID').toList();

          return TabBarView(
            controller: _tabController,
            children: [
              validTickets.isEmpty
                  ? _buildEmptyState(
                      icon: Icons.confirmation_number_outlined,
                      title: 'Aucun billet à venir',
                      subtitle: 'Vos billets pour les prochains événements\napparaîtront ici',
                    )
                  : _buildTicketList(validTickets),
              pastTickets.isEmpty
                  ? _buildEmptyState(
                      icon: Icons.history,
                      title: 'Aucun billet passé',
                      subtitle: 'Vos anciens billets seront\nconservés ici',
                    )
                  : _buildTicketList(pastTickets),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTicketList(List<Ticket> tickets) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.gold.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.confirmation_number, color: context.gold),
            ),
            title: Text(
              'Billet #${ticket.ticketNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Statut: ${ticket.status}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TicketDetailScreen(ticket: ticket),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.gold.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 64, color: context.gold.withOpacity(0.6)),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.confirmation_number_outlined, size: 80, color: context.gold),
            const SizedBox(height: 24),
            Text(
              'Mode invité',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Connectez-vous pour consulter et utiliser vos billets.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.gold,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Se connecter', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
