import 'package:acars_mobile/models/product_model.dart';
import 'package:acars_mobile/utils/Api_Service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productItems = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productItems.assignAll(products);
      }
    } catch (e) {
     if(kDebugMode)   print(e);
    } finally {
      isLoading(false);
    }
  }
}