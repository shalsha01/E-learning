import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());
