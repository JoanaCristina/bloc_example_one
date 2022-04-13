import 'package:bloc_example_one/src/client/bloc_sem_package/events/client_events_interface.dart';
import 'package:bloc_example_one/src/client/dto/client.dart';

class AddClientEvent implements ClientEvent {
  Client client;
  AddClientEvent({
    required this.client,
  });
  

  
}
