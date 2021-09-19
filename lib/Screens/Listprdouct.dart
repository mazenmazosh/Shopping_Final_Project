import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shoping_final_project/Components/Products.dart';
import 'package:shoping_final_project/Components/ListCard_view.dart';
import 'EditProduct.dart';
class ListProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Productss>(context).allproducts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Product'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                child: Icon(Icons.add_box_outlined),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context){return EditProduct();})),
            ),
          )
        ],
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
    body:Padding(
      padding: const EdgeInsets.only(top: 3),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 6,
        ),
        itemBuilder: (ctx, index) => ListCardView(ID: products[index].ID, URL:products[index].URL , Productname: products[index].ProductName,favorite: products[index].favorite,price: products[index].price,Descrption: products[index].descrription,),
        scrollDirection: Axis.vertical,
        itemCount: products.length,
      ),
    )
    );
  }
}
