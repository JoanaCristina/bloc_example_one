import 'dart:async';

import 'package:bloc_example_one/src/client/bloc_sem_package/events/add_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/client_events_interface.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/load_clients_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/remove_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/states/client_state.dart';
import 'package:bloc_example_one/src/client/dto/client.dart';
import 'package:bloc_example_one/src/client/repository/client_repository_interface.dart';

class ClientBloc {
  final IClientRepository clientRepo;

  final StreamController<ClientEvent> _inputClientController =
      StreamController<ClientEvent>();

  final StreamController<ClientState> _outputClientController =
      StreamController<ClientState>();

  Sink<ClientEvent> get inputClient =>
      _inputClientController.sink; //entrada de eventos
  Stream<ClientState> get outputClient =>
      _outputClientController.stream; //saída por streams

  ClientBloc({required this.clientRepo}) {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent event) {
    _outputClientController.add(ClientInitialState());
    List<Client> clients = [];

    if (event is LoadClientsEvent) {
      clients = clientRepo.loadClients();
    } else if (event is AddClientEvent) {
      clients = clientRepo.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = clientRepo.removeClient(event.client);
    }

    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}
