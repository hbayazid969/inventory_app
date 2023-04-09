import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_app/controller/product_controller.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Obx(
            () => _productController.products.isNotEmpty
            ? ListView.builder(
          itemCount: _productController.products.length,
          itemBuilder: (context, index) {
            final product = _productController.products[index];
            return Padding(
              padding:  EdgeInsets.all(18.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network("${product['image']}",
                      height: 300.h,
                    ),
                  ),

                  SizedBox(height: 20.h,),

                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Text("${product['name']}",style: TextStyle(
                        fontSize: 16.sp
                    ),),
                  ),

                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Text("About this product",style: TextStyle(
                        fontSize: 20.sp,
                      fontWeight: FontWeight.w600
                    ),),
                  ),


                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Text("${product['description']}",style: TextStyle(
                        fontSize: 16.sp
                    ),),
                  ),

                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Text(" BDT ${product['productPrice']['price']} TK",style: TextStyle(
                        fontSize: 16.sp
                    ),),
                  ),

                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Text("Barcode : ${product['barcode']}",style: TextStyle(
                        fontSize: 16.sp
                    ),),
                  ),

                ],
              ),
            );
          },
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

}
