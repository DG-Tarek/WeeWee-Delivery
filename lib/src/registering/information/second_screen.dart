import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/registering/information/third_screen.dart';

import '../../constant/constant.dart';

class SecondPage extends StatefulWidget {
    const SecondPage({Key? key, required this.accountType }) : super(key: key );

    final String accountType ;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _gender = "male";
  String _birthday = "Birthday";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      //  physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap:()=> Navigator. of(context). pop() ,
                child: Container(
                  height: 40.h,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(bottom: 24.w),
                  child: Icon(CupertinoIcons.left_chevron),),
              ),
              Text("Personal Information", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(height: 5.h,),
              Text(
                "2 of 3" ,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
              ),
              SizedBox(height: 12.5.h,),
              Stack(children: [
                Container(height: 2.h,width:  850.w,decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),),
                Container(
                  height: 2.h,
                  width:  240.w
                  ,decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),),
              ],),
              SizedBox(height: 15.h,),
              Text("Complete your Personal Information" , style: Theme.of(context).textTheme.titleLarge,),
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
                    labelText: 'First name',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
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
                    labelText: 'Last name',
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
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple,width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'Town (Commune)',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
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
                    labelText: 'Full Adress',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
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
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1950, 1, 1),
                      maxTime: DateTime(2005, 12, 31),
                      onConfirm: (date) {
                        setState(() {
                          _birthday =DateFormat.yMMMMd().format(date);
                        });
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en);
                },
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Colors.deepPurple, width: 0)
                  ),
                  height: 55,
                  width: width,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(

                      children: [
                        Text(_birthday,
                          style: TextStyle(color: Colors.deepPurple, fontSize: 16),),
                        Spacer(),
                        Icon(CupertinoIcons.calendar , color: Colors.deepPurple.withOpacity(.8),),
                        const SizedBox(width: 4,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(" Gender",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),),
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: Colors.deepPurple, width: 0)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(

                        title: Text("Male", style: TextStyle(
                            color: Colors.deepPurple, fontSize: 16)),
                        value: "male",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(child: RadioListTile(
                      title: Text("Female", style: TextStyle(
                          color: Colors.deepPurple, fontSize: 16),),
                      value: "female",
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 40.h,),
        Container(
          width: width,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(_createRoute()),
            child: Container(
              height: 85.w,
              width: 300.w,
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
              SizedBox(height: 25.h,),
            ],
          ),
        ),
      ),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  ThirdPage(accountType: widget.accountType,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}