import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'file.page.dart';

class PageExperience extends StatefulWidget {
  @override
  _PageExperienceState createState() => _PageExperienceState();
}

class _PageExperienceState extends State<PageExperience> {
  int selectedCardIndex = -1; // Indice de la carte sélectionnée
  List<String> languages = ["Français", "Anglais", "Arabe"];
  final List locales = [
    {'name': 'Anglais', 'locale': Locale('en', 'US')},
    {'name': 'Français', 'locale': Locale('fr', 'FR')},
    {'name': 'Arabe', 'locale': Locale('ar', 'TU')},
  ];
  final List<Map<String, String>> experienceData = [
    {'date': '17/01/2022 – 12/01/2022', 'title': 'Stage d initiation'},
    {'date': '17/01/2023 – 12/01/2023', 'title': 'Stage de perfectionnement'},
    //{'date': '01/07/2023 – 01/08/2023', 'title': 'Stage Supplémentaires'},
    // Ajoutez d'autres expériences ici si nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience'.tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageAva(),
                SizedBox(height: 120),
                // Utiliser une boucle pour générer les cartes
                for (int index = 0; index < experienceData.length; index++)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Mettez à jour l'indice de la carte sélectionnée
                            selectedCardIndex = index;
                          });
                        },
                        child: _buildExperienceCard(
                          experienceData[index]['date']!,
                          experienceData[index]['title']!,
                          index == selectedCardIndex,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(String date, String title, bool isSelected) {
    return Card(
      elevation: isSelected ? 10.0 : 5.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
        leading: Icon(
          Icons.task_alt,
          size: isSelected ? 80 : 60,
          color: Colors.teal,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              title.tr,
              style: TextStyle(fontSize: 20),
            ),
          ],
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
