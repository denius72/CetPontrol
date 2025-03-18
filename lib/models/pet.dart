import 'package:flutter/material.dart';

class Pet{

  int id;
  String name;
  String species;
  String gender; //0 - machista //1 - femea
  String porte; //0 - pequeno //1 - medio //2 - grande //outro valor é undefined
  String born;
  String lastvax;
  String avatarUrl;
  List<String> reminders;

  Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.porte,
    required this.born,
    required this.lastvax,
    required this.avatarUrl,
    required this.reminders
  });

  Pet.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      species = json['species'],
      gender = json['gender'],
      porte = json['porte'],
      born = json['born'],
      lastvax = json['lastvax'],
      avatarUrl = json['avatarUrl'],
      reminders = json['reminders'];

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'species': species,
      'gender': gender,
      'porte': porte,
      'born': born,
      'lastvax': lastvax,
      'avatarUrl': avatarUrl,
      'reminders': [""]
  };
}