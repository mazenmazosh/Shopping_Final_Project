import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_final_project/Components/cardss.dart';
import 'package:shoping_final_project/Components/Products.dart';
import 'ProductDescription.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Productss>(context).allproducts();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount:2,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    childAspectRatio: 0.75,
    ),
            itemBuilder: (ctx, index) => GestureDetector(
                child: ReuseableCard(ID: products[index].ID, URL:products[index].URL , ProductName: products[index].ProductName,favorite: products[index].favorite,),
            onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context){
              return ProdcutDescription(id:products[index].ID,productname:products[index].ProductName,description: products[index].descrription,price: products[index].price,);}
              ));
            },
            ),
    scrollDirection: Axis.vertical,
          itemCount: products.length,
      )
        );
  }
}
