


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/deliver/provider/deliver_firebase_cubit.dart';
import 'package:weewee_delivery/src/deliver/screens/packages/package_item.dart';

import '../../state_management/deliver/main_cubit/deliver_main_cubit.dart';

class PackagesListScreen extends StatefulWidget {
  const PackagesListScreen({Key? key}) : super(key: key);

  @override
  State<PackagesListScreen> createState() => _PackagesListScreenState();
}

class _PackagesListScreenState extends State<PackagesListScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Flexible(child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent,width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                isExpanded: true,
                hint:  Text(
                  DeliverMainCubit().selectedTypeOfPackages,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                ),
                items: DeliverMainCubit().typesOfPackages
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: item == DeliverMainCubit().selectedTypeOfPackages ? Colors.white : Colors.teal
                        ),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    DeliverMainCubit().changeSelectedTypeOfPackages(value);
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
              )),
              //Icon(CupertinoIcons.list_number)
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,index){
                  return Container(
                    padding: index == 0 ? const EdgeInsets.only(top: 20) : null,
                    child: PackageItem(package: DeliverFirebaseCubit().myPackagesList[index],),
                  );
                },
              childCount: DeliverFirebaseCubit().myPackagesList.length
            ))
      ],
    );
  }
}
