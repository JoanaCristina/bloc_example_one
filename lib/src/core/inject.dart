import 'package:bloc_example_one/src/client/bloc_com_package/client_bloc.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/client_bloc.dart';
import 'package:bloc_example_one/src/client/repository/client_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc_example_one/src/client/repository/client_repository_interface.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<IClientRepository>(() => ClientRepository());
    getIt.registerFactory<ClientBloc>(() => ClientBloc(clientRepo: getIt()));
    getIt.registerFactory<ClientBlocDois>(() => ClientBlocDois(clientRepo: getIt()));
  }
}
