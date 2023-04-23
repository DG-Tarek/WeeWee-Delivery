

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {

  String _weight = "0";
  String _width = "0";
  String _height = "0";
  String _length = "0";

  String _wilaya = "Wilaya";
  String _baladia = "Towne (Commune)";


  // Product Controllers
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  // Client Controllers
  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _optionalPhoneNumberController;
  late TextEditingController _addressController;


  @override
  void initState() {
    super.initState();
    // Product Controllers
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    // Client Controllers
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _optionalPhoneNumberController = TextEditingController();
    _addressController = TextEditingController();
  }

  void dispose() {
    // Product Controllers
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    // Client Controllers
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _optionalPhoneNumberController.dispose();
    _addressController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset("assets/icons/order.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("New Order"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Text("Product Section" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 10.h,),
              //select Product from Stock
              Container(
                height: 120.w,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
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
                  Icon(CupertinoIcons.right_chevron , color: Colors.white, size: 22,),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),

              if(true)...[
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

              SizedBox(height: 15.h,),
              Text("Client Section" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 10.h,),
              Container(
                height: 120.w,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
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
                    Text("Select Client from Client List" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    Icon(CupertinoIcons.right_chevron , color: Colors.white, size: 22,),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              if(true)...[
                Text("Client Information" , style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: 10.h,),
                TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelText: 'Client Full Name',
                      labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: _phoneNumberController,
                  keyboardType:  TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _optionalPhoneNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelText: 'Optional Phone Number',
                      labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10,),
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
                  hint:  const Text(
                    "Wilaya",
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                  ),
                  items: WILAYA
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
                    _wilaya = value.toString();
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
                  hint:   const Text(
                    "Town (Commune)",
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                  ),
                  items: WILAYA
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
                    _baladia = value.toString();
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
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelText: 'Client Address',
                      labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 40,),
                Text("Delivery point on the Map" , style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16,),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: "If you don't know exactly ",
                    style: const TextStyle(color: Colors.black54 , height: 1.35),
                    children: <TextSpan>[
                      TextSpan(text: 'Geolocation', style: TextStyle(  color: Colors.deepPurple.shade400)),
                      const TextSpan(text: ' on '),
                      TextSpan(text: 'Map ', style: TextStyle(  color: Colors.deepPurple.shade400)),
                      const TextSpan(text: ' for your Client, you can skip this option.'),
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 12),

                  decoration:   BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border.all(color: Colors.deepPurple , width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(" Select on Map" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                      const Icon(Icons.location_searching , color: Colors.white,)
                    ],
                  ),
                ),
              ],
              SizedBox(height: 15.h,),
              Text("Delivery Options" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 10.h,),

            ],
          ),
        ),
      ),
    );
  }
}
