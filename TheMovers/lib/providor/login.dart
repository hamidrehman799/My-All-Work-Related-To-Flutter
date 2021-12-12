import 'package:flutter/foundation.dart';

class profiledetails with ChangeNotifier {
  final String id;
  final int number;
  final String name;
  final String email;
  final double cnic;
  final String imageUrl;


  profiledetails({
    @required this.id,
    @required this.number,
    @required this.name,
    @required this.email,
    @required this.cnic,
    @required this.imageUrl,

  });


}
