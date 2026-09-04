import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../entities/player.dart';
import '../../providers/player_provider.dart';

class AddPlayerScreen extends ConsumerStatefulWidget {
  final Player? player;

  const AddPlayerScreen({super.key, this.player});

  @override
  ConsumerState<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends ConsumerState<AddPlayerScreen> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;
  late TextEditingController teamController;
  late TextEditingController positionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.player?.name ?? "");
    descriptionController = TextEditingController(text: widget.player?.description ?? "");
    imageController = TextEditingController(text: widget.player?.image ?? "");
    teamController = TextEditingController(text: widget.player?.team ?? "");
    positionController = TextEditingController(text: widget.player?.position ?? "");
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    teamController.dispose();
    positionController.dispose();
    super.dispose();
  }

  void _savePlayer() {
    if (nameController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        imageController.text.trim().isEmpty ||
        teamController.text.trim().isEmpty ||
        positionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Complete todos los campos obligatorios")),
      );
      return;
    }

    List<Player> players = ref.read(playerProvider); //esta linea sirve para detectar si hay un cambio en la lista de jugadores y la actualiza
    bool isEditing = widget.player != null;

    if (isEditing) {
      final nuevaLista = players.map((p) {
        if (p.id == widget.player!.id) {
          return Player(
            id: widget.player!.id,
            name: nameController.text.trim(),
            description: descriptionController.text.trim(),
            image: imageController.text.trim(),
            team: teamController.text.trim(),
            position: positionController.text.trim(),
          );
        }
        return p;
      }).toList();

      ref.read(playerProvider.notifier).state = nuevaLista;
    } else {
      final nuevoJugador = Player(
        id: DateTime.now().toString(),
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        image: imageController.text.trim(),
        team: teamController.text.trim(),
        position: positionController.text.trim(),
      );

      ref.read(playerProvider.notifier).state = [...players, nuevoJugador];
    }

    context.go('/players');
  }

  @override
  Widget build(BuildContext context) {
    bool editando = widget.player != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(editando ? "Editar jugador" : "Agregar jugador"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Nombre"),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: teamController,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Equipo"),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: positionController,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Posición"),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Descripción"),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Link de la imagen"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _savePlayer,
                child: Text(editando ? "Guardar cambios" : "Agregar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}