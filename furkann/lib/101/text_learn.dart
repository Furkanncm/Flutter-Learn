
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class TextLearnView extends StatelessWidget{
  const TextLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    const String furkan = 'Furkan';
    return  Scaffold(

      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('hefasda $furkan ${furkan.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,  //TextStyle

            ),

            Text(
                ('hi $furkan ${furkan.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,  //TextStyle
            ),
            Text(
              ('hefasda $furkan ${furkan.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style:ProjectStyles.welcomeStyle,
              //TextStyle

            ),
            Text(
                ('asdadadasdad'),
              style: TextStyle(
                color:ProjectColors.Baslik,
              ),
            ),
            

            Text(
                ('Merhaba ben  flutter öğreniyom'),
              textAlign: TextAlign.justify,
             style: TextStyle(
                // decoration: TextDecoration.lineThrough,
               color: ProjectColors.Baslik,
               fontFamily:'italic',
               fontSize: 20,
               shadows: [
                 Shadow(
                 // color: Colors.red,
                   offset: Offset(2,2),
                   blurRadius: 10,
                 )
               ]

             )
            ),
            SizedBox.square(
                dimension:50,
                child: Text("rtyuhıjokpkojııbhoıguvyfuytguhıjoııuytrctfvybunıjmokömojınhbuytvrtvybun")


            ),

             // ignore: sized_box_for_whitespace
             Container(
              height: 50,
              width: 50,
              // ignore: sort_child_properties_last
              child: Text("adfafsafa"),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              constraints: BoxConstraints(maxHeight: 150, minHeight: 50,maxWidth: 150),
              decoration:BoxDecoration(
                color: Colors.blueGrey,
                 border:Border.all(width: 10,color:Colors.limeAccent)
              ) ,
              
            ),



          ],
        )
        ),
    );
  }


}

class ProjectStyles{
   // ignore: unnecessary_const
   static const TextStyle welcomeStyle =const TextStyle(
    wordSpacing:1,
    letterSpacing: 1,
    fontSize:25,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    decoration: TextDecoration.lineThrough,);

}

class ProjectColors{
  // ignore: constant_identifier_names
  static const Color Baslik= Color.fromARGB(26, 0, 245, 249);
}