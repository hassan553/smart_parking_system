import 'package:get_it/get_it.dart';

import '../../features/auth/data/repository/login_repo.dart';
import '../../features/auth/data/repository/register_repo.dart';

final gitIt = GetIt.instance;

class ServicesLector {
  static init() {
    gitIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
    gitIt.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl());
  }
}
