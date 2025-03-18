import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/components/pet_card.dart';
import 'package:teste/views/pet_details.dart';
import 'package:teste/views/pet_config.dart';
import '../data/pet_test.dart';
import '../models/pet.dart';

class PetList extends StatefulWidget {

  @override
  State<PetList> createState() => _PetListState();

}

class _PetListState extends State<PetList> {
  //var pets={...PET_TEST};
  Map<String, dynamic> pets = {};
  var petId = 0;

  _PetListState(){
    petId += pets.length;
  }

  void download() async
  {
    final prefs = await SharedPreferences.getInstance();
    String? encodedMap = prefs.getString('petlist');
    petId = prefs.getInt('petid')!;
    pets = {};

    Map<String, dynamic> petscast = {};
    petscast = {};
    petscast.addAll(Map.from(jsonDecode(encodedMap!)));


    //pets.addAll(Pet.fromJson(petscast) as Map<String, dynamic>);
    //pets.addAll(p)
    for(var v in petscast.values) {
      print(v);

      int id = 0;
      String name ="";
      String species ="";
      String gender ="";
      String porte= "";
      String born = "";
      String lastvax = "";
      String avatarUrl = "";
      List<String> reminders = [""];

      v.forEach((i, value) {
        //print('index=$i, value=$value');
        if (i == "id")
          id = value;
        else if (i == "name")
          name = value;
        if (i == "species")
          species = value;
        if (i == "gender")
          gender = value;
        if (i == "porte")
          porte = value;
        if (i == "born")
          born = value;
        if (i == "lastvax")
          lastvax = value;
        if (i == "avatarUrl")
          avatarUrl = value;
        //if (i == "reminders")
          // = value as List<String>;
      });
      pets['${id}'] = Pet(id: id, name: name, species: species, gender: gender, porte: porte, born: born, lastvax: lastvax, avatarUrl: avatarUrl, reminders: reminders);

    }
    setState((){
    });
    //print(petscast);
    //print(pets);
  }

  void upload() async
  {
    final prefs = await SharedPreferences.getInstance();
    String encodedMap = jsonEncode(pets);
    print("MAPA CODIFICADO: ");
    print(encodedMap);
    await prefs.setString('petlist', encodedMap);
    await prefs.setInt('petid', petId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seus Pets"),
        actions: <Widget>[

          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState((){
                    download();
                  });
                },
                child: Icon(
                  Icons.cloud_download,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PetConfig(pets)),
                  );
                },
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 40.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                  });
                  upload();
                },
                child: Icon(
                  Icons.refresh,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (ctx, i) => PetCard(pets.values.elementAt(i),pets)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var length = pets.length-1;
          var lastid = petId+=1;
          debugPrint("$lastid");
          setState(() {
            var sum = lastid!+1;
            pets['${sum}'] = Pet(id: sum, name: "", species: "", gender: "Fêmea", porte: "Pequeno", born: "01/01/1970", lastvax: "01/01/1970", avatarUrl: "", reminders: [""]);
          });
          debugPrint("$pets");
          var sum = lastid!+1;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetDetail(pets['${sum}']!,pets)),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      )
    );
    return Center(
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}
