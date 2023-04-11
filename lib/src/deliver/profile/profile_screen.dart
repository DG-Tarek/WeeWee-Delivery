
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/constant/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool _available = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height*.1,
            alignment: Alignment.bottomRight,
              child: Row(
mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 26,
                  width: 26,
                    child: Image.asset("assets/icons/edit.png" , color: Colors.deepPurple,),
                  ),
                  const SizedBox(width: 16,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SizedBox(height: 25,
                      width: 25,
                      child: Image.asset("assets/icons/logout.png" , color: Colors.deepPurple,),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: height*.1,
                  width: height*.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.deepPurple, width: 2)
                ),
                child:Image.asset("assets/icons/driver.png"),),
                SizedBox(width: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("WeeWee Driver", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.deepPurple),),
                    Text("Joined 6 mon ago", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black54, fontWeight: FontWeight.w300),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40,),
            Text("Kadour", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black),),
            SizedBox(height: 2,),
            Text("Lhayecha", style: Theme.of(context).textTheme.headlineSmall,),
            SizedBox(height: 25,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 22.5,
                width: 22.5,
                child: Image.asset("assets/icons/phone.png"),),
                SizedBox(width: 8,),
                Text("+213 556836200", style: Theme.of(context).textTheme.titleMedium,),
                              ],
                            ),

            SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 22.5,
                  width: 22.5,
                  child: Image.asset("assets/icons/location.png"),),
                SizedBox(width: 10,),
                Text("Alger, Mohammadia", style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("I'm Available", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
                Switch(
                  value: _available,
                  onChanged: (bool value) {
                    setState(() {
                      _available = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 10,),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: "By setting this option ON you will be in the ",
                style: TextStyle(color: Colors.black54 , height: 1.35),
                children: <TextSpan>[
                  TextSpan(text: 'Deliver Mode', style: TextStyle(  color: Colors.deepPurple.shade400)),
                  TextSpan(text: ', and the '),
                  TextSpan(text: 'WeeWee Service', style: TextStyle(  color: Colors.deepPurple.shade400)),
                  TextSpan(text: ' will send you Offers for delivery.'),
                ],
              ),
            ),
            SizedBox(height: 100,),

            Text("If you have any Problem or Inquiry, do not hesitate to contact us, we will be happy to help you.",
            style: TextStyle(color: Colors.black54 , height: 1.35),
              textAlign: TextAlign.justify,

            ),
            SizedBox(height: 24,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
               alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: Text("Contact Us Now  >" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
