import 'package:flutter/material.dart';
import 'package:teste/views/pet_details.dart';
import '../models/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final Map<String, dynamic> petslist;
  const PetCard(this.pet, this.petslist);

  @override
  Widget build(BuildContext context) {
    final name = pet.name.isEmpty ? "Sem nome" : pet.name ;
    final species = pet.species.isEmpty ? "undefined" : pet.species ;
    final photo = pet.avatarUrl.isEmpty ? "about:blank" : pet.avatarUrl ;

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetDetail(pet,petslist)),
            );
          },
          child: Container(
            width: 1500.0,
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(photo),
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  fit:BoxFit.cover
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,style: TextStyle(
                  fontSize: 40,
                  color: Colors.black87,
                ),),
                Text(species,style: TextStyle(
                  fontSize: 32,
                  color: Colors.black87,
                ),),
              ],
            ),
          ),
        ),

      ),
    );
  }
}


