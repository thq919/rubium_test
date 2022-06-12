import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubium_test/features/data/model/model_attr/identity_model.dart';
import 'package:rubium_test/features/screens/_controller/screen_states.dart';
import 'package:rubium_test/features/screens/_controller/screens_bloc.dart';

class DescribeScreen extends StatelessWidget {
  const DescribeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreensBlock, ScreensState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Описание профиля')),
        body: (() {
          if (state is DescribeItemState) {
            Identity iden = state.entity;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
           
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(iden.picture.large),
                      ),
                    ),
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 8,
                    children: [
                         Text('name: ${iden.name.first}'),
                  Text('surname: ${iden.name.last}'),
                   Text('city: ${iden.location.city}'),
                    Text('country: ${iden.location.country}'),
                  Text('latitude: ${iden.location.coordinates.latitude}'),
                  Text('longitude: ${iden.location.coordinates.longitude}'),
                  Text('email: ${iden.email}')
                  ],),
               
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        }()),
      );
    });
  }
}
