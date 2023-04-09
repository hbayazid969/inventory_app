
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {

  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // or
    // final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Upload Product'),
        ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding:  EdgeInsets.all(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    hintText: "Enter product name"
                  ),
                ),

                SizedBox(height: 20.h),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Barcode',
                    hintText: "Enter barcode number"
                  ),
                ),

                SizedBox(height: 20.h),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    hintText: "Enter product price"
                  ),
                ),

                SizedBox(height: 20.h),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: "Enter product description"
                  ),
                ),

                SizedBox(height: 20.h),
                MaterialButton(
                  height: 100.h,
                  minWidth: 100.w,
                  color: Colors.blue,
                  onPressed: () => _pickImage(),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera,size: 30.h,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Text('Pick Product Image',style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white

                      ),),
                    ],
                  )),
                ),

                SizedBox(height: 40.h),

                Center(
                  child: MaterialButton(
                    color: Colors.blue,
                    minWidth: 200.w,
                    onPressed: () {
                   Get.back();
                    },
                    child:  Text('Upload',style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp
                    ),) ,
                  ),
                ),




              ],
            ),
          )
        ],
      ),

    );
  }
}
