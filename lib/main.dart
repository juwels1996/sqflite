import 'package:flutter/material.dart';
import 'package:flutter_app_sqflite/database_helper.dart';

void main() {
  runApp(MaterialApp(home: HomePage(),));
}

class HomePage extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),

      body: Center(
        child: Column(
          children: [
            FlatButton(onPressed: ()async{
              int? i=await DatabaseHelper.instance.insert(
                {
                  DatabaseHelper.columname:'juwel'
                }
              );
              print('the inserted id is $i');
            },

              child: Text("Insert"),color: Colors.green,),


            FlatButton(onPressed: ()async{
              List<Map<String,dynamic>>?queryRows=await DatabaseHelper.instance.queryAll();
              print(queryRows);
            }, child: Text("Query"),color: Colors.teal,),

            FlatButton(onPressed: ()async{
              int updatedId=await DatabaseHelper.instance.update({
                DatabaseHelper.columnId:12,
                DatabaseHelper.columname:'Sheikh'
              });
              print(updatedId);

            }, child: Text("Update"),color:Colors.blue,),


            FlatButton(onPressed: ()async{
              int rowsEffected=await DatabaseHelper.instance.delete(13);
              print(rowsEffected);
            }, child: Text("Delete"),color: Colors.red,),

          ],
        ),
      ),

    );
  }
}



