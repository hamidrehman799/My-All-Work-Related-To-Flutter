
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:themovers/assistants/requestassistant.dart';
import 'package:themovers/models/address.dart';
import 'package:themovers/providor/eminidata.dart';
import 'package:themovers/widgets/configmaps.dart';

class AssistantMethod{


  static Future<String> searchCoordinateAddress(Position position, context) async {
  String placeAddress = "";
  String st1, st2, st3, st4;
  String mk= mp1+mp2+mp3+mp4;
  String url= "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mk";

  var response= await RequestAssistant.getRequest(url);

  if(response!= "Failed"){

    st1 = response["results"][0]["address_components"][0]["long_name"];
    st2 = response["results"][0]["address_components"][1]["long_name"];
    st3 = response["results"][0]["address_components"][2]["long_name"];
    st4 = response["results"][0]["address_components"][5]["long_name"];

    placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;

    PickAddress userPickUpAddress = new PickAddress();
    userPickUpAddress.longitude = position.longitude;
    userPickUpAddress.latitude= position.latitude;
    userPickUpAddress.userplaceName = placeAddress;

    Provider.of<AppData>(context, listen: false ).updatePickUpLocationAddress(userPickUpAddress);


  }
  return placeAddress;
  }
}