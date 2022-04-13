import 'package:bloc_example_one/src/client/bloc_sem_package/client_bloc.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/add_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/load_clients_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/remove_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/states/client_state.dart';
import 'package:bloc_example_one/src/client/dto/client.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ClientBloc clientBloc;

  @override
  void initState() {
    super.initState();
    clientBloc = GetIt.I.get<ClientBloc>();
    clientBloc.inputClient.add(LoadClientsEvent());
  }

  @override
  void dispose() {
    clientBloc.inputClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clients"),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_add),
              onPressed: () {
                clientBloc.inputClient
                    .add(AddClientEvent(client: Client(name: "Jurelma")));
              },
            )
          ],
        ),
        body: StreamBuilder<ClientState>(
            stream: clientBloc.outputClient,
            builder: (context, AsyncSnapshot<ClientState> snapshot) {
              final clientsList = snapshot.data?.clients ?? [];

              return ListView.builder(
                  itemCount: clientsList.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: ClipRRect(
                            child:
                                Text(clientsList[index].name.substring(0, 1))),
                      ),
                      title: Text(clientsList[index].name),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          clientBloc.inputClient.add(
                              RemoveClientEvent(client: clientsList[index]));
                        },
                      ),
                    );
                  });
            }));
  }
}
