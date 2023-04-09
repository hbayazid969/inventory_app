import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_app/controller/product_controller.dart';
import 'package:inventory_app/view/pages/bottomnavbar/landing/create_product.dart';
import 'package:inventory_app/view/pages/bottomnavbar/landing/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Homepage'),
      ),
      body: Obx(
            () => _productController.products.isNotEmpty
            ? ListView.builder(
          itemCount: _productController.products.length,
          itemBuilder: (context, index) {
            final product = _productController.products[index];
            return CustomProductCard(context, product);
          },
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Get.to(()=> CreateProductPage());
        },
        child: Icon(Icons.add,color: Colors.white,size: 22.h,),
      ),
    );
  }

  Padding CustomProductCard(BuildContext context, product) {
    return Padding(
            padding:  EdgeInsets.all(15.r),
            child: Container(
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 0.5
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //image and details and delete button
                  Padding(
                    padding:  EdgeInsets.all(12.r),
                    child: Row(
                      children: [
                        Image.network("${product['image']}",
                          height: 200.h,
                          width: 200.w,
                          ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(()=> ProductDetailsPage());
                              },
                              child: Container(
                                width: 110.w,
                                padding: EdgeInsets.all(4.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.amber,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.remove_red_eye_outlined),
                                    SizedBox(width: 2.w,),
                                    Text("View Details",style: TextStyle(fontSize: 16.sp),)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Container(
                              width: 110.w,
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.amber,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.delete),
                                  SizedBox(width: 2.w,),
                                  Text("Delete",style: TextStyle(fontSize: 16.sp),)
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  //product name and price
                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Text("${product['name']}",style: TextStyle(
                      fontSize: 16.sp
                    ),),
                  ),

                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Text(" BDT ${product['productPrice']['price']} TK",style: TextStyle(
                      fontSize: 16.sp
                    ),),
                  ),
                ],
              )
            ),
          );
  }
}
