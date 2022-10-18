import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyrgyz_app/CategoryDetail.dart';
import 'package:kyrgyz_app/repo.dart';

class Words extends StatefulWidget {
  const Words({Key? key}) : super(key: key);

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {
  final List<String> events = [
    'Сандар',
    'Мезгилдер',
    'Мөмө-жемиштер',
    'Жаныбарлар',
    'Түстөр'
  ];
  final List<String> images = [
    'numbers',
    'season',
    'fruit',
    'animal',
    'colors'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff221f1f),
      body: GridView.builder(
        shrinkWrap: true,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4 / 3),
          itemCount: events.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                if (index == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(imageList: digitImageslist, textList:digitTextlist,folderName: "digits",)));
                }
                else if(index==1){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(imageList: seasonsImageList, textList:seasonsTextList,folderName: "seasons",)));
                }else if(index==2){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(imageList: fruitImageList, textList:fruitTextList,folderName: "fruit",)));
                }
                else if(index == 3) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(imageList: animalsImageList, textList:animalsTextList,folderName: "animals",)));
                }
                else if(index == 4) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(imageList: colorsImageList, textList: colorsTextList, folderName: "colors",)));
                }
              },
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(mainAxisSize:MainAxisSize.min,children: [
                  SvgPicture.asset(
                    "assets/images/${images[index]}.svg",
                    width: 128,
                    height: 128,
                  ),
                  Text(events[index]),
                ],),
              ),
            );
          }),
    );
  }
}
