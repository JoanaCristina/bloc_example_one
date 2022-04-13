import 'package:bloc_example_one/src/client/bloc_sem_package/events/client_events_interface.dart';
import 'package:bloc_example_one/src/client/dto/client.dart';

class RemoveClientEvent implements ClientEvent {
  Client client;
  RemoveClientEvent({
    required this.client,
  });
  
}
