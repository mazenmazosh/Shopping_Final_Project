import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_final_project/Components/Products.dart';
import 'package:shoping_final_project/Utilties/Constant.dart';
class ProdcutDescription extends StatefulWidget {
  String id,productname,description;
  int price;

  ProdcutDescription({@required this.id,@required this.productname,@required this.description,@required this.price});
  @override
  _ProdcutDescriptionState createState() => _ProdcutDescriptionState();
}

class _ProdcutDescriptionState extends State<ProdcutDescription> {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Productss>(context).allproducts();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=>Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image(
              image: NetworkImage(products.firstWhere((element) => element.ID==widget.id).URL),
              errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                return Center(
                  child: Text('URL Is Not Accessible',style: TextStyle(
                      color: Colors.red,fontSize: 40),),
                );
              },
            ),
          ),
Card(child: ListTile(
    leading: Icon(Icons.attach_money,size: 40,),
    title: Text('${widget.price}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
color: kColor1,
elevation: 10,
  margin: EdgeInsets.all(10),
),
          Card(child: ListTile(
              leading: Icon(Icons.description,size: 40,),
              title: Text('${widget.description}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
            color: kColor1,
            elevation: 10,
            margin: EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
