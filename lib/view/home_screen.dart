import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techbloc_pro3/component/myColor.dart';
import 'package:techbloc_pro3/component/myString.dart';
import 'package:techbloc_pro3/controller/home_screen_controller.dart';
import 'package:techbloc_pro3/models/fake_data.dart';

import '../component/my_component.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;
  HomeScreenController homeScreenController=Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    //TODO pakesh kon
    homeScreenController.getHomeItem;
    
    return SingleChildScrollView(
        
    child: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0,8,15,8),
        child: Column(
          children: [
        
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: size.height / 1.2,
                    height: size.width / 1.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          // image: Assets.images.posterTest.image().image,
                          image: AssetImage(homePagePosterMap["imageAsset"]),
                          fit: BoxFit.cover),
                          
                    ),
                    foregroundDecoration:const BoxDecoration(////////////////hale rang
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                          colors: GradientColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                          
                          ),
                  ),
                ),
                Positioned(
                  bottom:15,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(homePagePosterMap["writer"] +"-"+homePagePosterMap["date"],style:textTheme.displayMedium),
                          Row(
                            children: [
                              Text(homePagePosterMap["view"],style:textTheme.displayMedium),
                              const SizedBox(width: 5,),
                              const Icon(Icons.remove_red_eye_sharp,size: 20,color: Colors.white,)
                            ],
                          ),
                        ],
                        
                      ),
                      Text(homePagePosterMap["title"],style:textTheme.displayLarge),
                    ],
                  ),
                  
                ),
                            
              ],
            ),
            //////////////taglist
            const SizedBox(height: 10,),
            HomeHashtag(bodyMargin: bodyMargin, textTheme: textTheme),
            SizedBox(height:25,),
            //////////////////////////bloglist
            ///seemore
            SeeMore(bodyMargin: bodyMargin, textTheme: textTheme),
            SizedBox(height:15,),
            HomeBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            SizedBox(height:10,),
            //////////////////////////bloglist2
            SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
            SizedBox(height:15,),
            HomePodcast(size: size, bodyMargin: bodyMargin),
            SizedBox(height: 60)
          
          ],
        ),
      ),
    ),
          );
  }
}

class HomePodcast extends StatelessWidget {
  const HomePodcast({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height/4,
      child:ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) {
          ///blogitem
        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(8),
              child: Padding(
                padding:  EdgeInsets.only(right:index==0?bodyMargin:15),
                child: SizedBox(
                  height: size.height/5.8,
                    width: size.width/2.5,
                  child: Stack(
                    children: [
                      Container(
                      
                      decoration:  BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(image:NetworkImage(blogList[index].imageUrl),fit: BoxFit.cover )
                  
                        ),
                        //foregroundDecoration:
                        // const BoxDecoration(
                        // borderRadius:BorderRadius.all(Radius.circular(16)),
                        // gradient: LinearGradient(
                        //   begin: Alignment.bottomCenter,
                        //   end: Alignment.topCenter,
                        //   colors: GradientColors.blogPost)
                        // ),
                        
                      ),
                      
                      
                    ],
                    
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right:index==0? bodyMargin:15),
              child: SizedBox(
                width: size.width/2.5,
                child: Text(blogList[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                ),
              ),
            ),
        
          ],
        );
      },)
    
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: bodyMargin),
            child: const ImageIcon(
                    AssetImage("assets/icons/write_microphone.png"),color:SolidColors.seeMore,),
          ),
                  SizedBox(width:10,),
                  Text(MyStrings.viewHotestPodCasts,style: textTheme.displaySmall,)
        ],
      ),
    );
  }
}

class HomeBlogList extends StatelessWidget {
  const HomeBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height/4,
      child:ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) {
          ///blogitem
        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(8),
              child: Padding(
                padding:  EdgeInsets.only(right:index==0?bodyMargin:15),
                child: SizedBox(
                  height: size.height/5.8,
                    width: size.width/2.5,
                  child: Stack(
                    children: [
                      Container(
                      
                      decoration:  BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(image:NetworkImage(blogList[index].imageUrl),fit: BoxFit.cover )
                  
                        ),
                        foregroundDecoration:
                        const BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: GradientColors.blogPost)
                        ),
                        
                      ),
                      //////////bloglisy
                      Positioned(
                            bottom: 5,
                            right: 5,
                            left: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(blogList[index].writer,
                                    style: textTheme.titleSmall),
              
                                Row(
                                  children: [
                                    Text(blogList[index].views,
                                    style: textTheme.titleSmall),
                                    SizedBox(width: 5,),
              
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  
                                  ],
                                )
                              ],
                        ),
                      )
                    ],
                    
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right:index==0? bodyMargin:15),
              child: SizedBox(
                width: size.width/2.5,
                child: Text(blogList[index].title,
                style: textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines:1,
                ),
              ),
            ),
        
          ],
        );
      },)
    
    );
  }
}

class SeeMore extends StatelessWidget {
  const SeeMore({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: bodyMargin),
            child: const ImageIcon(
                    AssetImage("assets/icons/blue_pen.png"),color:SolidColors.seeMore,),
          ),
                  SizedBox(width:10,),
                  Text(MyStrings.myFavBlog,style: textTheme.displaySmall,)
        ],
      ),
    );
  }
}

class HomeHashtag extends StatelessWidget {
  const HomeHashtag({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: tagListName.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) {
        
        return Padding(
          padding:  EdgeInsets.fromLTRB(0,8,index==0?bodyMargin:15,8),
          child: TageList(textTheme: textTheme,index: index,),
        );
      },
      ),
    );
  }
}

