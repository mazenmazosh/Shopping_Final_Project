import 'package:flutter/material.dart';
import 'package:shoping_final_project/Screens/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:shoping_final_project/Components/Products.dart';
import 'package:shoping_final_project/Utilties/Constant.dart';
class EditProduct extends StatefulWidget {
  String ID,URL,ProductName,discrription;
  bool favorite;
  int price;
  EditProduct({this.ID,this.URL,this.ProductName,this.favorite,this.price,this.discrription});
  @override
  _EditProductState createState() => _EditProductState();
}


class _EditProductState extends State<EditProduct> {

  var nameedit = TextEditingController();
  var disedit = TextEditingController();
  var predit = TextEditingController();
  var uredit = TextEditingController();
  var predit2=TextEditingController();

  @override
  Widget build(BuildContext context) {

    nameedit.text=widget.ProductName;
    disedit.text=widget.discrription;
    predit.text=widget.price.toString();
    uredit.text=widget.URL;
    bool fav=false;

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Empty Data"),
            content: new Text("Please Fill Every Empty Data"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: ()=>Navigator.pop(context),
        ),
        title: widget.ID==null?Text('Add Product'):Text('Edit Product'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: Icon(Icons.save),
              onTap: (){
                if(nameedit.text==''||disedit.text==''||uredit.text==''){
                    _showDialog();
                }
                else if(predit.text=='null'&&predit2.text=='') {
                  _showDialog();
                }else if(predit.text==''&&predit2.text==''){
                  _showDialog();
                }
                else{
                  print(predit.text);
                  print(predit2.text);
                  widget.ID==null?Provider.of<Productss>(context,listen:false).addProduct(nameedit.text, disedit.text, uredit.text,int.parse(predit2.text),fav):
                Provider.of<Productss>(context,listen:false).EditProduct(widget.ID,nameedit.text,disedit.text,uredit.text, int.parse(predit.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kColor4,
                    content: Text(widget.ID==null?'Your Product has been Add Successfully !':'Your Product has been Edited Successfully !',style: TextStyle(color: Colors.white),),
                    ),
                );
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){return HomePage();}), (_) => false);}
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            TextField(
              controller: nameedit,
      //   onChanged: (value){
      // name=value;
      // print(name);
      // },
              style: TextStyle(
                color:kColor4
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide()
                ),
                  labelText: 'Product Name',
                hintStyle: TextStyle(
                    color: kColor4
                ),
                labelStyle: TextStyle(
                  color: kColor4
                )
              ),
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
              color: kColor4
            ),
              height: 14,),
            SizedBox(height: 10,),

            TextField(
              controller: widget.ID==null?predit2:predit,
              // onChanged: (value){
              //   price=int.parse(value);
              // },
              style: TextStyle(
                  color: kColor4
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide()
                  ),
                  labelText: 'Price',
                  hintStyle: TextStyle(
                      color: kColor4
                  ),
                  labelStyle: TextStyle(
                      color: kColor4
                  )
              ),
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
                color: kColor4,
              ),
              height: 14,),
            SizedBox(height: 10,),
            TextField(
              controller: disedit,
              enableInteractiveSelection: true,
              minLines: 3,
              maxLines: 5,
              // onChanged: (value){
              //   description=value;
              // },
              style: TextStyle(
                  color: kColor4
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide()
                  ),
                  labelText: 'Description',
                  hintStyle: TextStyle(
                      color: kColor4
                  ),
                  labelStyle: TextStyle(
                      color: kColor4
                  )
              ),
            ),

            SizedBox(
              child: Divider(
                thickness: 1,
                color: kColor4,
              ),
              height: 14,),
            SizedBox(height: 10,),
            TextField(
              controller: uredit,
              enableInteractiveSelection: true,
              minLines: 3,
              maxLines: 5,
              // onChanged: (value){
              //   url=value;
              // },
              style: TextStyle(
                  color: kColor4
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide()
                  ),
                  labelText: 'URL',
                  hintStyle: TextStyle(
                      color: kColor4
                  ),
                  labelStyle: TextStyle(
                      color: kColor4
                  )
              ),
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
                color: kColor4,
              ),
              height: 14,),
          ],

        ),
      ),
    );
  }
}
