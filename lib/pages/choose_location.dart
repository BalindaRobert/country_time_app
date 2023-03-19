import 'package:flutter/material.dart';
import 'package:icardi/services/world_time.dart';
class ChooseLocation extends StatefulWidget {


  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WordTime> locations =[
    WordTime(url:'Europe/London', location: 'London', flag: 'uk.png'),
    WordTime(url:'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WordTime(url:'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WordTime(url:'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WordTime(url:'Africa/Kampala', location: 'Kampala', flag: 'ug.png'),
    WordTime(url:'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WordTime(url:'Asia/Jakarta', location: 'Jakarta', flag: 'indoo.png'),
    WordTime(url:'Asia/Seoul', location: 'Seoul', flag: 'korea.jpg'),
    WordTime(url:'Europe/Athens', location: 'Athens', flag: 'greece.png'),

  ];
  void updateTime(int index) async{
    WordTime instance = locations[index];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {'location': instance.location, 'flag': instance.flag, 'time': instance.time,
    'dayTime': instance.dayTime});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Locations'),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        centerTitle: true,
      ),
    body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,  index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
            child: Card(
              child: ListTile(
                onTap: (){
                 updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
