import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kyrgyz_app/proverbs.dart';
import 'package:kyrgyz_app/words.dart';

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatefulWidget {
  @override
  State<ScreenWidget> createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  int indexOfScreen=0;

  List<String> alphabetList="А,Б,В,Г,Д,Е,Ё,Ж,З,И,Й,К,Л,М,Н,Ң,О,Ө,П,Р,С,Т,У,Ү,Ф,Х,Ц,Ч,Ш,Щ,Ъ,Ы,Ь,Э,Ю,Я".split(",");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20
            ),
            child: GNav(
              backgroundColor: Colors.grey[900]!,
              color: Colors.indigo[900],
              activeColor: Colors.black,
              tabBackgroundColor: Color(0xff025564),
              gap: 8,
              onTabChange: (index) {
                setState((){indexOfScreen=index;});
              },
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                    icon: Icons.abc_rounded,
                    text: 'Тамгалар'
                ),
                GButton(
                    icon: Icons.book_rounded,
                    text: 'Сөздөр'
                ),
                GButton(
                    icon: Icons.auto_stories_rounded,
                    text: 'Тарых'
                ),
                GButton(
                    icon: Icons.face_rounded,
                    text: 'Ишмерлер',
                ),
                GButton(
                    icon: Icons.settings,
                    text: 'Ырастоо',
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xff221f1f),
        appBar: AppBar(
          title: Text('Бүт категория'),
          centerTitle: true,
          elevation: 0,
        ),
        body:IndexedStack(children: [buildGridView(),Words(),Proverbs(),Container()],index:indexOfScreen ,),

      ),
    );
  }

  GridView buildGridView() {
    return GridView(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        children: <Widget>[
          for(int i=0;i<alphabetList.length;i++)...[
        buildCard(alphabetList[i])
    ]

          // TextWidget(text: "Тамгалар"),
          // TextWidget(text: "Сөздөр"),
          // TextWidget(text: "Макалдар"),
        ],
      );
  }
}





Widget buildCard(String letter) {
  return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff075009)),
              borderRadius: BorderRadius.circular(50),
              color: Color(0xff025564)
                  //.withOpacity(0.1),
            ),
            child: Center(child: Text(
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                letter))
        ),
      )
  );
}

