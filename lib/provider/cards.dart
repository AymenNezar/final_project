import 'package:flutter/material.dart';
import 'package:untitled12p/model/Items.dart';
import 'package:untitled12p/screens/detailes.dart';

class Cards with ChangeNotifier{

  List  selectedProducts =[];
  double price = 0;

// Add Methode

  add(Items product){
    selectedProducts.add(product);
    price += product.itemPrice.round();
    notifyListeners();
  }
// Delete Methode

  delet(Items product){
    selectedProducts.remove(product);
    price -= product.itemPrice.round();
    notifyListeners();
  }


}
