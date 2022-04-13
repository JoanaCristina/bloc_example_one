import 'package:bloc_example_one/src/client/dto/client.dart';

abstract class ClientState {
  //o que queremos carregar na tela
  List<Client> clients;
  ClientState({
    required this.clients,
  });
}

class ClientInitialState extends ClientState{
  ClientInitialState() : super(clients: []);

}

class ClientSuccessState extends ClientState{
  ClientSuccessState({required List<Client> clients}) : super(clients: clients);

}
