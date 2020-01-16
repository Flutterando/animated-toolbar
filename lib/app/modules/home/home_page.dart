import 'package:desafio_options/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/custom_app_bar/custom_app_bar_controller.dart';
import 'components/custom_app_bar/custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controllerMobx = HomeModule.to.get<CustomAppBarController>();

    return Material(
      child: Stack(
        children: <Widget>[
          Observer(
            builder: (_) {
              return IndexedStack(
                index: (3 - controllerMobx.selectedId),
                children: <Widget>[
                  Center(
                    child: Text('SERVICE'),
                  ),
                  Center(
                    child: Text('AUTO'),
                  ),
                  Center(
                    child: Text('JOB'),
                  ),
                  Center(
                    child: Text('REALTY'),
                  ),
                ],
              );
            },
          ),
          CustomAppBarWidget(),
        ],
      ),
    );
  }
}
