import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:miniprojet/pages/education.page.dart';
import 'package:miniprojet/pages/personnel.page.dart';
import 'package:miniprojet/pages/skills.page.dart';
import 'package:miniprojet/pages/experience.page.dart';
import 'package:miniprojet/pages/languages.page.dart';
import 'package:miniprojet/pages/dark.page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:miniprojet/pages/map.page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'file.page.dart';

class PageHome extends StatefulWidget {
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final DarkModeHelper darkModeHelper = DarkModeHelper();
  List<String> languages = ["Français", "Anglais", "Arabe"];
  final List locales = [
    {'name': 'Anglais', 'locale': Locale('en', 'US')},
    {'name': 'Français', 'locale': Locale('fr', 'FR')},
    {'name': 'Arabe', 'locale': Locale('ar', 'TU')},
  ];
  final List<Map<String, dynamic>> pagesData = [
    {'title': 'Informations Personnelles', 'icon': Icons.person, 'page': PersonnelPage()},
    {'title': 'Experience', 'icon': Icons.star, 'page': PageExperience()},
    {'title': 'Langues', 'icon': Icons.language, 'page': PageLangue()},
    {'title': 'education', 'icon': Icons.school_rounded, 'page': PageEd()},
    {'title': 'Skills', 'icon': Icons.settings, 'page': PageSkils()},
    {'title': 'map', 'icon': Icons.maps_home_work_outlined, 'page': MapScreen()},
  ];

  _quitApp() {
    SystemNavigator.pop();
  }

  _callPhoneNumber() async {
    const phoneNumber = 'tel:+216 26719144';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkModeHelper.getThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('cv'.tr),
          actions: [
            IconButton(
              onPressed: () {
                _showLanguageMenu(context);
              },
              icon: Icon(
                Icons.language,
              ),
              tooltip: 'Langue',
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  darkModeHelper.toggleDarkMode();
                });
              },
              icon: Icon(darkModeHelper.getIcon()),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: PageAva(),
                  ),
                  SizedBox(height: 120),
                  Container(
                    width: 400.0,
                    child: CarouselSlider.builder(
                      itemCount: pagesData.length,
                      itemBuilder: (context, int index, int realIndex) {
                        return _buildCard(
                          pagesData[index]['title'],
                          pagesData[index]['icon'],
                          context,
                          pagesData[index]['page'],
                        );
                      },
                      options: CarouselOptions(
                        height: 200.0,
                        aspectRatio: 2.0,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        scrollDirection: Axis.horizontal,
                        pauseAutoPlayOnTouch: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollPhysics: BouncingScrollPhysics(),
                        viewportFraction: 1.0,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          child: Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
          ),
          backgroundColor: darkModeHelper.getThemeData().cardColor,
          overlayColor: Colors.black12,
          overlayOpacity: 0.4,
          spacing: 12,
          spaceBetweenChildren: 12,
          children: [
            SpeedDialChild(
              child: Icon(Icons.exit_to_app),
              onTap: _quitApp,
            ),

            SpeedDialChild(
              child: Icon(Icons.phone),
              onTap: _callPhoneNumber,
            ),
            SpeedDialChild(child: IconButton(
            icon: Icon(FontAwesomeIcons.github),
      onPressed: () {
        launch("https://github.com/VotreNomDUtilisateurGitHub");
      },
            ),),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String titleKey, IconData icon, BuildContext context, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        color: darkModeHelper.getThemeData().cardColor, // Set the card color based on dark mode
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 400.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 60.0,
                ),
                SizedBox(height: 10),
                Text(
                  titleKey.tr, // or titleKey.tr()
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLanguageMenu(BuildContext context) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          overlay.localToGlobal(Offset(0, kToolbarHeight)), // Offset vertical
          overlay.localToGlobal(Offset(MediaQuery.of(context).size.width, kToolbarHeight)), // Offset horizontal
        ),
        Offset.zero & overlay.size,
      ),
      items: languages.map((language) {
        return PopupMenuItem(
          value: language,
          child: InkWell(
            onTap: () => _changeLanguage(language),
            child: Padding(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Container(
                child: Text(language),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }



  void _changeLanguage(String language) {
    var selectedLocale = locales.firstWhere(
          (element) => element['name'] == language,
      orElse: () => null,
    );

    if (selectedLocale != null) {
      Get.updateLocale(selectedLocale['locale']);
    }

    Navigator.pop(context);
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message, fontSize: 18);
  }
}
