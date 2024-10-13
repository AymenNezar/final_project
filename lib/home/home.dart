import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled12p/myWidgets/Drawer.dart';
import 'package:untitled12p/myWidgets/appbar.dart';
import 'package:untitled12p/myWidgets/my_TextField.dart';
import 'package:untitled12p/provider/cards.dart';
import 'package:untitled12p/screens/detailes.dart';
import 'package:untitled12p/model/Items.dart';
import '../myVariables/colors.dart';

class home extends StatelessWidget {
  home({super.key});
  final searchController = TextEditingController();

  get index => null;

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cards>(context);
    return
         SafeArea(
          child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    MyTextfield(
                        inputTypee: TextInputType.text,
                        isPass: false,
                        lableTextt: 'Search',
                        textController: searchController,
                      suffixIcon: IconButton(onPressed: (){},
                        icon: Icon(Icons.search),

                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: GridView.builder(
                        // padding: EdgeInsets.all(30),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        itemCount: item.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Details(product: item[index])));
                            },
                            child: Container(
                              child: Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: darkColor
                                            .withOpacity(0.7), // Shadow color
                                        spreadRadius: 1, // Spread radius
                                        blurRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: SizedBox(
                                          width: 150,
                                          height: 110,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(item[index].itemImage),
                                          ))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item[index].itemPrice.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        Text(item[index].itemName),
                                        GestureDetector(
                                              onTap: () {
                                                card.add(item[index]);
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.7), // Shadow color
                                                      spreadRadius: 1, // Spread radius
                                                      blurRadius: 3,
                                                    ),
                                                  ],
                                                ),
                                                child: Icon(Icons.add, color: Colors.white),
                                              ),
                                            ),
                                      ]),
                                ),
                              ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              drawer: Drawer(child: drawer()),
              appBar: appbar(name: "Home"),
          ),
        );

  }
}
