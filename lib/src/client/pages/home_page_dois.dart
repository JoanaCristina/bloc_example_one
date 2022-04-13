import 'package:bloc_example_one/src/client/bloc_com_package/client_bloc.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/add_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/load_clients_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/events/remove_client_event.dart';
import 'package:bloc_example_one/src/client/bloc_sem_package/states/client_state.dart';
import 'package:bloc_example_one/src/client/dto/client.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePageDois extends StatefulWidget {
  const MyHomePageDois({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePageDois> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageDois> {
  late final ClientBlocDois clientBloc;

  @override
  void initState() {
    super.initState();
    clientBloc = GetIt.I.get<ClientBlocDois>();
    clientBloc.add(LoadClientsEvent());
  }

  @override
  void dispose() {
    clientBloc.close();
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
                clientBloc.add(AddClientEvent(client: Client(name: "Jurelma")));
              },
            )
          ],
        ),
        body: BlocBuilder<ClientBlocDois, ClientState>(
            bloc: clientBloc,
            builder: (context, state) {
              if (state is ClientInitialState) {
                return const Center(child: CircularProgressIndicator());
              }
              
               else if (state is ClientSuccessState) {
                final clientsList = state.clients;
                return ListView.builder(
                    itemCount: clientsList.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: ClipRRect(
                              child: Text(
                                  clientsList[index].name.substring(0, 1))),
                        ),
                        title: Text(clientsList[index].name),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            clientBloc.add(
                                RemoveClientEvent(client: clientsList[index]));
                          },
                        ),
                      );

                    
                    });}
               return Container();
             
              }
             //builder

            ));
  }
}
