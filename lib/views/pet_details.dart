import 'package:flutter/material.dart';
import 'package:teste/views/pet_reminder.dart';
import '../models/pet.dart';

const List<String> genderlist = <String>['Macho', 'Fêmea'];
const List<String> portelist = <String>['Pequeno', 'Médio', 'Grande'];

class PetDetail extends StatefulWidget {

  late final Pet pet;
  late final Map<String, dynamic> petslist;
  PetDetail(Pet pet, Map<String, dynamic> petslist)
  {
      this.pet = pet;
      this.petslist = petslist;
  }

  @override
  State<PetDetail> createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Visualizando "+ widget.pet.name),
        ),
        body: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(widget.pet.avatarUrl), radius: 60),
              Text(widget.pet.name),
              Text(widget.pet.species),
              // ---------------------
              // NOME
              // ---------------------
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  initialValue: widget.pet.name,
                  decoration: const InputDecoration(
                    hintText: 'Coloque o nome do seu pet',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome não pode ser vazio';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value){
                    setState(() {
                      widget.pet.name = value;
                    });
                  },
                ),
              ),
              // ---------------------
              // SPECIES
              // ---------------------
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  initialValue: widget.pet.species,
                  decoration: const InputDecoration(
                    hintText: 'Coloque a espécie do seu pet',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Não pode ser vazio';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value){
                    setState(() {
                      widget.pet.species = value;
                    });
                  },
                ),
              ),
              // ---------------------
              // AVATARURL
              // ---------------------
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  initialValue: widget.pet.avatarUrl,
                  decoration: const InputDecoration(
                    hintText: 'Coloque um link com a foto do seu pet',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Não pode ser vazio';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value){
                    setState(() {
                      widget.pet.avatarUrl = value;
                    });
                  },
                ),
              ),
              // ---------------------
              // GENDER
              // ---------------------
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: DropdownButton<String>(
                  value: widget.pet.gender,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.blueAccent),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      widget.pet.gender = value!;
                    });
                  },
                  items: genderlist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              // ---------------------
              // PORTE
              // ---------------------
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: DropdownButton<String>(
                  value: widget.pet.porte,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.blueAccent),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      widget.pet.porte = value!;
                    });
                  },
                  items: portelist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            // ---------------------
            // CALENDAR BUTTON
            // ---------------------
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PetReminder(widget.petslist)),
                    );
                  },
                  child: Text('Calendário de Eventos'),
                )
              ),
              // ---------------------
              // DELETE BUTTON
              // ---------------------
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: TextButton(
                  onPressed: () {
                    Widget cancelButton = TextButton(
                      child: Text("Cancelar"),
                      onPressed:  () {
                        Navigator.of(context).pop();
                      },
                    );
                    Widget continueButton = TextButton(
                      child: Text("Continuar"),
                      onPressed:  () {
                        var list = widget.petslist;
                        debugPrint("Antes: $list");
                        var id = widget.pet.id;
                        widget.petslist.remove("$id");
                        debugPrint("Depois: $list");
                        super.setState(() {});
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    );
                    AlertDialog alert = AlertDialog(
                      title: Text("Aviso"),
                      content: Text("Tem certeza que gostaria de deletar esse pet?"),
                      actions: [
                        cancelButton,
                        continueButton,
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: Text('Deletar Esse Pet'),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
