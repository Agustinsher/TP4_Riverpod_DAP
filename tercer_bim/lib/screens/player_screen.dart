import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../entities/player.dart';
import '../../providers/player_provider.dart';
import '../../providers/auth_provider.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(playerProvider);
    final user = ref.watch(currentUserProvider);// esta linea sirve para detectar si hay un cambio en el usuario logueado y lo actualiza

    return Scaffold(
      appBar: AppBar(
        title: Text("Jugadores (${user?.name ?? ''})"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(currentUserProvider.notifier).state = null; //sirve para cerrar sesion y volver a la pantalla de login
              context.go('/login');
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add'),
        child: const Icon(Icons.add),
      ),
      body: players.isEmpty
          ? const Center(child: Text("No hay jugadores en la lista"))
          : ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      player.image,
                      width: 50,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                    ),
                    title: Text(player.name),
                    subtitle: Text("${player.team} - ${player.position}"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => context.go('/detail', extra: player),
                  ),
                );
              },
            ),
    );
  }
}