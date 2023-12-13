import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'file.page.dart';

class PageLangue extends StatelessWidget {
  List<String> languages = ["Français", "Anglais", "Arabe"];
  final List locales = [
    {'name': 'Anglais', 'locale': Locale('en', 'US')},
    {'name': 'Français', 'locale': Locale('fr', 'FR')},
    {'name': 'Arabe', 'locale': Locale('ar', 'TU')},
  ];
  // Définir une liste de langues avec leurs données
  final List<Map<String, dynamic>> languagesData = [
    {'imagePath': 'assets/images/france_flag.png', 'titleKey': 'Francais'},
    {'imagePath': 'assets/images/english.png', 'titleKey': 'Anglais'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Langue'.tr),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageAva(),
              SizedBox(height: 150),
              Card(
                elevation: 5.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  leading: Image.asset(
                    languagesData[0]['imagePath'],
                    width: 80.0,
                    height: 60.0,
                  ),
                  title: Text(
                    'Francais'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adjusted spacing
              Card(
                elevation: 5.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  leading: Image.asset(
                    languagesData[1]['imagePath'],
                    width: 80.0,
                    height: 60.0,
                  ),
                  title: Text(
                    'Anglais'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message, fontSize: 18);
  }
}
