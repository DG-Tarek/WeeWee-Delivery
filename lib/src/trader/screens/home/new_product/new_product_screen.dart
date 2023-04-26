
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/moduls/trader/product_model.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit.dart';
import 'package:weewee_delivery/src/trader/provider/trader_firebase_cubit_states.dart';

import '../../../../constant/constant.dart';


class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key }) : super(key: key );


  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> with SingleTickerProviderStateMixin {


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

 final Duration _animatedDuration = const Duration(milliseconds: 300) ;
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
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron ),
          onPressed: (){
            TraderFirebaseCubit().restoreProductState();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<TraderFirebaseCubit,TraderFirebaseCubitState>(
        bloc: TraderFirebaseCubit(),
        buildWhen: (previous, current) => current is NewProductLoadingState || current is NewProductSuccessfullyState || current is NewProductState,
        builder: (_,state) {
          if(state is NewProductLoadingState || state is NewProductSuccessfullyState){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 15.h,),
                   AnimatedSwitcher(
                      duration: _animatedDuration,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition( opacity: animation, child: child);
                      },
                      child: state is NewProductLoadingState ?
                            Container(
                              height: 150,width: 160,
                              alignment: Alignment.center,
                              key: ValueKey<bool>(state is NewProductSuccessfullyState),
                              child: LoadingAnimationWidget.discreteCircle(
                                  color: Colors.deepPurple,
                                  size: 45,
                                  secondRingColor: Colors.purple,
                                  thirdRingColor: Colors.orange),
                                  )

                            :Container(

                              key: ValueKey<bool>(state is NewProductSuccessfullyState),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const SizedBox(height: 150,width: 160,),
                                      Container(
                                          padding: EdgeInsets.all(24),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(width: 3, color: Colors.green)
                                          ),
                                          height: 120,
                                          width: 120,
                                          child: Image.asset("assets/icons/packagelogo.png")),
                                      const Positioned(
                                      top: 10,
                                          right: 0,
                                          child: Icon(Icons.done,color: Colors.green,size: 62,))
                                    ],
                                  ),
                                ],
                              ),
                             ),

                    ),
                  AnimatedSwitcher(
                    duration: _animatedDuration,
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition( opacity: animation, child: child);
                    },
                    child: state is NewProductLoadingState ?
                    Container(

                    ) :Container(

                      key: ValueKey<bool>(state is NewProductSuccessfullyState),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Product ",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black87, height: 1.45),
                              children: <TextSpan>[
                                TextSpan(text: _nameController.text, style: TextStyle(  color: Colors.deepPurple)),
                                const TextSpan(text: ' added Successfully to your '),
                                const TextSpan(text: "Stock.", style: TextStyle(  color: Colors.deepPurple)),

                              ],
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  TraderFirebaseCubit().restoreProductState();
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 85.w,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.deepPurple , width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 64.w),
                                  child: Text("Back" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple),),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  TraderFirebaseCubit().restoreProductState();
                                 _nameController.clear();
                                  _descriptionController.clear();
                                  _priceController.clear();
                                  _stockController.clear();
                                  _minStockController.clear();
                                },
                                child: Container(
                                  height: 85.w,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    border: Border.all(color: Colors.deepPurple , width: 0),
                                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 64.w),
                                  child: Text("Add Another Product" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),

                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
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
                                  width: _width, length: _length, wight: _weight, stock: int.parse(_stockController.text), minStock: int.parse(_minStockController.text) , createdAt: createdTime());
                              TraderFirebaseCubit().NewProduct(product: product);
                            }catch(e){
                              debugPrint("Invalid Inputs");
                            }
                          }
                        },
                        child: Container(
                          height: 85.w,
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
          );
        }
      ),
    );
  }

}