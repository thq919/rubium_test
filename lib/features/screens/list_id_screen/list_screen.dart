import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubium_test/features/data/model/model_attr/identity_model.dart';
import 'package:rubium_test/features/screens/_controller/screen_states.dart';
import 'package:rubium_test/features/screens/_controller/screens_bloc.dart';
import 'package:rubium_test/features/screens/_controller/screens_events.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreensBlock bloc = BlocProvider.of<ScreensBlock>(context);
    String value = '';

    TextEditingController controller = TextEditingController(text: value);
    return BlocBuilder<ScreensBlock, ScreensState>(builder: (context, state) {
      return Scaffold(
          floatingActionButton: IconButton(
            onPressed: () {
              bloc.add(InitialEvent());
              Navigator.of(context).popAndPushNamed('/');
            },
            icon: const Icon(Icons.exit_to_app),
          ),
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height / 8,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ColoredBox(
                      color: Colors.white54,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 24,
                          child: TextField(
                            controller: controller,
                            onChanged: (str) {
                              BlocProvider.of<ScreensBlock>(context)
                                  .add(SortEvent(str));
                            },
                          )),
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<ScreensBlock>(context)
                              .add(SortEvent(controller.text));
                        },
                        icon: const Icon(
                          Icons.search,
                        ))
                  ],
                ),
                state is LoadedState || state is LoadingState
                    ? Text('Я: ${bloc.login}')
                    : const Text('')
              ],
            ),
          ),
          body: (() {
            if (state is LoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  bloc.add(ReloadEvent());
                },
                child: ListView.builder(
                    key: const PageStorageKey<String>('controllerA'),
                    controller: ScrollController(),
                    padding: const EdgeInsets.all(8),
               
                    itemCount: state.model.results.length,
                    itemBuilder: ((context, index) {
                      Identity iden = state.model.results.elementAt(index);
                      return GestureDetector(
                        onTap: (() {
                          bloc.add(ItemNeedToShowDescribeEvent(
                              state.model.results.elementAt(index)));
                          Navigator.of(context)
                              .pushNamed('/describe')
                              .then((_) {
                            bloc.add(RenewScreenEvent());
                          });
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(iden.picture.medium))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(iden.name.first),
                                    Text(iden.name.last),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              );
            } else if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }()));
    });
  }
}
