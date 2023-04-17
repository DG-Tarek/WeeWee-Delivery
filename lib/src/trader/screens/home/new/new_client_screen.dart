
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/constant.dart';

class NewClientScreen extends StatefulWidget {
  const NewClientScreen({Key? key}) : super(key: key);

  @override
  State<NewClientScreen> createState() => _NewClientScreenState();
}

class _NewClientScreenState extends State<NewClientScreen> {
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
              child: Image.asset("assets/icons/add-client.png",color: Colors.white,),
            ),
            SizedBox(width: 12,),
            Text("New Client"),

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
              Text("Client Information" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 15.h,),
              const TextField(
                decoration: InputDecoration(
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
              const TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'Client Mobile Number',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: TextStyle(color: Colors.black),
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
                  'Wilaya',
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
                  print(value.toString());
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
                  'Town (Commune )',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w300),
                ),
                items: ["16 - Alger", "18 - Jijel"]
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
                  print(value.toString());
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
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
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
                  style: TextStyle(color: Colors.black54 , height: 1.35),
                  children: <TextSpan>[
                    TextSpan(text: 'Geolocation', style: TextStyle(  color: Colors.deepPurple.shade400)),
                    TextSpan(text: ' on '),
                    TextSpan(text: 'Map ', style: TextStyle(  color: Colors.deepPurple.shade400)),
                    TextSpan(text: ' for your Client, you can skip this option.'),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 12),

                decoration:   BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.deepPurple , width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(24.w)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select on Map" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    Icon(Icons.location_searching , color: Colors.white,)
                  ],
                ),
              ),

              SizedBox(height: 20.h,),
              Container(
                width: width,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    print("Client Saved !");
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
                    child: Text("Save Client" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
            ],
          ),
        ),
      ),
    );
  }
}
