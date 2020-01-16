import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../home_module.dart';
import '../shadow_text.dart';
import 'custom_app_bar_controller.dart';

extension ListExtension<T> on List<T> {
  List<T> orderById(int id) {
    var item = this[id];
    this.removeAt(id);
    this.insert(this.length, item);
    return this;
  }
}

class CustomAppBarWidget extends HookWidget {
  final controllerMobx = HomeModule.to.get<CustomAppBarController>();

  _bodyCard({
    int id,
    String title,
    IconData icon,
    Color color,
    Function onTap,
    Animation<double> animation,
    Animation<double> elevationAnimation,
    Animation<double> arrowAnimation,
    Animation<double> iconAnimation,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return SizedBox(
          height: animation.value,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Material(
                  color: color,
                  elevation: id == controllerMobx.selectedId
                      ? 18
                      : elevationAnimation.value,
                  child: InkWell(
                    onTap: onTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: iconAnimation.value *
                                  (animation.value * 0.25),
                            ),
                            Icon(
                              icon,
                              color: Colors.white,
                              size: (iconAnimation.value * 40),
                            ),
                            SizedBox(
                              height: (iconAnimation.value * 5) + 20,
                            ),
                          ],
                        ),
                        ShadowText(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Transform.scale(
                scale: arrowAnimation.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightForOne = size.height / 4;
    final controller =
        useAnimationController(duration: Duration(milliseconds: 500));
    final sizeAnimation =
        Tween<double>(begin: size.height / 4, end: 80).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCirc,
        reverseCurve: Curves.easeInCirc,
      ),
    );
    final objectAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCirc,
        reverseCurve: Curves.easeInCirc,
      ),
    );

    final sizeIconAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.5, curve: Curves.easeOutCirc),
        reverseCurve: Curves.easeInCirc,
      ),
    );

    final arrowAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1, curve: Curves.easeOutCirc),
        reverseCurve: Interval(0.5, 1, curve: Curves.easeInCirc),
      ),
    );

    final elevationAnimation = Tween<double>(begin: 18, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.5),
        reverseCurve: Interval(0.5, 1),
      ),
    );

    void _onTap(int index) {
      if (controller.isAnimating) {
        return;
      }

      if (controller.value == 0) {
        controller.forward();
      } else {
        controller.reverse();
      }
      controllerMobx.setSelectedId(index);
    }

    return Observer(builder: (context) {
      print(controllerMobx.selectedId);
      return Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          AnimatedBuilder(
            animation: objectAnimation,
            child: _bodyCard(
              id: 0,
              arrowAnimation: arrowAnimation,
              elevationAnimation: elevationAnimation,
              iconAnimation: sizeIconAnimation,
              animation: sizeAnimation,
              title: 'REALTY',
              icon: FontAwesomeIcons.home,
              color: Color(0xFF94C325),
              onTap: () {
                _onTap(0);
              },
            ),
            builder: (_, child) {
              return Transform.translate(
                offset: Offset(0, objectAnimation.value * (heightForOne * 3)),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: objectAnimation,
            child: _bodyCard(
              id: 1,
              elevationAnimation: elevationAnimation,
              arrowAnimation: arrowAnimation,
              iconAnimation: sizeIconAnimation,
              animation: sizeAnimation,
              title: 'JOB',
              icon: FontAwesomeIcons.userTie,
              color: Color(0xFF18A0FA),
              onTap: () {
                _onTap(1);
              },
            ),
            builder: (_, child) {
              return Transform.translate(
                offset: Offset(0, objectAnimation.value * (heightForOne * 2)),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: objectAnimation,
            child: _bodyCard(
              id: 2,
              elevationAnimation: elevationAnimation,
              arrowAnimation: arrowAnimation,
              iconAnimation: sizeIconAnimation,
              animation: sizeAnimation,
              title: 'AUTO',
              icon: FontAwesomeIcons.carAlt,
              color: Color(0xFFFC6F61),
              onTap: () {
                _onTap(2);
              },
            ),
            builder: (_, child) {
              return Transform.translate(
                // alignment: Alignment(0, objectAnimation.value * (heightForOne)),
                offset: Offset(0, objectAnimation.value * (heightForOne)),
                child: child,
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _bodyCard(
                id: 3,
                elevationAnimation: elevationAnimation,
                arrowAnimation: arrowAnimation,
                iconAnimation: sizeIconAnimation,
                animation: sizeAnimation,
                title: 'SERVICES',
                icon: FontAwesomeIcons.conciergeBell,
                color: Color(0xFFD77EFC),
                onTap: () {
                  _onTap(3);
                }),
          ),
        ].orderById(controllerMobx.selectedId),
      );
    });
  }
}
