import 'package:flutter/material.dart';
import 'package:teste/components/pet_card.dart';
import '../data/pet_test.dart';
import '../models/pet.dart';

class PetConfig extends StatelessWidget {

  late Map<String, dynamic> pets;
  PetConfig(Map<String, dynamic> pets)
  {
    this.pets = pets;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configurações da aplicação")
        ),
      body: const Center(
        /*child: ElevatedButton(
          onPressed: () {
              for (int i = 0; i< pets.length ; i++)
                {
                    pets.remove('$i');
                }
          },
          child: Text('Deletar Dados'),
        ),
      ),*/
    ));
  }
}
