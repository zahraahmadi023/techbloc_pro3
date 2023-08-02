import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techbloc_pro3/component/myColor.dart';
import 'package:techbloc_pro3/component/myString.dart';
import 'package:techbloc_pro3/gen/assets.gen.dart';
import 'package:techbloc_pro3/models/fake_data.dart';

import '../component/my_component.dart';

class MyCats extends StatefulWidget{
  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;
    var  bodyMargin=size.width/10;
    // TODO: implement build
    return SafeArea(
      child:Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(left: bodyMargin,right: bodyMargin),
          child: SingleChildScrollView(
            child: Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  SvgPicture.asset(Assets.images.tcbot,height: 100,),
                  SizedBox(height: 12,),
                  Text(MyStrings.successfulRegistration,style:textTheme.bodyLarge,),
                  TextField(
                    style: textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "نام و نام خانواگی ",
                      hintStyle: textTheme.headlineSmall,
                  
                    ),
                    
                  ),
                  SizedBox(height: 32,),
                  Text(MyStrings.chooseCats,style:textTheme.bodyLarge,),

                  SizedBox(height: 32,),
                  ////////////listcatg
                  SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.3,
                      crossAxisCount:2, ) ,
                    itemBuilder:(context, index) {
                      return  InkWell(
                        onTap: () {
                          setState(() {
                            if(!selectedcats.contains(tagListName[index])){
                              selectedcats.add( tagListName[index]);


                            }else{
                              print("this ${tagListName[index].title} exite");
                            }

                          });
                        },
                        child: TageList(index: index, textTheme: textTheme,));
                  
                    },
                    ),
                  ),
                  
                  //Image.asset("assets/images/errow.png",scale:13,),
                  ///////////////listcategori2
                  SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      itemCount: selectedcats.length,
                      shrinkWrap: true,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.3,
                      crossAxisCount:2, ) ,
                    itemBuilder:(context, index) {
                      return   Container(
                        height: 50,
                        decoration:  const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: SolidColors.surface
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(

                                selectedcats[index].title,style: textTheme.labelMedium,
                                
                              ),
                              InkWell(
                                onTap:((){
                                  setState(() {
                                      selectedcats.removeAt(index);
                                  });

                                }),
                                child: const Icon(CupertinoIcons.delete,size: 16,color: Color.fromARGB(255, 56, 56, 56),)),
                                
                          
            
                            ],
        ),
      ),
    );
                  
                    },
                    ),
                  ),
        

            
            
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}