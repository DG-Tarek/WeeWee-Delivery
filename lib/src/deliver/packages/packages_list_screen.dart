

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/deliver/packages/package_item.dart';

class PackagesListScreen extends StatefulWidget {
  const PackagesListScreen({Key? key}) : super(key: key);

  @override
  State<PackagesListScreen> createState() => _PackagesListScreenState();
}

class _PackagesListScreenState extends State<PackagesListScreen> {
  String _list = "To pick-up";
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
                hint: const Text(
                  "To pick-up",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                ),
                items: const ["To pick-up", "To deliver", "To return"]
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: item == _list ? Colors.white : Colors.teal
                        ),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _list = value.toString();
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
                  return index == 0 ? const SizedBox(height: 20,): PackageItem();
                },
              childCount: 5
            ))
      ],
    );
  }
}
