import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OpenStreetMap'),
        ),
        body: OpenStreetMapSearchAndPick(
          buttonTextStyle:
              const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
          buttonColor: Colors.blue,
          buttonText: 'Set Current Location',
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
            print(pickedData.addressName);
          },
        ));
  }
}