import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/animated_container_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/inputs_page.dart';
import 'package:components/src/pages/listview_page.dart';
import 'package:components/src/pages/lottie_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animated': (BuildContext context) => AnimatedContainerPage(),
    'lottie': (BuildContext context) => LottiePage(),
    'inputs': (BuildContext context) => InputsPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListViewPage(),

    

  };
}
