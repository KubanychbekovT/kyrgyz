import 'package:flutter/material.dart';
class Proverbs extends StatefulWidget {
  const Proverbs({Key? key}) : super(key: key);

  @override
  State<Proverbs> createState() => _ProverbsState();
}

class _ProverbsState extends State<Proverbs> {
  final List<String> prov = [
  'Байыркы мезгилдер',
  '7-18 кылымдар',
  '19-20 кылымдын башында',
  'Совет доору',
  'Эгемендүүлүк',
  'Азыркы Кыргызстан'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: prov.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    if (index == 0) {
                      // Navigator.of(context).push(MaterialPageRoute(
                      // builder: (context) => DetailScreen(imageList: Imageslist, textList:Textlist,folderName: "",)));
                    }
                  },
                  title: Text(prov[index]),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${prov[index]}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}