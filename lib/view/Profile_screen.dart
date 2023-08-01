import 'package:flutter/material.dart';
import 'package:techbloc_pro3/component/myColor.dart';
import 'package:techbloc_pro3/component/myString.dart';
import 'package:techbloc_pro3/component/my_component.dart';
import 'package:techbloc_pro3/gen/assets.gen.dart';
import 'package:techbloc_pro3/models/fake_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        
    child:Column(
      children: [
        
        Assets.images.avatar.image(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageIcon(
              AssetImage("assets/icons/blue_pen.png"), color:SolidColors.seeMore),
              const SizedBox(width: 5,),
              Text(MyStrings.imageProfileEdit,style:textTheme.displaySmall ,),

          ],
        ),
        SizedBox(height: 60,),
        Text(" فاطمه امیری ", style: textTheme.bodyMedium,),
        SizedBox(height: 12,),
        Text("fatemeh amiri@gmail.com", style: textTheme.bodyMedium,),
        const SizedBox(height: 40,),
        Tec_Divider(size: size),

        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: (){},
          child: const SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.myFavBlog))),

        ),
        
        Tec_Divider(size: size),
        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: (){},
          child: Center(child: const SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.myFavPodcast)))),

        ),
        
        Tec_Divider(size: size),
        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: (){},
          child: const Center(child: SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.logOut)))),

        ),
        const SizedBox(height:60,)

    
      ],
    )
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
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              gradient: LinearGradient(
                colors: GradientColors.tags,
                begin: Alignment.centerRight,
                end:Alignment.centerLeft ,
                ),
            ),
            child:Padding(
              padding: const EdgeInsets.fromLTRB(16,8,8,8),
              child: Row(
                children: [
                const ImageIcon(
                  AssetImage("assets/icons/hashtagicon.png"),color: Colors.white,size: 16,),
                  SizedBox(width:10,),
                  Text(tagListName[index].title,style: textTheme.titleSmall,),
              ],
              ),
            ),
          ),
        );
      },
      ),
    );
  }
}