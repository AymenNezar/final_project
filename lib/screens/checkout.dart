import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled12p/myWidgets/appbar.dart';
import '../provider/cards.dart';

class Checkout extends StatelessWidget{
  Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final check = Provider.of<Cards>(context);
    return Scaffold(
      appBar: appbar(name: "Check Out"),
      body: Column(
        children:[
          SingleChildScrollView(
          child: SizedBox(
            height: 550,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount:check.selectedProducts.length ,
                itemBuilder: (BuildContext context , int index){
                  return Card(
                    child: ListTile(
                      subtitle: Text("${check.selectedProducts[index].itemPrice}  -  ${check.selectedProducts[index].itemLocation}"),
                      leading: CircleAvatar(backgroundImage:AssetImage(check.selectedProducts[index].itemImage),),
                      title: Text(check.selectedProducts[index].itemName),
                      trailing: IconButton(onPressed: (){
                        check.delet(check.selectedProducts[index]);
                      }, icon:Icon(Icons.remove)),
                    ),
                  ) ;
                }

            ),
          ),
        ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){},
              child: Text('Pay \$ ${check.price}',style: TextStyle(fontSize: 19),),
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                padding:MaterialStateProperty.all(EdgeInsets.all(12)),
                shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),

              ) ,

              
          )
       ]
      )
    );
  }

}
