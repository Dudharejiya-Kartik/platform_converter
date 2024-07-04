import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/date_provider.dart';
import '../provider/switch_provider.dart';

class CircleAvatars extends StatelessWidget {
  CircleAvatars({
    super.key,
    this.radius = 90,
    this.height = 120,
    this.width = 150,
    FileImage? backgroundImage,
    Icon? child,
  });
  final double? radius, height, width;

  @override
  Widget build(BuildContext context) {
    bool isAndroid =
        Provider.of<SwitchProvider>(context, listen: true).isActive;
    var personAddProvider =
        Provider.of<PersonAddProvider>(context, listen: true);
    var imgPath = personAddProvider.imgpath;
    return isAndroid
        ? InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            radius: 50,
            onTap: () {
              Provider.of<PersonAddProvider>(context, listen: false)
                  .pickImage();
            },
            child: CircleAvatar(
              radius: radius,
              child: imgPath == null ? Icon(Icons.add_a_photo_outlined) : null,
              backgroundImage: imgPath == null ? null : FileImage(imgPath),
            ),
          )
        : CupertinoButton(
            onPressed: () {
              Provider.of<PersonAddProvider>(context, listen: false)
                  .pickImage();
            },
            child: ClipOval(
              child: Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CupertinoColors.inactiveGray,
                  image: imgPath == null
                      ? null
                      : DecorationImage(
                          fit: BoxFit.cover, image: FileImage(imgPath)),
                ),
                child: imgPath == null
                    ? Icon(
                        CupertinoIcons.camera,
                        color: CupertinoColors.white,
                      )
                    : null,
              ),
            ),
          );
  }
}
