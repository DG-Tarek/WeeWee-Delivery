
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

import '../../provider/trader_firebase_cubit.dart';
import '../../provider/trader_firebase_cubit_states.dart';
import '../home/packages/all_packages_screen.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
              children: [
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all( Radius.circular(0)),
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
                      Text("Stay Up To Date", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white.withOpacity(.85)),),
                      const SizedBox(height: 16,),
                      Text("Let's Check Your Packages ", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white , fontWeight: FontWeight.w500, fontSize: 18),),
                      const  SizedBox(height: 25,),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Calender(),
                BlocBuilder<TraderFirebaseCubit, TraderFirebaseCubitState>(
                    bloc: TraderFirebaseCubit(),
                    buildWhen: (previous, current)=> current is GetPackagesByDayLoadingState || current is GetPackagesByDaySuccessfullyState,
                    builder: (_, state) {
                      if( state is GetPackagesByDayLoadingState){
                        return Center(
                          child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.deepPurple,
                              size: 45,
                              secondRingColor: Colors.purple,
                              thirdRingColor: Colors.orange),
                        );
                      }
                      return  ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: TraderFirebaseCubit().packagesList.length ,
                            itemBuilder: (_,index){
                              return PackageItem(
                                package: TraderFirebaseCubit().packagesList[index],
                              ); });
                    }
                )

              ],
        ),
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
  void dispose() {
    _selectedDay = "up";
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    List<String> days = [];
    for (int i=3; i>0;i--){
    days.add(DateFormat.yMMMd().format(today.subtract( Duration(days: i))).replaceAll(",", ""));
    }
   for (int i=0; i<5;i++){
      days.add(DateFormat.yMMMd().format(today.add( Duration(days: i))).replaceAll(",", ""));
    }
    return SizedBox(
      height: 135,
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
               print(_selectedDay );
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
                  Text(day[0], style: TextStyle(fontSize:14 ,color: days[index] == _selectedDay ? Colors.white : Colors.white70, fontWeight: FontWeight.w400),),
                  SizedBox(height: 4,),
                  Container(height: .5,width : 36 ,color: days[index] == _selectedDay ? Colors.white : Colors.white70,),
                  SizedBox(height: 6,),
                  Text(day[1], style: TextStyle(color: days[index] == _selectedDay ? Colors.white: Colors.white70, fontWeight: FontWeight.w600, fontSize: 18),),
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
