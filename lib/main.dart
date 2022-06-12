import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubium_test/core/network/client_service.dart';
import 'package:rubium_test/features/data/datasource/person_source.dart';
import 'package:rubium_test/features/screens/_controller/screens_bloc.dart';
import 'package:rubium_test/features/screens/_controller/screens_events.dart';

import 'features/screens/auth_screen/login_screen.dart';
import 'features/screens/describe_id_screen/describe_screen.dart';
import 'features/screens/list_id_screen/list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScreensBlock>(
          create: (context) => ScreensBlock(PersonRemoteSource(ClientService()))..add(InitialEvent()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/' :(context) => const LoginScreen(),
          '/list': (context) => const ListScreen(),
          '/describe' : (context) => const DescribeScreen()
        },
      ),
    );
  }
}



