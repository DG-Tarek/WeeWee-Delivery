import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/registering/information/first_page.dart';
import 'package:weewee_delivery/src/registering/information/second_page.dart';
import 'package:weewee_delivery/src/registering/information/third_page.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({ super.key });

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {


  final Duration _animatedDuration = Duration(milliseconds: 500);
  int _currentPage = 1;
  late PageController _controller ;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height*.03,),
            SizedBox(
              height: 45,
              width: width*.8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    child: AnimatedSwitcher(
                      duration:  _animatedDuration,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: _currentPage <=  1 ?

                      Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        key: ValueKey<bool>(_currentPage <= 1),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.deepPurple,width: 2)
                        ),
                        child: Text("1" , style: TextStyle(color: Colors.deepPurple , fontSize: 22),),
                      ) :
                      Container(
                        height: 45,
                        width: 45,
                        key: ValueKey<bool>(_currentPage <= 1),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.deepPurple,width: 2)
                        ),
                        child: Icon(Icons.done , color: Colors.white,),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 45,
                      child: Stack(
                        children: [
                          Container(height: 2,width : (width*.8)/2 -67.5,color: Colors.grey.withOpacity(.5),),
                          AnimatedContainer(
                            duration: _animatedDuration,
                            height: 2,
                            width :  _currentPage > 1 ? (width*.8)/2 -67.5 : 0,
                            color: Colors.deepPurple,)
                        ],
                      )),
                  AnimatedSwitcher(
                    duration:  _animatedDuration,
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: _currentPage <= 2 ?

                    Container(
                      height: 45,
                      width: 45,
                      alignment: Alignment.center,
                      key: ValueKey<bool>(_currentPage <= 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: _currentPage == 2 ? Colors.deepPurple : Colors.grey.withOpacity(.5),width: 2)
                      ),
                      child: Text("2" , style: TextStyle(color: _currentPage == 2 ? Colors.deepPurple : Colors.grey.withOpacity(.5) , fontSize: 22),),
                    ) :
                    Container(
                      height: 45,
                      width: 45,
                      key: ValueKey<bool>(_currentPage <= 1),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.deepPurple,width: 2)
                      ),
                      child: Icon(Icons.done , color: Colors.white,),
                    ),
                  ),
                  Positioned(
                      left: (width*.8)/2 +22.5,
                      child: Stack(
                        children: [
                          Container(height: 2,width : (width*.8)/2 -67.5,color: Colors.grey.withOpacity(.5),),
                          AnimatedContainer(
                            duration: _animatedDuration,
                            height: 2,
                            width :  _currentPage > 2 ? (width*.8)/2 -67.5 : 0,
                            color: Colors.deepPurple,)],
                      )),

                  Positioned(
                    right: 0,
                    child: AnimatedSwitcher(
                      duration:  _animatedDuration,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: _currentPage <= 3 ?

                      Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        key: ValueKey<bool>(_currentPage <= 3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: _currentPage == 3 ? Colors.deepPurple : Colors.grey.withOpacity(.5),width: 2)
                        ),
                        child: Text("3" , style: TextStyle(color: _currentPage == 3 ? Colors.deepPurple : Colors.grey.withOpacity(.5) , fontSize: 22),),
                      ) :
                      Container(
                        height: 45,
                        width: 45,
                        key: ValueKey<bool>(_currentPage <= 3),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.deepPurple,width: 2)
                        ),
                        child: Icon(Icons.done , color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*.03,),
            Flexible(
              child: PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FirstPage(),
                  SecondPage(),
                  ThirdPage(),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: width,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      if(_currentPage>1){
                        setState(() {
                          _currentPage--;
                        });
                      }
                      _controller.animateToPage(_currentPage-1, duration: _animatedDuration, curve: Curves.fastOutSlowIn);
                    },
                    child: AnimatedOpacity(
                      duration: _animatedDuration,
                      opacity:  _currentPage>1 ? 1 : 0,
                      child: Text(
                        "Previos" ,
                        style: const TextStyle(color: Colors.deepPurple ,fontSize: 18),),
                    ),
                  ),

                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      if(_currentPage<3){
                        setState(() {
                          _currentPage++;
                        });
                        _controller.nextPage(duration: _animatedDuration, curve: Curves.fastOutSlowIn);
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 160,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Next" ,
                        style: const TextStyle(color: Colors.white ,fontSize: 18 ,fontWeight: FontWeight.w500),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height*.025,),
          ],
        )
      ),

    );
  }
}