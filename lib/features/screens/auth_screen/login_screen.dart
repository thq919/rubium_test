import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubium_test/features/screens/_controller/screens_bloc.dart';
import 'package:rubium_test/features/screens/_controller/screens_events.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value = '';
    TextEditingController controller = TextEditingController(text: value);
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: controller,
                    )),
              ),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<ScreensBlock>(context)
                        .add(LoginCompleteEvent(controller.text));
                    Navigator.popAndPushNamed(context, '/list');
                  },
                  child: const Text('Войти'))
            ],
          ),
        ),
      ),
    );
  }
}
