import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../myVariables/colors.dart';
import '../provider/cards.dart';
import '../screens/checkout.dart';


class MyRow extends StatelessWidget {
  const MyRow ({Key? key}) :super(key: key);
  @override
  Widget build(BuildContext context){
    final cardInstance1 = Provider.of<Cards>(context);
    return Row(
      children: [
        Stack(
          children: [
            Container(
              child: Text('${cardInstance1.selectedProducts.length}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w900)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightColor,

              ),
              padding: EdgeInsets.all(7),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Checkout() ));
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            '\$ ${cardInstance1.price}',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),

      ],
    );


  }






}


