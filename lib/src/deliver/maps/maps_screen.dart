

import 'package:circular_menu/circular_menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/state_management/deliver/deliver_main_cubit.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  final _animatedDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
        height: 120,
      width: width,
      color: Colors.deepPurple,
      alignment: Alignment.bottomCenter,
      child: DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent,width: 0),
            borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      isExpanded: true,
      hint:  Text(
        DriverMainCubit().selectedTypeOfPackages,
      style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      items:  DriverMainCubit().typesOfPackages
            .map((item) =>
              DropdownMenuItem<String>(
              value: item,
              child: Text(
              item,
              style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: item == DriverMainCubit().selectedTypeOfPackages ? Colors.white: Colors.deepPurple
              ),
              ),
              ))
            .toList(),
      onChanged: (value) {
        setState(() {
          DriverMainCubit().changeSelectedTypeOfPackages(value);
        });
      },
      buttonStyleData: const ButtonStyleData(
      height: 60,
      padding: EdgeInsets.only(right: 10),
      ),
      iconStyleData: const IconStyleData(
      icon: Icon(
      Icons.arrow_drop_down_outlined,
      color: Colors.white,
      ),
      iconSize: 26,
      ),
      dropdownStyleData: DropdownStyleData(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      ),
      ),
      )
      ),
          ),
          Text("Google Maps"),
          Positioned(
            height: 80,
              width: 80,
              right: 15,
              top: 135,
              child:  CircularMenu(
                toggleButtonSize: 30,
                 toggleButtonBoxShadow:  [
              BoxShadow(
              color: Colors.grey.shade300,
                spreadRadius: 8,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
              ],
                 alignment: Alignment.topRight,
                curve: Curves.fastOutSlowIn,
                  reverseCurve: Curves.fastOutSlowIn,
                  items: [
                    CircularMenuItem(
                        icon: Icons.gps_fixed_sharp,
                        onTap: () {
                      // callback
                    }),
                    CircularMenuItem(
                        icon: Icons.search,
                        onTap: () {
                      //callback
                    }),
                    CircularMenuItem(
                        icon: Icons.gps_fixed_sharp,
                        onTap: () {
                      //callback
                    }),

        ])),
          Positioned(
              left: 15,
              top: 145,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepPurple, width: 1),
                      shape: BoxShape.circle,
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text("999", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepPurple, fontSize: 17),),
                  ),
                  SizedBox(width: 12,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 1),
                      shape: BoxShape.circle,
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Image.asset("assets/icons/packagelogo.png"),
                  )
                ],
              ),)

        ],
      ),
    );
  }
}
