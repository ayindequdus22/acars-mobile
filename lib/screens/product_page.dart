import 'package:acars_mobile/controllers/productController.dart';
import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  final ProductController productcontroller = Get.put(ProductController());
   ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              
              child: Obx(
                (){
                  if(productcontroller.isLoading.value){
                    return const Center(child: CircularProgressIndicator());
                  }else{
         return   GridView.builder(
  physics: const BouncingScrollPhysics(),
  itemCount: productcontroller.productItems.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 12,
  ),
  itemBuilder: (context, index) {
    return Card(
 
    
      child: Column(
        children: [
          Image.network(productcontroller.productItems[index].image,),
          Text(
            productcontroller.productItems[index].name,
            style: const TextStyle(color: Colors.white), // Adjust text color
          ),
        ],
      ),
    );
  },
);
}
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}