import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/app_constants.dart';
import '../config/app_theme.dart';
import '../providers/auth_provider.dart';
import '../providers/event_provider.dart';
import '../widgets/event_card.dart';
import 'auth/login_screen.dart';
import 'event_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Tous';
  /// 'upcoming' or 'past'
  String _timeFilter = 'upcoming';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadEvents();
    });
  }

  /// Initial fetch from API
  Future<void> _loadEvents() async {
    final eventProvider = context.read<EventProvider>();
    await eventProvider.fetchEvents();
    _applyLocalFilters();
  }

  /// Instant local filter (no API call)
  void _applyLocalFilters() {
    final eventProvider = context.read<EventProvider>();
    final query = _searchController.text.trim();
    final category = _selectedCategory == 'Tous' ? null : _selectedCategory;
    eventProvider.filterEventsLocally(
      category: category,
      search: query.isNotEmpty ? query : null,
    );
  }

  /// Called on every keystroke with a small debounce
  void _onSearchChanged(String value) {
    setState(() {}); // update suffix icon
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () {
      _applyLocalFilters();
    });
  }

  /// Get the filtered list based on time filter
  List _getFilteredList(EventProvider ep) {
    if (_timeFilter == 'past') return ep.pastEvents;
    return ep.upcomingEvents;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final eventProvider = context.watch<EventProvider>();
    final userName = authProvider.user?.fullName ?? 'Utilisateur';

    final displayedEvents = _getFilteredList(eventProvider);
    final upcomingCount = eventProvider.upcomingEvents.length;
    final pastCount = eventProvider.pastEvents.length;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: context.gold,
              radius: 18,
              child: Text(
                userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour,',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  userName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadEvents,
        color: context.gold,
        backgroundColor: context.surface,
        child: CustomScrollView(
          slivers: [
            // ── Search Bar (real-time) ─────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    hintText: 'Rechercher un événement...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _applyLocalFilters();
                              setState(() {});
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: context.isDark ? context.surface : Colors.grey[100],
                  ),
                ),
              ),
            ),

            // ── Category filters ──────────────────────────────
            SliverToBoxAdapter(
              child: _buildCategories(context, eventProvider),
            ),

            // ── Time filters (À venir / Passés) ──────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Row(
                  children: [
                    _buildTimeChip(
                      label: 'À venir',
                      icon: Icons.event_available_rounded,
                      count: upcomingCount,
                      value: 'upcoming',
                    ),
                    const SizedBox(width: 10),
                    _buildTimeChip(
                      label: 'Passés',
                      icon: Icons.history_rounded,
                      count: pastCount,
                      value: 'past',
                    ),
                  ],
                ),
              ),
            ),

            // ── Section title ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  _timeFilter == 'upcoming'
                      ? 'Événements à venir'
                      : 'Événements passés',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),

            // ── Loading state ─────────────────────────────────
            if (eventProvider.isLoading && eventProvider.events.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(color: context.gold),
                ),
              )
            // ── Error state ───────────────────────────────────
            else if (eventProvider.error != null)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 48, color: Theme.of(context).colorScheme.error),
                      const SizedBox(height: 16),
                      Text(
                        'Erreur lors du chargement',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        eventProvider.error!,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadEvents,
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                ),
              )
            // ── No results ────────────────────────────────────
            else if (displayedEvents.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _timeFilter == 'upcoming'
                              ? Icons.event_busy
                              : Icons.history_toggle_off_rounded,
                          size: 64,
                          color: context.gold.withOpacity(0.4),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _timeFilter == 'upcoming'
                              ? 'Aucun événement à venir'
                              : 'Aucun événement passé',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _timeFilter == 'upcoming'
                              ? 'Revenez plus tard ou consultez les événements passés'
                              : 'Les événements terminés apparaîtront ici',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            // ── Events list ───────────────────────────────────
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final event = displayedEvents[index];
                      return _timeFilter == 'past'
                          ? Opacity(
                              opacity: 0.65,
                              child: EventCard(
                                event: event,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => EventDetailScreen(event: event),
                                    ),
                                  );
                                },
                              ),
                            )
                          : EventCard(
                              event: event,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EventDetailScreen(event: event),
                                  ),
                                );
                              },
                            );
                    },
                    childCount: displayedEvents.length,
                  ),
                ),
              ),

            // Bottom padding
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  // ── Time filter chip ──────────────────────────────────────
  Widget _buildTimeChip({
    required String label,
    required IconData icon,
    required int count,
    required String value,
  }) {
    final isSelected = _timeFilter == value;
    final gold = context.gold;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _timeFilter = value);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          decoration: BoxDecoration(
            color: isSelected ? gold.withOpacity(0.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? gold : Colors.grey.withOpacity(0.25),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? gold : Colors.grey[500],
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? gold : Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? gold.withOpacity(0.18) : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? gold : Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Category filter chips ─────────────────────────────────
  Widget _buildCategories(BuildContext context, EventProvider eventProvider) {
    final categories = eventProvider.categories;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                  _applyLocalFilters();
                }
              },
            ),
          );
        },
      ),
    );
  }
}