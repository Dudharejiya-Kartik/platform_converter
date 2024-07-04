import 'dart:io';
import 'package:flutter/material.dart';

class PersonlDataModel {
  String? name, phoneNumber, chatConversation;
  DateTime? date;
  TimeOfDay? timeOfDay;
  File? imgPath;

  PersonlDataModel(
      {this.name,
      this.phoneNumber,
      this.chatConversation,
      this.imgPath,
      this.date,
      this.timeOfDay});
}
