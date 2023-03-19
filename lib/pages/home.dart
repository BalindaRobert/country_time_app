import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ?  ModalRoute.of(context)?.settings.arguments as Map: data;
    print(data);
    String bgImage = data['dayTime'] ? 'day.jpg' : 'night.jpg';
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/$bgImage') ,fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: ()  async {
                   dynamic result= await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'time': result['time'],
                       'location': result['location'],
                       'dayTime': result['dayTime'],
                       'flag': result['flag'],
                     };
                   });
                },
                icon: Icon(
                    Icons.edit_location,
                color: Colors.grey[300],),
                label: Text('edit location',
                style: TextStyle( color: Colors.grey[300]),),
              ),
              SizedBox(height: 40),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                data ['time'], style: TextStyle(
                fontSize: 66, color: Colors.white
              ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
