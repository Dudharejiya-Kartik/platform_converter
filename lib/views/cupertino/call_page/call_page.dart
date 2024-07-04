import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../compnents/listtile.dart';
import '../../../provider/chat_provider.dart';

class IOSCallPage extends StatelessWidget {
  const IOSCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return Column(
      children: [
        ...List.generate(
            providerTrue.personData.length,
            (index) => ListTiles(
                  index: index,
                  isForChat: false,
                ))
      ],
    );
  }
}
