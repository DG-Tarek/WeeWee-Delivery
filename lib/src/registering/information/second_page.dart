import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../constant/constant.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _gender = "male";
  String _birthday = "Birthday";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .85,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Personal Information",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.deepPurple , fontWeight: FontWeight.w500)
                ,),
            ),
            SizedBox(height: 15.h,),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,),
                  ),
                  labelText: 'First name',
                  labelStyle: TextStyle(color: Colors.deepPurple)

              ),
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20,),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,),
                  ),
                  labelText: 'Last name',
                  labelStyle: TextStyle(color: Colors.deepPurple)

              ),
              //style: TextStyle(color: Colors.deepPurple),
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
                  borderSide: BorderSide(color: Colors.deepPurple,),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
              isExpanded: true,
              hint: const Text(
                'Wilaya',
                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
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
              validator: (value) {
                if (value == null) {
                  return 'Please select _gender.';
                }
                return null;
              },
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
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,),
                  ),
                  labelText: 'Town (Commune)',
                  labelStyle: TextStyle(color: Colors.deepPurple)

              ),
              //style: TextStyle(color: Colors.deepPurple),
            ),
            const SizedBox(height: 20,),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,),
                  ),
                  labelText: 'Full address',
                  labelStyle: TextStyle(color: Colors.deepPurple)

              ),
              //style: TextStyle(color: Colors.deepPurple),
            ),
            const SizedBox(height: 20,),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple,),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.deepPurple)

              ),
              //style: TextStyle(color: Colors.deepPurple),
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
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: Colors.deepPurple, width: 1)
                ),
                height: 55,
                width: width,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(_birthday,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 16),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(" Gender",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple),),
            SizedBox(height: 15,),
            Container(
              height: 60,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Colors.deepPurple, width: 1)
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
            SizedBox(height: 20,),

          ],
        ),
      ),
    )
    ;
  }
}