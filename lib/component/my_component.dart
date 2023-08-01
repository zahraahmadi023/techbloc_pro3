import 'package:flutter/material.dart';
import 'package:techbloc_pro3/component/myColor.dart';
import 'package:techbloc_pro3/models/fake_data.dart';

class Tec_Divider extends StatelessWidget {
  const Tec_Divider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width/6,
      endIndent:size.width/6,
    );
  }
}
class TageList extends StatelessWidget {
  final TextTheme textTheme;
  final int index;
  TageList({required this.index,required this.textTheme});


  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
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
    );
  }
}
////////////////
