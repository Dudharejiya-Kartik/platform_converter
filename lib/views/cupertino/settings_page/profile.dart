import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile_page/profile.dart';

final TextEditingController name = TextEditingController();
final TextEditingController bio = TextEditingController();

Widget profile__container() {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          getImage();
        },
        child: CircleAvatar(
          radius: 80,
          backgroundImage: Image == null ? FileImage(image!) : null,
          child: Image == null
              ? Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.grey[800],
                )
              : null,
        ),
      ),
      CupertinoTextField(
        controller: name,
        placeholder: 'Enter your name...',
      ),
      SizedBox(
        height: 10,
      ),
      CupertinoTextField(
        controller: bio,
        placeholder: 'Enter your Bio...',
      ),
      Row(
        children: [
          CupertinoButton(
            child: Text('SAVE'),
            onPressed: () {},
          ),
          CupertinoButton(
            child: Text('CLEAR'),
            onPressed: () {},
          ),
        ],
      )
    ],
  );
}
