
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DriverPage();
  }
}

class TraderPage extends StatefulWidget {
  const TraderPage({Key? key}) : super(key: key);

  @override
  State<TraderPage> createState() => _TraderPageState();
}

class _TraderPageState extends State<TraderPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Text("Company/Store Information", style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w500
          ),),
          SizedBox(height: height*.035,),
          const TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,),
                ),
                labelText: 'Store name (Company)',
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
                labelText: 'Commercial register Number (NIf)',
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
                labelText: 'Tax Identification Number (NIF)',
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
                labelText: 'Package Estimation/Week',
                labelStyle: TextStyle(color: Colors.deepPurple)

            ),
            //style: TextStyle(color: Colors.deepPurple),
          ),
          const SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.deepPurple)
            ),
            child: Column(
              children: [
                Text("Our service is working with the help of geolocation to make delivery operation more efficient. Please, Select your Location on Map",
                textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w400),

                ),
                SizedBox(height: 12,),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select on Map", style: TextStyle(color: Colors.white),),
                      Icon(Icons.location_searching , color: Colors.white,)
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}


class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  String _time = "any time";
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: Text("I'm available to deliver",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.deepPurple , fontWeight: FontWeight.w500)
            ,),
        ),
        SizedBox(height: 15.h,),
        Container(
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24.w)),
              border: Border.all(color: Colors.deepPurple, width: 1)
          ),
          child:Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(

                      title: Text("Any time", style: TextStyle(
                          color: Colors.deepPurple, fontSize: 15)),
                      value: "any time",
                      groupValue: _time,
                      onChanged: (value) {
                        setState(() {
                          _time = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(child: RadioListTile(
                    title: Text("Morning", style: TextStyle(
                        color: Colors.deepPurple, fontSize: 15),),
                    value: "morning",
                    groupValue: _time,
                    onChanged: (value) {
                      setState(() {
                        _time = value.toString();
                      });
                    },
                  ),)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(

                      title: Text("Afternoon", style: TextStyle(
                          color: Colors.deepPurple, fontSize: 15)),
                      value: "afternoon",
                      groupValue: _time,
                      onChanged: (value) {
                        setState(() {
                          _time = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(child: RadioListTile(
                    title: Text("Evening", style: TextStyle(
                        color: Colors.deepPurple, fontSize: 15),),
                    value: "evening",
                    groupValue: _time,
                    onChanged: (value) {
                      setState(() {
                        _time = value.toString();
                      });
                    },
                  ),)
                ],
              ),
            ],
          )
        ),
        SizedBox(height: 15.h,),
        SizedBox(
          height: 400,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
            mainAxisSpacing: 25.w,
            crossAxisSpacing: 25.w,
            children: TRONSPORTS.map((t) => Container(
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24.w)),
                border: Border.all(color: Colors.deepPurple, width: 1),
              ),
              child: t.image.isNotEmpty? Image.asset(t.image) : Icon(Icons.directions_walk),
            )).toList(),
          ),
        )
      ],
    );
  }
}


