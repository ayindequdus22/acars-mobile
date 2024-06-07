import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});
//  <h1>
  final String imageUrl = "https://res.cloudinary.com/dxoemtk19/image/upload/v1715175718/image_6_hl6c7t.jpg";
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(width: double.infinity,
        height: setHeight(300),
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imageUrl))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,children: [
                 Text("Speedy Luxurious Cars",style: Theme.of(context).textTheme.titleLarge,),
    Text("There are varieties of this in our store.For those who prefer speed,check out ferrari,porsche and other sport cars.",style: Theme.of(context).textTheme.titleMedium,)
      
          ],),
        )
      ]
    );
  }
}
// https://res.cloudinary.com/dxoemtk19/image/upload/v1715175718/image_6_hl6c7t.jpg
//  <h1>Speedy Luxurious Cars</h1>
//         <p>
//           There are varieties of this in our store.For those who prefer
//           speed,check out ferrari,porsche and other sport cars.
//         </p>