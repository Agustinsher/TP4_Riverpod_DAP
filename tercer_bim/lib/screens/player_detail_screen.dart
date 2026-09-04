import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../entities/player.dart';
import '../../providers/player_provider.dart';

class PlayerDetailScreen extends ConsumerWidget {
  final Player player;

  const PlayerDetailScreen({super.key, required this.player});

  void _deletePlayer(BuildContext context, WidgetRef ref) {
    final players = ref.read(playerProvider);
    final nuevaLista = players.where((p) => p.id != player.id).toList();
    ref.read(playerProvider.notifier).state = nuevaLista;
    context.go('/players');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                player.image,
                height: 180,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 100),
              ),
            ),
            const SizedBox(height: 20),
            Text("Nombre: ${player.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Equipo: ${player.team}", style: const TextStyle(fontSize: 16)),
            Text("Posición: ${player.position}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Descripción:", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(player.description),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => context.go('/add', extra: player),
                  icon: const Icon(Icons.edit),
                  label: const Text("Editar"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => _deletePlayer(context, ref),
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text("Eliminar", style: TextStyle(color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}