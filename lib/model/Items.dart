import 'package:flutter/material.dart';

class Items{
  String itemName;
  String itemImage;
  double itemPrice;
  String itemLocation;
  String itemDescription;


  Items({required this.itemName,required this.itemImage,required this.itemPrice, this.itemLocation = "Main Branch",required this.itemDescription});
}
final List<Items> item = [
  Items(itemName: "lamp", itemImage: 'assets/img/book1.jpg', itemPrice: 20.2,itemDescription: "jfpiaofiha"),
  Items(itemName: "moon", itemImage: 'assets/img/book5.jpg', itemPrice: 30.2,itemDescription: " ;japfijapwifj"),
  Items(itemName: "sea", itemImage: 'assets/img/book2.jfif', itemPrice: 40.2,itemDescription: " pojwafpajf"),
  Items(itemName: "lamp", itemImage: 'assets/img/book4.jpg', itemPrice: 50.2,itemDescription:"pcoajwfpjawpf"),


];