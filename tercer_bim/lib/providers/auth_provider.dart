import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../entities/user.dart';

final usersListProvider = StateProvider<List<User>>((ref) => []); //almacena los usuarios
final currentUserProvider = StateProvider<User?>((ref) => null); //arranca en null porque empieza vacios y despues se guardan cuando se loguean