import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({ super.key });

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _type = "";
  final Duration _animatedDuration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Type of Account", style: TextStyle(
            fontSize: 24,
            color: Colors.deepPurple,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(height: height*.035,),
        SizedBox(
          height: 165,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
            GestureDetector(
              onTap: ()=>
                setState(() {
                  _type = "driver";
                })
              ,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: _animatedDuration ,
                    height: 120 + (_type == "driver"? 10 : 0),
                    width: 120 + (_type == "driver"? 10 : 0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: Offset(-6.0, -6.0),
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ],
                      color:  _type == "driver"? Colors.deepPurple.withOpacity(.2) :Colors.white,
                      //color: _type == "driver"?Colors.deepPurple.withOpacity(.15) : Colors.transparent,
                      border: Border.all(width: 1, color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/icons/driver.png"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Driver", style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),
              SizedBox(width: 30,),
              GestureDetector(
                onTap: ()=>
                    setState(() {
                      _type = "trader";
                    })
                ,
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: _animatedDuration ,
                      height: 120 + (_type == "trader"? 10 : 0),
                      width: 120 + (_type == "trader"? 10 : 0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                            offset: Offset(-6.0, -6.0),
                            blurRadius: 16.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 16.0,
                          ),
                        ],
                        color:  _type == "trader"? Colors.deepPurple.withOpacity(.2) :Colors.white,
                        //color: _type == "trader"?Colors.deepPurple.withOpacity(.15) : Colors.transparent,
                        border: Border.all(width: 1, color: Colors.deepPurple),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/icons/trader.png"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Trader", style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w400
                    ),),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        SizedBox(height: height*.05,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: AnimatedSwitcher(
            duration:  _animatedDuration,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _type == "driver" ? Text("Driver is a person who delivers goods to customers usually over a regular local route.",
    textAlign: TextAlign.center,
    key: ValueKey<bool>(_type == "driver"),
    style: TextStyle(
    height: 1.25,
    fontSize: 18,
    color: Colors.deepPurple,
    fontWeight: FontWeight.w300
    ),) : _type == "trader" ? Text("Trader is an interchange of goods or commodities, between different parts of the country, trade, business.",
    textAlign: TextAlign.center,
    key: ValueKey<bool>(_type == "driver"),
    style: TextStyle(
    height: 1.25,
    fontSize: 18,
    color: Colors.deepPurple,
    fontWeight: FontWeight.w300
    ),):Container()),
        ),
      ],
    );
  }
}