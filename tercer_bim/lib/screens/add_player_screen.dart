import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../entities/player.dart';
import '../providers/player_provider.dart';

class AddPlayerScreen extends ConsumerStatefulWidget {
  final Player? player; // Si viene null es AGREGAR, si trae datos es EDITAR

  const AddPlayerScreen({super.key, this.player});

  @override
  ConsumerState<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends ConsumerState<AddPlayerScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _imageController;
  late final TextEditingController _teamController;
  late final TextEditingController _positionController;

  @override
  void initState() {
    super.initState();
    // Pre-cargamos los campos si estamos editando un jugador existente
    _nameController = TextEditingController(text: widget.player?.name ?? '');
    _descriptionController = TextEditingController(text: widget.player?.description ?? '');
    _imageController = TextEditingController(text: widget.player?.image ?? '');
    _teamController = TextEditingController(text: widget.player?.team ?? '');
    _positionController = TextEditingController(text: widget.player?.position ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    _teamController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  void _savePlayer() {
    if (_formKey.currentState!.validate()) {
      final isEditing = widget.player != null;
      final name = _nameController.text.trim();

      if (isEditing) {
        // EDITAR: Mantenemos el id original del jugador para que reemplace al anterior
        final updatedPlayer = Player(
          id: widget.player!.id,
          name: name,
          description: _descriptionController.text.trim(),
          image: _imageController.text.trim(),
          team: _teamController.text.trim(),
          position: _positionController.text.trim(),
        );

        ref.read(playerProvider.notifier).updatePlayer(updatedPlayer);
      } else {
        // AGREGAR: Creamos un jugador nuevo usando el nombre como ID
        final newPlayer = Player(
          id: name,
          name: name,
          description: _descriptionController.text.trim(),
          image: _imageController.text.trim(),
          team: _teamController.text.trim(),
          position: _positionController.text.trim(),
        );

        ref.read(playerProvider.notifier).addPlayer(newPlayer);
      }

      context.go('/players');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.player != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Jugador' : 'Agregar Jugador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descripcion'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa una descripcion';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'URL de Imagen'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa una URL de imagen';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _teamController,
                decoration: const InputDecoration(labelText: 'Equipo'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa un equipo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _positionController,
                decoration: const InputDecoration(labelText: 'Posicion'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa una posicion';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _savePlayer,
                child: Text(isEditing ? 'Guardar Cambios' : 'Guardar Jugador'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}