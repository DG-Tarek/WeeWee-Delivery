import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weewee_delivery/src/registering/information/first_screen.dart';
import 'package:weewee_delivery/src/registering/information/second_screen.dart';
import 'package:weewee_delivery/src/registering/information/third_screen.dart';


class InformationScreen extends StatefulWidget {
  const InformationScreen({ super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {


  // final Duration _animatedDuration = Duration(milliseconds: 500);
  int _currentPage = 1;
  late PageController _controller ;
  late PageController _pageController ;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _pageController = PageController();
  }

     goNext(){
    if(_currentPage<3){
      setState(() {
        _currentPage ++;
      });
    }
  }
 
  _back(){
    if(_currentPage>1){
      setState(() {
        _currentPage--;
      });
      _controller.animateToPage(_currentPage -1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      _pageController.animateToPage(_currentPage -1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:()=>_back(),
                        child: Container(
                          height: 40.h,
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(bottom: 24.w),
                          child: AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: _currentPage >1 ? 1 : 0,
                              child: Icon(CupertinoIcons.left_chevron)),
                         ),
                      ),
                      SizedBox(
                        height: 35,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                           controller: _pageController,
                          children:  [
                            Text("Type of Account", style: Theme.of(context).textTheme.titleLarge,),
                            Text("Personal Information", style: Theme.of(context).textTheme.titleLarge,),
                            Text("Confirmation", style: Theme.of(context).textTheme.titleLarge,),
                            ],
                      ),),
                      Row(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return ScaleTransition(scale: animation, child: child);
                            },
                            child: Text(
                              "$_currentPage" ,
                              key: ValueKey<int>(_currentPage),
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
                            ),
                          ),
                          Text(
                            " of 3" ,
                            key: ValueKey<int>(_currentPage),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Stack(children: [
                        Container(height: 2.h,width:  850.w,decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),),

                         AnimatedContainer(
                           duration: Duration(milliseconds: 500),
                           height: 2.h,
                           width:  _currentPage == 1 ? 90.w : _currentPage == 2 ? 250.w : 650.w
                           ,decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),),
                      ],),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Flexible(
                  fit: FlexFit.loose,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
                     // FirstPage(controller: _controller, pageController: _pageController,goNext: goNext,),
                      //SecondPage(controller: _controller, pageController: _pageController, goNext: goNext,),
                      ThirdPage()
                    ],
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}



    /*
    *
    *  SizedBox(height: 100.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 85.w,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white , width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(24.w)),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 64.w),
                  child: Text("Previous" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple),),
                ),
                Container(
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
                )
              ],
            )*/