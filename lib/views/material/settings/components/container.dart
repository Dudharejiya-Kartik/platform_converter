import 'package:flutter/material.dart';

import '../../../cupertino/profile_page/profile.dart';

final TextEditingController name = TextEditingController();
final TextEditingController bio = TextEditingController();

Widget profile_container() {
  return Column(
    children: [
      InkWell(
        onTap: () {
          getImage();
        },
        child: CircleAvatar(
          radius: 80,
          backgroundImage: Image != null ? FileImage(image!) : null,
          child: Image == null
              ? Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.grey[800],
                )
              : null,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: 'Enter your name...',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: bio,
          decoration: InputDecoration(
            hintText: 'Enter your Bio...',
          ),
        ),
      ),
      Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('SAVE'),
          ),
          TextButton(onPressed: () {}, child: Text('CLEAR'))
        ],
      )
    ],
  );
}
