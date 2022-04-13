import 'package:bloc_example_one/src/client/dto/client.dart';

abstract class IClientRepository {
  List<Client> loadClients();
  List<Client> addClient(Client client);
  List<Client> removeClient(Client client);
}
