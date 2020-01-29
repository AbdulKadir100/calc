import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return new MaterialApp(
       title: 'First',
       theme: new ThemeData(
         primarySwatch: Colors.teal,
         secondaryHeaderColor: Colors.deepOrange,
       ),
       home: new MyHome(),  
     );
   }

  
 }
 class MyHome extends StatelessWidget {
   final List<String> items  = new List<String>.generate(50,(i)=>"items $i");
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: new AppBar(title: new Text("Swipe to dismis"),),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,int index){
          return new Dismissible(
            key: new Key(items[index]),
            onDismissed: (direction){
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Item dismissed."),
              ));
              
              },
              background: new Container(
                color: Colors.red,
              ),
              
              child: new ListTile(
                title: new Text("${items[index]}"),
              ),
          );
        }
        
      ) 
       
     );
   }
 }

