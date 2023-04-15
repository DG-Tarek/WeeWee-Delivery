
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: [
              Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all( Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*.0875,),
                    SizedBox(height: 12,),
                    Text("Let's check your Packages ", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white , fontWeight: FontWeight.w500, fontSize: 22),),
                    const  SizedBox(height: 25,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Calender(),
            ],
      ),
    );
  }
}

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}
  String _selectedDay = "up";
class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    List<String> days = [];
    for (int i=21; i>0;i--){

    days.add(DateFormat.MMMd().format(today.subtract( Duration(days: i))));
    }
    days.add( DateFormat.MMMd().format(today));
    for (int i=0; i<7;i++){
      days.add(DateFormat.MMMd().format(today.add( Duration(days: i))));
    }
    return SizedBox(
      height: 137.5,
      child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,index){
            final day = days[index].split(" ");
        return AnimatedPadding(
          duration: Duration(milliseconds: 300),
          padding:   EdgeInsets.only(left: 10, bottom:days[index] == _selectedDay ? 10 : 30, top: days[index] == _selectedDay ? 30 : 6),
          child: GestureDetector(
            onTap: (){
             setState(() {
               _selectedDay = days[index];
             });
            },
            child: Container(
              width: 65,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(day[0], style: TextStyle(color: days[index] == _selectedDay ? Colors.white : Colors.white70, fontWeight: FontWeight.w400),),
                  SizedBox(height: 4,),
                  Container(height: .5,width : 36 ,color: days[index] == _selectedDay ? Colors.white : Colors.white70,),
                  SizedBox(height: 6,),
                  Text(day[1], style: TextStyle(color: days[index] == _selectedDay ? Colors.white: Colors.white70, fontWeight: FontWeight.w700, fontSize: 22),),
                  SizedBox(height:10,),
                  SizedBox(
                    height: 10,
                    child: days[index] == _selectedDay ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Icon(Icons.circle, color: Colors.white,size: 6,),
                        SizedBox(width: 2,),
                        Icon(Icons.circle, color: Colors.white,size: 6,)
                      ],
                    ): Row(
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Icon(Icons.circle_outlined, color: Colors.white70,size: 6,),
                        SizedBox(width: 2,),
                        Icon(Icons.circle_outlined, color: Colors.white70,size: 6,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
