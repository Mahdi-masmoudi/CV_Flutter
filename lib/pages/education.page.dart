import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'dark.page.dart';
import 'file.page.dart';

class PageEd extends StatefulWidget {
  @override
  State<PageEd> createState() => _PageEdState();
}

class _PageEdState extends State<PageEd> {
  DarkModeHelper darkModeHelper = DarkModeHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'.tr),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              PageAva(),
              SizedBox(height: 140),
              _buildEducationContainer(
                '2017-2018',
                'Lycee MedAli',
                'I got The 3rd in the IT department',
              ),
              SizedBox(height: 20),
              _buildEducationContainer(
                '2021-2022',
                'ISET Sfax',
                'I got The 3rd in the IT department',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationContainer(String year, String school, String achievement) {
    return Container(
      width: 400,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    year,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50),
                  Text(
                    school,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    achievement,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 30),
          FaIcon(
            FontAwesomeIcons.graduationCap,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
