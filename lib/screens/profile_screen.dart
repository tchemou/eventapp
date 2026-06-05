import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/app_theme.dart';
import '../providers/auth_provider.dart';
import 'auth/login_screen.dart';
import 'profile/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundColor: context.gold,
              child: Text(
                (user?.fullName ?? 'U')[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1200),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user?.fullName ?? 'Utilisateur',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              user?.email ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (user?.phoneNumber != null) ...[
              const SizedBox(height: 4),
              Text(
                user!.phoneNumber!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 8),

            // Menu items
            _ProfileTile(
              icon: Icons.person_outline,
              title: 'Modifier le profil',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
              },
            ),
            _ProfileTile(
              icon: Icons.confirmation_number_outlined,
              title: 'Mes commandes',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.security,
              title: 'Sécurité',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.help_outline,
              title: 'Centre d\'aide',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.info_outline,
              title: 'À propos',
              onTap: () {},
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),

            // Logout
            _ProfileTile(
              icon: Icons.logout,
              title: 'Déconnexion',
              isDestructive: true,
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Déconnexion'),
                    content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Annuler'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Déconnexion'),
                      ),
                    ],
                  ),
                );
                if (confirmed == true && context.mounted) {
                  await context.read<AuthProvider>().logout();
                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  }
                }
              },
            ),

            const SizedBox(height: 32),
            Text(
              'Events237 v1.0.0',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive
        ? Theme.of(context).colorScheme.error
        : context.gold;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isDestructive ? Theme.of(context).colorScheme.error : null,
            ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: color.withOpacity(0.5),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
