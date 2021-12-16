import 'package:flutter/cupertino.dart';
import 'package:themovers/models/address.dart';






class AppData extends ChangeNotifier{
PickAddress pickUpLocation;

void updatePickUpLocationAddress(PickAddress pickUpAddress){
  pickUpLocation = pickUpAddress;
  notifyListeners();
}



}