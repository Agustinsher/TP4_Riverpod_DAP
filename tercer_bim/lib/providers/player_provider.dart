import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../entities/player.dart';

final playerProvider = StateProvider<List<Player>>((ref) { //almacena los jugadores
  return [
    Player(
      id: "1",
      name: "Lionel Messi",
      description: "Nació el 24 de junio de 1987 en Rosario, Argentina. Tiene 39 años. Juega como delantero y actualmente forma parte del Inter Miami. A lo largo de su carrera jugó en Barcelona, Paris Saint-Germain (PSG), Inter Miami y la Selección Argentina. Fue campeón del mundo en 2022.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtKUqOIHC-u2mA-Uh-nGURxnEnc3ZyA-gnq2wOZtNLjA&s=10",
      team: "Inter Miami",
      position: "Delantero",
    ),
    Player(
      id: "2",
      name: "Cristiano Ronaldo",
      description: "Nació el 5 de febrero de 1985 en Funchal, Madeira, Portugal. Tiene 41 años. Juega como delantero y actualmente juega en Al-Nassr. A lo largo de su carrera pasó por Sporting CP, Manchester United, Real Madrid, Juventus, Al-Nassr y la Selección de Portugal.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTyJ6voD5Aao5ObO1-7eoBsYQjkDGmEG4mrhhtHjb8pA&s",
      team: "Al-Nassr",
      position: "Delantero",
    ),
    Player(
      id: "3",
      name: "Kylian Mbappe",
      description: "Nació el 20 de diciembre de 1998 en París, Francia. Tiene 27 años. Juega como delantero y actualmente forma parte del Real Madrid. A lo largo de su carrera jugó en el AS Monaco, Paris Saint-Germain (PSG), Real Madrid y la Selección de Francia. Fue campeón del mundo en 2018 y subcampeón en 2022.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmytqchCFPLVs8RwU5no0YHUbId6cOwjPtQzpmwumzHGF9dhXTxhqLyha&s=10",
      team: "Real Madrid",
      position: "Delantero",
    ),
    Player(
      id: "4",
      name: "Neymar Jr.",
      description: "Nació el 5 de febrero de 1992 en Mogi das Cruzes, São Paulo, Brasil. Tiene 34 años. Juega como delantero y actualmente forma parte de Santos FC. Durante su carrera jugó en Santos, Barcelona, Paris Saint-Germain (PSG), Al-Hilal y la Selección de Brasil.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNad_V_Nbc0N6TidpShh_cfxtczD1EGoWeYK5eep1vqQ&s",
      team: "Santos FC",
      position: "Delantero",
    ),
    Player(
      id: "5",
      name: "Leandro Paredes",
      description: "Nació el 29 de junio de 1994 en San Justo, Buenos Aires, Argentina. Tiene 32 años. Juega como mediocampista y actualmente forma parte de Boca Juniors. Durante su carrera jugó en Boca Juniors, Chievo Verona, Empoli, Roma, Zenit de San Petersburgo, Paris Saint-Germain (PSG), Juventus y la Selección Argentina. Fue campeón del mundo en 2022.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9oqhyVLHCnfWAD44jK8hzicQGoUtQzfVnB8IruHHoLRtxa_tZ7JxniAY&s=10",
      team: "Boca Juniors",
      position: "Mediocampista",
    ),
    Player(
      id: "6",
      name: "Diego Maradona",
      description: "Nació el 30 de octubre de 1960 en Lanús, Buenos Aires, Argentina. Falleció el 25 de noviembre de 2020 a los 60 años. Jugó como mediocampista ofensivo. A lo largo de su carrera pasó por Argentinos Juniors, Boca Juniors, Barcelona, Napoli, Sevilla, Newell's Old Boys y la Selección Argentina. Fue campeón del mundo en 1986.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzUe_BWpH07d2L7HWCRxt54XSUucamUWmc9Lc5lMHEpg&s",
      team: "Selección Argentina",
      position: "Mediocampista",
    ),
  ];
});