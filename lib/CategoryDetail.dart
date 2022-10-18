import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatefulWidget {
   List<String> imageList;
   List<String> textList;
   String folderName;
   DetailScreen({Key? key,required this.imageList,required this.textList,required this.folderName}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


   late String digitText;
   @override
  void initState() {
    // TODO: implement initState
     digitText=widget.textList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Center(
        child: Column(
            children:[
              CarouselSlider.builder(
                  options: CarouselOptions(
                    onPageChanged: (index,reason){
                      setState((){                      digitText=widget.textList[index];
                      });
                    },
                    height: 400,
                    autoPlay: true,
                  ),
                  itemCount: widget.textList.length,

                  itemBuilder: (context, index, realIndex) {
                    return buildImage("assets/${widget.folderName}/"+widget.imageList[index]+".svg", index);
                  },
              ),
              SizedBox(height: 100,),

              Center(child: Text(digitText.toUpperCase(),
                 style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                 ))
            ]
        ),
      ),
    );


}

  Widget buildImage(String imageAssets, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 24),
    color: Colors.grey,
    width: double.infinity,
    child: SvgPicture.asset(
      imageAssets,
      fit: BoxFit.fitHeight,
    ),
  );
}
