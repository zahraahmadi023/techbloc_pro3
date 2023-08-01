import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techbloc_pro3/component/myString.dart';
import 'package:techbloc_pro3/gen/assets.gen.dart';
import 'package:techbloc_pro3/view/my_cata.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;
    return SafeArea(
      child:Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.tcbot,height: 100,),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: RichText(
                  textAlign: TextAlign.center,
                  text:TextSpan(
                    text: MyStrings.welcom,
                    style:textTheme.bodyLarge

                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                    onPressed:(){
                      
                      _showgetEmailBottomSheet(context, size, textTheme);

                    },
                  child:Text("بزن بریم ",),
              
                  
                  ),
              ),
                
              
            ],
          ),
        ),
      )
    );
  }

  Future<dynamic> _showgetEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              height: size.height / 3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyStrings.insertYourEmail,
                        style: textTheme.bodyLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextField(
                          onChanged: (value) {
                            print("is email "+isEmail(value).toString());
                            
                          },
                          style: textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "namelastname@gmal.com",
                              hintStyle: textTheme.headlineSmall),
                        ),
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                        _showActivaiteCodeBottomsheet(context, size, textTheme);

                      }, child: Text("ادامه")),
                    ]),
              )),
        );
      },
    );
  }
    Future<dynamic> _showActivaiteCodeBottomsheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              height: size.height / 3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyStrings.activateCode,
                        style: textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextField(
                          // onChanged: (value) {
                          //   print("is email "+isEmail(value).toString());
                            
                          // },
                          style: textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "********",
                              hintStyle: textTheme.headlineSmall),
                        ),
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => MyCats(),));
                      }, child: Text("ادامه")),
                    ]),
              )),
        );
      },
    );
  }
}