import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: _customInputDecoration(colors: colors),
      onTapOutside: (event) {
        print('quiero saber que ases $event');
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        print('aqui push enter locochon por que depsues se enojan $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }

  InputDecoration _customInputDecoration({required ColorScheme colors}) =>
      InputDecoration(
        enabledBorder: _customOutlineInputBorder(colors.primary),
        focusedBorder: _customOutlineInputBorder(colors.primaryContainer),
        hintText: 'Escribe un mensaje',
      );

  OutlineInputBorder _customOutlineInputBorder(Color color) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(20),
      );
}
