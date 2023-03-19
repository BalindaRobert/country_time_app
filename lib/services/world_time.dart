import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WordTime{
   String location;
  late String time;
   String flag;
   String url;
  late bool dayTime;
  WordTime({ required this.flag , required this.location, required this.url});
Future<void> getTime  () async{
  try {
    Response  response= await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    print (data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime now = DateTime.parse(datetime);
    now= now.add(Duration(hours: int.parse(offset)));
    time = DateFormat.jm().format(now);
    dayTime = now.hour >6 && now.hour <20 ? true : false;
  }
  catch (e){
    print(' the error is $e');
    time ='could not get time data';
  }


}
}
