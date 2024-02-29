import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // ← Add this.
        children: [
          Text('Build your sustainable home:'),
          
          ElevatedButton(
            onPressed: () {
              // appState.getNext();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
  
}