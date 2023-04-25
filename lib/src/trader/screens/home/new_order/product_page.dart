import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';
import 'package:weewee_delivery/src/trader/screens/home/stock/stock_screen.dart';

import '../../../../constant/constant.dart';
import '../../../../moduls/trader/product_model.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, required this.pageController }) : super(key: key);

  final PageController pageController ;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with AutomaticKeepAliveClientMixin<ProductPage> {

  @override
  bool get wantKeepAlive => true;

  String _weight = "0";
  String _width = "0";
  String _height = "0";
  String _length = "0";



  // Product Controllers
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;



  @override
  void initState() {
    super.initState();
    // Product Controllers
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();

  }

  void dispose() {
    // Product Controllers
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();


    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
      bloc: TraderFirebaseCubit(),
        buildWhen: (previous, current)=> current is SelectedProductState,
        builder: (_, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product selection", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
                    SizedBox(height: 5.h,),
                    Text(
                      "1 of 3" ,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const StockScreen(selectIsAvailable: true,)),
                    );
                  },
                  child: Container(
                    height: 120.w,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Product from Stock" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                        Icon(CupertinoIcons.collections , color: Colors.white, size: 22,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              TraderFirebaseCubit().firstProductChoice != null ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                            TraderFirebaseCubit().setFirstProductChoice(null);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18.0, bottom: 6),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              boxShadow: [BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 5,
                                blurRadius: 1,
                                offset: Offset(1, 1),
                              ),
                              ],
                            ),
                            child: const Icon(Icons.close, color: Colors.white,size: 22,),
                          ),
                        ),
                      ),
                      StockItem(product: TraderFirebaseCubit().firstProductChoice!),
                    ],
                  )
                  :
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Product Information" , style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: 10.h,),
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
                    Text("Product Dimension" , style: Theme.of(context).textTheme.titleMedium,),
                    const SizedBox(height: 20,),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
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
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
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
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
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
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const OutlineInputBorder(
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

                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  width: width,
                  child: GestureDetector(
                    onTap: (){
                      if(TraderFirebaseCubit().firstProductChoice != null){
                        widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                      }else{
                        if(_nameController.text.isEmpty || _descriptionController.text.isEmpty || _priceController.text.isEmpty ){
                          debugPrint("Information");
                        }else if( _height =='0' || _weight =='0' || _width =='0' || _length =='0' ){
                          debugPrint("Demontion");}
                        else{
                          try{
                            final Product product = Product(name: _nameController.text, description: _descriptionController.text, price: double.parse(_priceController.text), height: _height,
                                width: _width, length: _length, wight: _weight, stock: 0, minStock: 0, createdAt: createdTime());
                            TraderFirebaseCubit().setFirstProductChoice(product);
                            widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                          }catch(e){
                            debugPrint("Invalid Inputs");
                          }
                        }
                      }
                    },
                    child: Container(
                      height: 85.w,
                      width: width*.4,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(color: Colors.deepPurple , width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(24.w)),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 64.w),
                      child: Text("Next" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
            ],
          ),
        );
      }
    );
  }
}

