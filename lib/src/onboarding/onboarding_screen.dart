import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weewee_delivery/src/constant/constant.dart';
import 'package:weewee_delivery/src/registering/information/first_screen.dart';
import 'package:weewee_delivery/src/registering/information/iformation_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({ super.key });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  late PageController _controller ;
  int _currentPage = 0;
  final _animatedDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentPage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.h,),
          SizedBox(
            height: 22.h,
            child: Row(
              children: [
                 SizedBox(width: 50.w,),
                Image.asset("assets/icons/logo.png" ,),
                const Spacer(),
                GestureDetector(
                  onTap: ()=>Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  FirstPage()),
                  ),
                  child: AnimatedOpacity(
                        duration : _animatedDuration,
                        opacity: _currentPage == 3 ? 0 : 1,
                        child:  Container(
                            width: 140.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24.w)),
                            border: Border.all(width: 1, color: Colors.deepPurple)
                          ),
                            child: Text("Skip", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple)))),
                ),
                SizedBox(width: 50.w,),
              ],
            ),
          ),
          const Spacer(),

          SizedBox(
            height: 1.sw,
            child: PageView(
              controller: _controller,
              onPageChanged: (page){
                setState(() {
                  _currentPage = page;
                });
              },
              children:const [
                 OnboardingPage(title: "WeeWee Delivery", image: "", text: "All the way to your door step"),
                OnboardingPage(title: "Package Tracking", image: "", text: "Observe packages journey\nfrom A to Z"),
                OnboardingPage(title: "Low Return Rate", image: "", text: "Our system is designed to\nLower Returns")
,
                OnboardingPage(title: "Map Integration", image: "", text: "With map and geolocalization,\nPackages are always on way")
,

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          SmoothPageIndicator(
            controller: _controller,
            count:  4,
            axisDirection: Axis.horizontal,
            effect:  ScrollingDotsEffect(

                spacing:  20.w,
                radius:  50.0,
                dotWidth:  20.w,
                dotHeight:  20.w,
                paintStyle:  PaintingStyle.fill,
                dotColor:  Colors.grey.withOpacity(.25),
                activeDotColor:  Colors.deepPurple
            ),
          ),

          const Spacer(),
          SizedBox(height: 25.h,),
          GestureDetector(
            onTap: (){
              if(_currentPage<3){
                setState(() {
                  _currentPage++;
                });
              }else{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  InformationScreen()),
                );
              }
              _controller.nextPage(
                duration: _animatedDuration,
                curve: Curves.fastOutSlowIn,
              );
            },
            child: Container(
              height: 22.h,
                width: 500.w,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(24.w)),
                ),
              child: AnimatedSwitcher(
                duration:  _animatedDuration,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _currentPage == 3 ? Text(
                    "GET STARTED" ,
                    key: ValueKey<bool>(_currentPage == 3),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),) : Text(
                  "NEXT" ,
                  key: ValueKey<bool>(_currentPage == 3),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                ),
            )
              ,

            ),
           SizedBox(height: 15.h,)
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({ super.key, required this.title, required this.image, required this.text });
  final String title;
  final String image ;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        children: [
          SizedBox(
              width: 800.w,
              child: Image.asset("assets/onboarding/onboarding.jpg")),
          SizedBox(height: 20.h,),
          Text(title,

              style:  Theme.of(context).textTheme.displayLarge),
          SizedBox(height: 6.h,),
           Text(text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}