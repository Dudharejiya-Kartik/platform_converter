import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../compnents/listtile.dart';
import '../../../provider/chat_provider.dart';

class IOSChatPage extends StatelessWidget {
  const IOSChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ...List.generate(
              providerTrue.personData.length,
              (index) => ListTiles(
                    index: index,
                  ))
        ],
      ),
    );
  }
}
