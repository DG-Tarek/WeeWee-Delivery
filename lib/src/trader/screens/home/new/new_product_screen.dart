
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/moduls/trader/product_model.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';

import '../../../../constant/constant.dart';


class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key }) : super(key: key );


  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {


  String _weight = "0";
  String _width = "0";
  String _height = "0";
  String _length = "0";

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  late TextEditingController _minStockController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _stockController = TextEditingController();
    _minStockController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _minStockController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/product.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("New Product"),

          ],
        ),
      ),
      body: SingleChildScrollView(
        //  physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Text("Product Information" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 15.h,),
              TextField(
                controller: _nameController,
                decoration: const  InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'Product Name',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'Product Description',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style:const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'Price (DA )',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40,),
              Text("Product Dimension" , style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 20,),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Weight',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                ),
                items: PRODUCT_WEIGHT
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  _weight = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.deepPurple,
                  ),
                  iconSize: 26,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Width',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                ),
                items: PRODUCT_DIMENSIONS
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  _width = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.deepPurple,
                  ),
                  iconSize: 26,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Height',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                ),
                items: PRODUCT_DIMENSIONS
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  _height=value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.deepPurple,
                  ),
                  iconSize: 26,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Length',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                ),
                items: PRODUCT_DIMENSIONS
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  _length = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.deepPurple,
                  ),
                  iconSize: 26,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const SizedBox(height: 40,),
              Text("Stock" , style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 20,),
              TextField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'My Stock',
                    labelStyle:  TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _minStockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'Min Stock',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: const TextStyle(color: Colors.black),
              ),
              SizedBox(height: 40.h,),
              Container(
                width: width,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    if(_nameController.text.isEmpty || _descriptionController.text.isEmpty || _priceController.text.isEmpty ){

                       debugPrint("Information");
                    }else if( _height =='0' || _weight =='0' || _width =='0' || _length =='0' ){
                      debugPrint("Demontion");
                    }else if( _stockController.text.isEmpty || _minStockController.text.isEmpty){
                      debugPrint("stock");
                    }
                      else{
                      try{
                        final Product product = Product(name: _nameController.text, description: _descriptionController.text, price: double.parse(_priceController.text), height: _height,
                            width: _width, length: _length, wight: _weight, stock: int.parse(_stockController.text), minStock: int.parse(_minStockController.text) , createdAt: createdAtTime());
                        TraderFirebaseCubit().createProduct(product: product);
                      }catch(e){
                        debugPrint("Invalid Inputs");
                      }
                    }
                  },
                  child: Container(
                    height: 85.w,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.deepPurple , width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(24.w)),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 64.w),
                    child: Text("Save Product" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
            ],
          )
        ),
      ),
    );
  }

}