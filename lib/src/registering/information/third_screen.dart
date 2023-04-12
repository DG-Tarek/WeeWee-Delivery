
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/deliver/deliver_main_screen.dart';
import 'package:weewee_delivery/src/trader/trader_main_screen.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key, required this.accountType}) : super(key: key);
  final String accountType;
  @override
  Widget build(BuildContext context) {
    return accountType == "driver" ? DriverPage() : TraderPage();
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
    return  Scaffold(
      body: SingleChildScrollView(
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
                "3 of 3" ,
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
                  width:  720.w
                  ,decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),),
              ],),
              SizedBox(height: 15.h,),
              Text("Company / Store Information" , style: Theme.of(context).textTheme.titleLarge,),
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
                    labelText: 'Store name (Company)',
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
                    labelText: 'Commercial register Number (NIf)',
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
                    labelText: 'Tax Identification Number (NIF)',
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
                    labelText: 'Package Estimation/Week',
                    labelStyle: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w300)
                ),
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),

              const SizedBox(height: 20,),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "Our service is working with the help of ",
                  style: TextStyle(color: Colors.black54 , height: 1.35),
                  children: <TextSpan>[
                    TextSpan(text: 'geolocation', style: TextStyle(  color: Colors.deepPurple.shade400)),
                    TextSpan(text: ' to make delivery operation more efficient. Please, Select your '),
                    TextSpan(text: 'Location on Map', style: TextStyle(  color: Colors.deepPurple.shade400)),
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
              SizedBox(height: 40.h,),
              Container(
                width: width,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap : ()=>Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TraderMainScreen()),
                  ),
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
              )

            ],
          ),
        ),
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
  String _tronsport = "nothing";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
              Text("Confirmation", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(height: 5.h,),
              Text(
                "3 of 3" ,
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
                  width:  720.w
                  ,decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),),
              ],),
              SizedBox(height: 15.h,),
              Text("I'm Available to Deliver" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 15.h,),
              Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                    border: Border.all(color: Colors.deepPurple, width: 0)
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
              SizedBox(height: 25.h,),
              Text("Select your Delivery Method" , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 10.h,),
              Wrap(
                children: TRONSPORTS.map((t) => GestureDetector(
                  onTap: (){
                    setState(() {
                      _tronsport = t.name;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0 , bottom: 8),
                    child: AnimatedContainer(
                      height: 180.w,
                      width: 180.w,
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(28.w),
                      decoration: BoxDecoration(
                        color: _tronsport == t.name ?Colors.deepPurple.withOpacity(.25) : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24.w)),
                        border: Border.all(color: Colors.deepPurple, width: 0),
                      ),
                      child: t.image.isNotEmpty? Image.asset(t.image) : Icon(Icons.not_interested, color: Colors.deepPurple.withOpacity(.85),size: 36,),
                    ),
                  ),
                )).toList(),
              ),
          SizedBox(height: 40.h,),
        Container(
          width: width,
          alignment: Alignment.centerRight,
          child: GestureDetector(
                onTap : ()=>Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DeliverMainScreen()),
            ),
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
        )
            ],
          ),
        ),
      ),
    );
  }
}


