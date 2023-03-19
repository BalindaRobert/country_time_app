import 'package:flutter/material.dart';
import 'package:icardi/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);



  @override
  State<Loading> createState() => _LoadingState();

}

class _LoadingState extends State<Loading> {

  setupWorldTime() async {
  WordTime instance = WordTime(flag: 'uganda.png', location: 'Kampala', url: 'Africa/Kampala');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location, 'flag': instance.flag, 'time': instance.time,
    'dayTime': instance.dayTime
  });
  setState(() {
    var time = instance.time;
  });
}


  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50,

        ),
      ),

      );


  }
}
