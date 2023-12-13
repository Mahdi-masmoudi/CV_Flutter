import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dark.page.dart';
import 'file.page.dart';

class PersonnelPage extends StatefulWidget {
  @override
  _PersonnelPageState createState() => _PersonnelPageState();
}

class _PersonnelPageState extends State<PersonnelPage> {

  final List<Map<String, dynamic>> personalInfoData = [

    {'icon': Icons.date_range_rounded, 'text': '15/07/2001'},
    {'icon': Icons.holiday_village, 'text': 'Sfax'},
    {'icon': Icons.local_offer_rounded, 'text': 'Route saltnia klm 1.5'},
    {'icon': Icons.phone_android, 'text': '26719144'},
    {'icon': Icons.email, 'text': 'Mahdi.masmoudi92@gmail.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('informations'.tr),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            PageAva(),
            SizedBox(height: 120),

            for (var info in personalInfoData)
              Column(
                children: [
                  _buildCard(_buildListItem(info['icon'], info['text'])),
                  SizedBox(height: 10.0),
                ],
              ),
          ],
        ),
      ),
   );
  }

  Widget _buildCard(Widget child) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

  Widget _buildListItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 60,
          color: Colors.white,
        ),
        SizedBox(width: 16.0),
        Text(
          text.tr,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
