


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/Model/Carousel.dart';
import 'package:flutter_html/flutter_html.dart';

class DiscountPage extends StatelessWidget {
  final Promos promos;

  const DiscountPage(this.promos) ;


  checkNull(){
   if(promos.title != null){
    return ListView(
       shrinkWrap: true,
       children: [
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 40),
           child: SizedBox(
             width: 200,
             child: Image.network(
                 promos.previewImage!,
                 height: double.infinity,
                 fit: BoxFit.fill),
             height: 200,

           ),
         ),

         Padding(
           padding: EdgeInsets.all(10),
           child: Text(promos.title!,style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize: 20
           ),),
         ),
         Padding(
             padding: EdgeInsets.symmetric(vertical: 10),
             child: SingleChildScrollView(
               child: Html(
                 data: promos.previewText??'',

               ),
             )
         )
       ],
     );
   } else return Container(child: Center(child: Text('Malumot yoq'),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(width: 10,)
        ],
        title: Center(child: Text('Акции',style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black),),),
      ),
      body: checkNull()
    );
  }
}
