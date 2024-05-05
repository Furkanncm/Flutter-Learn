import 'package:flutter/material.dart';

class buttonView extends StatelessWidget {
  const buttonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            
          ),
      
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Furkan",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
              ),

              Container(
                color:Colors.white,
                height: 300,
              ),
          const SizedBox(
            height: 20,
          ),
            ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
              onPressed: (){},
               child: const Padding(
              padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
              child: Text(
                "Place Bild",
               style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
               ),
                ),
            )
        ],
      ),
    );
  }
}
