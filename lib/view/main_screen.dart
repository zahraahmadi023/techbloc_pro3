import 'package:flutter/material.dart';
import 'package:techbloc_pro3/component/myColor.dart';
import 'package:techbloc_pro3/gen/assets.gen.dart';
import 'package:techbloc_pro3/view/home_screen.dart';
import 'package:techbloc_pro3/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
final GlobalKey<ScaffoldState>_key=GlobalKey();////connecct to widgetMather for draver made for me

class _MainScreenState extends State<MainScreen> {
  var selectedIndexPage=0;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;
    double bodyMargin=size.height/20;

    // List<Widget>TachMainScreenPage=[

    // ];
    
    return SafeArea(
      child: Scaffold(
        key:_key,
        drawer: Drawer(
          backgroundColor:SolidColors.scaffoldBg,
          child:Padding(
            padding:  EdgeInsets.only(left: bodyMargin,right: bodyMargin),
            child: ListView(
              children: [
                Assets.images.logo.image(scale: 3),
                
                ListTile(
                title:Text("پروفایل کاربری",style: textTheme.bodyMedium,),
              
                ),
                Divider(color: SolidColors.dividerColor,),
                ListTile(
                title:Text("درباره تک بلاگ",style: textTheme.bodyMedium,),
                ),
                Divider(color: SolidColors.dividerColor,),
                ListTile(
                title:Text("اشتراک گذاری تک بلاگ ",style: textTheme.bodyMedium,),
          
                ),
                Divider(color: SolidColors.dividerColor,),
                ListTile(
                title:Text(" تک بلاگ در گیت هاب",style: textTheme.bodyMedium,),
          
                ),
                
            
          
              ]),
          ) ,
          ),
          
        appBar: AppBar(
          automaticallyImplyLeading: false,/////off draver defult
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },

              child:  Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            Assets.images.logo.image(
              height:
                  size.height / 13.6, ////hightTotal/hight logo =13.16 responsiv
            ),
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ]),
        ),
        body: Stack(
          
          children: [
            
          //HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            Center(child: Positioned.fill(
              child: IndexedStack(
                children: [
                HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ],
                index:selectedIndexPage,

              ),

            )),
          btmNavMain(bodyMargin: bodyMargin
          , size: size,
          selectedPage: (int value) {
            setState(() {
              selectedIndexPage=value;
            });
          }
          ),
          ],
          
        ),

      ),
    );
  }
}

class btmNavMain extends StatelessWidget {
  const btmNavMain({
    super.key,
    required this.bodyMargin,
    required this.size,
    required this.selectedPage,
  });

  final double bodyMargin;
  final Size size;
  final Function(int) selectedPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:8,
      right: 0,
      left: 0,
      child: Padding(
        padding: EdgeInsets.only(left: bodyMargin,right: bodyMargin),
        child: Container(
        height: size.height/10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradientColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            ),
            
        ),
        child: Container(
            
          height: size.height/8,
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(18)),
            gradient:LinearGradient(colors: GradientColors.bottomNav),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                selectedPage(0);
              },
              icon:const ImageIcon(
                AssetImage("assets/icons/home.png"),color: Colors.white,),),
                IconButton(onPressed: (){
                  selectedPage(2);
                },
              icon:const ImageIcon(
                AssetImage("assets/icons/write.png"),color: Colors.white),),
                IconButton(onPressed: (){
                  selectedPage(1);
                },
              icon:const ImageIcon(
                AssetImage("assets/icons/user.png"),color: Colors.white),)
                
            ],
          ),
                
        ),
              
              ),
      ),
    );
  }
}

