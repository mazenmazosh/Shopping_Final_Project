import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_final_project/Components/Products.dart';
import 'package:shoping_final_project/Utilties/Constant.dart';
 class ReuseableCard extends StatelessWidget {
    String ID ,URL,ProductName;
    bool favorite;
    ReuseableCard({@required this.ID,@required this.URL,@required this.ProductName,@required this.favorite,});
    @override
   Widget build(BuildContext context) {
     return Container(
       width: MediaQuery.of(context).size.height,
       height: MediaQuery.of(context).size.height,
       margin: EdgeInsets.all(10),
       decoration: BoxDecoration(
         borderRadius:BorderRadiusDirectional.circular(35),
          color:kColor2,
       ),
       child: Column(
         children: <Widget>[
           Container(decoration: BoxDecoration(
         color:kColor2,
             borderRadius:BorderRadiusDirectional.only(topStart:Radius.circular(35),topEnd: Radius.circular(35)),
           ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 GestureDetector(
                   onTap:()
                       {
                         Provider.of<Productss>(context,listen:false).changestatus(ID);

                       },
                   child: Padding(
                     padding: const EdgeInsets.only(right: 9,top: 5),
                     child: Icon(favorite==false?Icons.favorite_border_outlined:Icons.favorite,
                       color:  kColor3,
                       size: 40,
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Expanded(
              child:Image(image:NetworkImage(URL),
                errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                  return Text('URL Is Not Accessible',style: TextStyle(
                      color: Colors.red));
                },
               ),
           ),

           Center(
             child: Container(
      decoration: BoxDecoration(
      color:kColor2,
               borderRadius:BorderRadiusDirectional.only(bottomEnd: Radius.circular(35),bottomStart: Radius.circular(35)),
      ),
               child: Center(
                 child: Text(ProductName,style: TextStyle(
                   fontSize: 20,
                     color: Colors.black
                 ),),
               ),
             ),
           ),
         ],
       ),
     );
   }
 }
