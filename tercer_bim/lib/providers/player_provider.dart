import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../entities/player.dart';

class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier()
      : super([
          Player(
            id: "Lionel Messi",
            name: "Lionel Messi",
            description: "Nacio el 24 de junio de 1987 en Rosario, Argentina. Tiene 39 anos. Juega como delantero y actualmente forma parte del Inter Miami. A lo largo de su carrera jugo en Barcelona, Paris Saint-Germain (PSG), Inter Miami y la Seleccion Argentina. Fue campeon del mundo en 2022.",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtKUqOIHC-u2mA-Uh-nGURxnEnc3ZyA-gnq2wOZtNLjA&s=10",
            team: "Inter Miami",
            position: "Delantero",
          ),
          Player(
            id: "Cristiano Ronaldo",
            name: "Cristiano Ronaldo",
            description: "Nacio el 5 de febrero de 1985 en Funchal, Madeira, Portugal. Tiene 41 anos. Juega como delantero y actualmente juega en Al-Nassr. A lo largo de su carrera paso por Sporting CP, Manchester United, Real Madrid, Juventus, Al-Nassr y la Seleccion de Portugal.",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTyJ6voD5Aao5ObO1-7eoBsYQjkDGmEG4mrhhtHjb8pA&s",
            team: "Al-Nassr",
            position: "Delantero",
          ),
          Player(
            id: "Kylian Mbappe",
            name: "Kylian Mbappe",
            description: "Nacio el 20 de diciembre de 1998 en Paris, Francia. Tiene 27 anos. Juega como delantero y actualmente forma parte del Real Madrid. A lo largo de su carrera jugo en el AS Monaco, Paris Saint-Germain (PSG), Real Madrid y la Seleccion de Francia. Fue campeon del mundo en 2018 y subcampeon en 2022.",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmytqchCFPLVs8RwU5no0YHUbId6cOwjPtQzpmwumzHGF9dhXTxhqLyha&s=10",
            team: "Real Madrid",
            position: "Delantero",
          ),
          Player(
            id: "Neymar Jr.",
            name: "Neymar Jr.",
            description: "Nacio el 5 de febrero de 1992 en Mogi das Cruzes, Sao Paulo, Brasil. Tiene 34 anos. Juega como delantero y actualmente forma parte de Santos FC. Durante su carrera jugo en Santos, Barcelona, Paris Saint-Germain (PSG), Al-Hilal y la Seleccion de Brasil.",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNad_V_Nbc0N6TidpShh_cfxtczD1EGoWeYK5eep1vqQ&s",
            team: "Santos FC",
            position: "Delantero",
          ),
          Player(
            id: "Leandro Paredes",
            name: "Leandro Paredes",
            description: "Nacio el 29 de junio de 1994 en San Justo, Buenos Aires, Argentina. Tiene 32 anos. Juega como mediocampista y actualmente forma parte de Boca Juniors. Durante su carrera jugo en Boca Juniors, Chievo Verona, Empoli, Roma, Zenit de San Petersburgo, Paris Saint-Germain (PSG), Juventus y la Seleccion Argentina. Fue campeon del mundo en 2022.",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9oqhyVLHCnfWAD44jK8hzicQGoUtQzfVnB8IruHHoLRtxa_tZ7JxniAY&s=10",
            team: "Boca Juniors",
            position: "Mediocampista",
          ),
          Player(
            id: "Diego Maradona",
            name: "Diego Maradona",
            description: "Nacio el 30 de octubre de 1960 en Lanus, Buenos Aires, Argentina. Fallecio el 25 de noviembre de 2020 a los 60 anos. Jugo como mediocampista ofensivo. A lo largo de su carrera paso por Argentinos Juniors, Boca Juniors, Barcelona, Napoli, Sevilla, Newell's Old Boys y la Seleccion Argentina. Fue campeon del mundo en 1986.",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzUe_BWpH07d2L7HWCRxt54XSUucamUWmc9Lc5lMHEpg&s",
            team: "Seleccion Argentina",
            position: "Mediocampista",
          ),
        ]);

  // Agrega un nuevo jugador al final de la lista
  void addPlayer(Player player) {
    state = [...state, player];
  }

  // Busca el jugador por su ID (su nombre) y lo reemplaza con la informacion actualizada
  void updatePlayer(Player updatedPlayer) {
    state = [
      for (final p in state)
        if (p.id == updatedPlayer.id) updatedPlayer else p
    ];
  }

  // Elimina un jugador manteniendo solo los que tienen un ID distinto al recibido
  void removePlayer(String id) {
    state = state.where((p) => p.id != id).toList();
  }
}

// Provider global que expone la lista de jugadores y permite modificar su estado desde cualquier pantalla
final playerProvider = StateNotifierProvider<PlayerNotifier, List<Player>>((ref) {
  return PlayerNotifier();
});