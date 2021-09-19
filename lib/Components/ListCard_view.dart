import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_final_project/Components/Products.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoping_final_project/Screens/EditProduct.dart';
import 'package:shoping_final_project/Utilties/Constant.dart';


class ListCardView extends StatelessWidget {
  String ID,URL,Productname,Descrption;
  int price;
  bool favorite;
  ListCardView({this.ID,this.URL,this.Productname,this.favorite,this.Descrption,this.price});
  @override
  Widget build(BuildContext context) {

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Deletion"),
            content: new Text("Are You Sure You Want To Delete This Product ?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("back"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("Yes"),
                onPressed: () {
                  Provider.of<Productss>(context, listen: false).removeproducts(ID);
                  Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: Card(
        elevation: 10,
        color: kColor1,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 7,),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CircleAvatar(
                backgroundColor: kColor1,
                child:Image(image:NetworkImage(URL), errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                  return Icon(Icons.error_outline);
                },
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(Productname,style: TextStyle(color: Colors.black),),
          ),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit_outlined,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){return EditProduct(ID: ID,ProductName: Productname,URL: URL,price: price,discrription: Descrption,favorite: favorite,);})),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
          _showDialog();
          }),
      ],
    );
  }
}
