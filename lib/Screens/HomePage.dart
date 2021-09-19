import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_final_project/Components/Products.dart';
import 'FavoriteScreen.dart';
import 'ProductScreen.dart';
import 'Listprdouct.dart';
import 'package:shoping_final_project/Utilties/Constant.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex=0;
  List<dynamic> pages;
  void changepage(int index){
    setState(() {
      currentindex=index;
    });
  }
  @override
  void initState() {
    super.initState();
pages=[
  {
    'icon':Icons.all_inbox_rounded,
    'title':'Products',
    'page':ProductScreen(),
  },
  {
    'icon':null,
    'title':'Favorite',
    'page':FavoriteScreen(),
  }
];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: Text(pages[currentindex]['title']),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ListProduct();
                },
                ),
                );
              },
              child: Icon(pages[currentindex]['icon']),
            ),
          ),
        ],
      ),
      body:FutureBuilder(
        future: Provider.of<Productss>(context).getdata(),
        builder: (ctx,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return pages[currentindex]['page'];
          }else {
            return Container(
              child: Center(child: CircularProgressIndicator()),);
          }
            },),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        elevation: 40,
        selectedFontSize: 16,
        currentIndex:currentindex,
        onTap:changepage,
        selectedItemColor: Color(0xFFEB1555),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.apps_outlined),
            label: 'Product',
        ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined),
          label: 'Favorite',
          ),

        ],),
    );
  }
}
