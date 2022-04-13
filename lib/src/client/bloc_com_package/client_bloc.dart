
import 'package:bloc_example_one/src/client/bloc_sem_package/events/add_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/client_events_interface.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/load_clients_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/remove_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/states/client_state.dart';
import 'package:bloc_example_one/src/client/repository/client_repository_interface.dart';
import 'package:bloc/bloc.dart';

class ClientBlocDois extends Bloc<ClientEvent, ClientState> {
  final IClientRepository clientRepo;

  ClientBlocDois({required this.clientRepo}) : super(ClientInitialState()) {
    on<LoadClientsEvent>((event, emit) =>
        emit(ClientSuccessState(clients: clientRepo.loadClients())));

    on<AddClientEvent>((event, emit) => emit(
      ClientSuccessState(clients: clientRepo.addClient(event.client))
    ));

    on<RemoveClientEvent>((event, emit) => emit(
      ClientSuccessState(clients: clientRepo.removeClient(event.client))
    ));



  }
}
