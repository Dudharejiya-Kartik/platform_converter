import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../compnents/circle_avatar.dart';
import '../../../compnents/save_button.dart';
import '../../../provider/date_provider.dart';
import 'components/text_fields.dart';

final picker = ImagePicker();
File? image;

Future getImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    image = File(pickedFile.path);
  } else {
    print('No image selected.');
  }
}

class IOSProfilePage extends StatefulWidget {
  const IOSProfilePage({super.key});

  @override
  State<IOSProfilePage> createState() => _IOSProfilePageState();
}

class _IOSProfilePageState extends State<IOSProfilePage> {
  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<PersonAddProvider>(context, listen: true);
    final providerFalse =
        Provider.of<PersonAddProvider>(context, listen: false);
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 130, vertical: 90),
              child: GestureDetector(
                onTap: () {
                  getImage();
                },
                child: CircleAvatars(
                  radius: 100,
                  backgroundImage: image != null ? FileImage(image!) : null,
                  child: image == null
                      ? Icon(CupertinoIcons.camera,
                          size: 50, color: CupertinoColors.inactiveGray)
                      : null,
                ),
              ),
            ),
            cupertinoTextfiled(
              text: 'Full Name',
              icon: CupertinoIcons.person,
              type: TextInputType.name,
              controller: txtfullname,
            ),
            cupertinoTextfiled(
              text: 'Phone Number',
              icon: CupertinoIcons.phone,
              type: TextInputType.number,
              controller: txtmobilenumber,
            ),
            cupertinoTextfiled(
              text: 'Chat Conversation',
              icon: CupertinoIcons.chat_bubble_text,
              type: TextInputType.name,
              controller: txtchat,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.calendar),
                      CupertinoButton(
                        child: Text(
                          providerTrue.dateTime == null
                              ? "Pick Date"
                              : "${providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString()}",
                        ),
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                              actions: [
                                Container(
                                  color: CupertinoColors.white.withOpacity(0.4),
                                  height: 200,
                                  width: 500,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    onDateTimeChanged: (DateTime value) {
                                      setState(() {
                                        providerTrue.dateTime = value;
                                      });
                                    },
                                  ),
                                ),
                                //done
                                CupertinoButton(
                                  child: Text('👍 Done'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                //cancel
                                CupertinoButton(
                                  child: const Text(
                                    '❌ Cancel',
                                    style: TextStyle(
                                      color: CupertinoColors.destructiveRed,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.time),
                      CupertinoButton(
                        child: Text(
                          providerTrue.timeOfDay == null
                              ? "Pick Time"
                              : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                        ),
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                              actions: [
                                Container(
                                  color: CupertinoColors.white.withOpacity(0.4),
                                  height: 200,
                                  width: 500,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    onDateTimeChanged: (value) {
                                      setState(() {
                                        providerTrue.timeOfDay =
                                            TimeOfDay.fromDateTime(value);
                                      });
                                    },
                                  ),
                                ),
                                // done
                                CupertinoButton(
                                  child: const Text('👍 Done'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                //cancel
                                CupertinoButton(
                                  child: const Text(
                                    '❌ Cancel',
                                    style: TextStyle(
                                      color: CupertinoColors.destructiveRed,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SaveButton()],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
