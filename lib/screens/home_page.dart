import 'package:acars_mobile/widgets/home_hero.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context)  {
    return const Scaffold(body: Column(children: [
HomeHero(),
    ],));
  }
}