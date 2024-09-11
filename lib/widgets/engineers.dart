import 'package:acars_mobile/models/engineer_models.dart';
import 'package:flutter/material.dart';

class Engineers extends StatelessWidget {
  const Engineers({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
itemCount: engineerModels.length,
    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder:(context,index){
      return SizedBox(
        child: Column(children: [
          Image.network(engineerModels[index].image)
        ],),
      );
    },
    );
  }
}