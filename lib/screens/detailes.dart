import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled12p/model/Items.dart';
import 'package:untitled12p/myWidgets/appbar.dart';
import '../provider/cards.dart';

class Details extends StatelessWidget {
  Items product;
  Details({required this.product,super.key});


  @override
  Widget build(BuildContext context) {
    final cardInstance1 = Provider.of<Cards>(context);
    return
    SafeArea(
        child: Scaffold(
          appBar: appbar(name: 'Details'),
          body: Column(
            children: [
              Image.asset(product.itemImage),
              Text(product.itemPrice.toString() + "  \$",
                  style: TextStyle(fontSize: 25)),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Text('New'),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 129, 129),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,
                          size: 23, color: Color.fromARGB(255, 255, 191, 0)),
                      Icon(Icons.star,
                          size: 23, color: Color.fromARGB(255, 255, 191, 0)),
                      Icon(Icons.star,
                          size: 23, color: Color.fromARGB(255, 255, 191, 0)),
                      Icon(Icons.star,
                          size: 23, color: Color.fromARGB(255, 255, 191, 0)),
                      Icon(Icons.star,
                          size: 23, color: Color.fromARGB(255, 255, 191, 0)),
                    ],
                  ),
                  SizedBox(width: 120),
                  Row(
                    children: [
                      Icon(Icons.edit_location, color: Colors.black, size: 23),
                      Text(
                        product.itemLocation,
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Description:',
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Text(
                product.itemDescription,
                style: TextStyle(fontSize: 18),
                maxLines: 5,
                textAlign: TextAlign.start,
                // overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      );
  }
}
