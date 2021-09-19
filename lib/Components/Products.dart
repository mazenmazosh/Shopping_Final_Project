import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
class Products{
  String ID,URL,ProductName,descrription;
  bool favorite =false;
  int price;
  Products({@required this.ID,@required this.URL,@required this.ProductName,@required this.price,@required this.descrription,@required this.favorite});
}

class Productss with ChangeNotifier {
  List<Products> productdata = [];

  Future<void> getdata()async{

    var url = Uri.parse('https://shopingfinalproject-default-rtdb.firebaseio.com/Products.json');
    var response = await http.get(url);
    var extracteddata =json.decode(response.body) as Map<String,dynamic>;
    productdata=[];
    extracteddata.forEach((id, data) {
      productdata.add(Products(ID: id, URL: data['url'], ProductName: data['name'], price: int.parse(data['price']), descrription: data['description'],favorite: data['fav']));
    });
  }

  Future<void>addProduct(String name,description,Url,int price,bool fav)async{
    var url = Uri.parse('https://shopingfinalproject-default-rtdb.firebaseio.com/Products.json');
    if(Url==null){
      print('cant save');
    }else{
    var response= await http.post(url,body: json.encode({
      'name':name,
      'price':price.toString(),
      'description':description,
      'url':Url,
      'fav':fav=false
    }),
    );
  }
notifyListeners();
  }
  Future<void> EditProduct(String id,name,description,Url,int price)async{
    var url = Uri.parse('https://shopingfinalproject-default-rtdb.firebaseio.com/Products/$id.json');
    var response =await http.patch(url,body: json.encode({
      'name':name,
      'description':description,
      'url':Url,
      'price':price.toString(),
    }));
    notifyListeners();
  }
  Future<void> changestatus(String id) async{
    bool status;
    var url =Uri.parse('https://shopingfinalproject-default-rtdb.firebaseio.com/Products/$id.json');
    var url1 =Uri.parse('https://shopingfinalproject-default-rtdb.firebaseio.com/Products.json');
    var respo = await http.get(url1);
    var extracted = json.decode(respo.body)['$id']['fav'];
  print(extracted);
  status=extracted;
    if(status==false){
      await http.patch(url,body: json.encode({
        'fav':true
      }));
    }else{
      await http.patch(url,body: json.encode({
      'fav':false
      }));
      }

    notifyListeners();
  }

  List<Products> filterproducts (bool status){
    return productdata.where((element) => element.favorite==status).toList();
  }

  List<Products> allproducts (){
    return productdata.toList();
  }

  Future<void> removeproducts(String id)async{
    var url = Uri.parse('https://shopingfinalproject-default-rtdb.firebaseio.com/Products/$id.json');
    await http.delete(url);
    notifyListeners();
  }

}