import 'package:flutter/material.dart';
import 'package:platform_converter/compnents/listtile.dart';
import 'package:provider/provider.dart';
import '../../../provider/chat_provider.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

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
