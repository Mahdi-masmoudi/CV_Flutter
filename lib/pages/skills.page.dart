import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miniprojet/pages/file.page.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dark.page.dart';

class PageSkils extends StatefulWidget {
  @override
  State<PageSkils> createState() => _PageSkilsState();
}

class _PageSkilsState extends State<PageSkils> {
   DarkModeHelper darkModeHelper = DarkModeHelper();
  final List<Map<String, dynamic>> skillsData = [
    {'imagePath': 'assets/images/htmlcss.png', 'title': 'HTML/CSS'},
    {'imagePath': 'assets/images/angular.png', 'title': 'Angular'},
    {'imagePath': 'assets/images/React.png', 'title': 'React.js'},
    {'imagePath': 'assets/images/node.png', 'title': 'Node.js'},
    {'imagePath': 'assets/images/word.png', 'title': 'WordPress'},
    {'imagePath': 'assets/images/spring.png', 'title': 'SpringBoot'},
    {'imagePath': 'assets/images/python.png', 'title': 'Django (Python)'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Skills'.tr),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageAva(),
                  SizedBox(height: 130),

                  // Use CarouselSlider to display skills as a slider
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16/9,
                    ),
                    items: skillsData.map((skill) {
                      return _buildSkillCard(skill);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Card(
      elevation: 10.0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              skill['imagePath'],
              width: 150.0,
              height: 100.0,
            ),
            SizedBox(height: 8.0),
            Text(
              skill['title'],
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }


}
