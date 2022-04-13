import 'package:bloc_example_one/src/client/dto/client.dart';
import 'package:bloc_example_one/src/client/repository/client_repository_interface.dart';


class ClientRepository implements IClientRepository{
 final List<Client> _clients = [];

  @override
  List<Client> addClient(Client client) {
  _clients.add(client);
    return _clients;
  }

  @override
  List<Client> loadClients() {
    _clients.addAll([
      Client(name: 'Joana'),
      Client(name: "Joelma"),
      Client(name: 'Quiteria'),
      Client(name: 'Joeli'),
      Client(name: 'Mauro'),
    ]);
    return _clients;
  }

  @override
  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }












  
}
