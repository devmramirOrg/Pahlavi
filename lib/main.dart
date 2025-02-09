import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('کیبورد پهلوی'),
        ),
        body: PahlaviKeyboard(),
      ),
      
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class PahlaviKeyboard extends StatefulWidget {
  @override
  _PahlaviKeyboardState createState() => _PahlaviKeyboardState();
}

class _PahlaviKeyboardState extends State<PahlaviKeyboard> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _keyboardKeys = [
    {'label': '𐭠', 'value': '𐭠'},
    {'label': '𐭡', 'value': '𐭡'},
    {'label': '𐭯', 'value': '𐭯'},
    {'label': '𐭣', 'value': '𐭣'},
    {'label': '𐭤', 'value': '𐭤'},
    {'label': '𐭩', 'value': '𐭩'},
    {'label': '𐭪', 'value': '𐭪'},
    {'label': '𐭧', 'value': '𐭧'},
    {'label': '𐭨', 'value': '𐭨'},
    {'label': '𐭲', 'value': '𐭲'},
    {'label': '𐭼', 'value': '𐭼'},
    {'label': '𐭽', 'value': '𐭽'},
    {'label': '𐭿', 'value': '𐭿'},
    {'label': '𐭾', 'value': '𐭾'},
    {'label': '𐭪', 'value': '𐭪'},
    {'label': '𐭫', 'value': '𐭫'},
    {'label': '𐭀', 'value': '𐭀'},
    {'label': '𐭁', 'value': '𐭁'},
    {'label': '𐭇', 'value': '𐭇'},
    {'label': '𐭏', 'value': '𐭏'},
    {'label': '𐭪', 'value': '𐭪'},
    {'label': '𐭙', 'value': '𐭙'},
    {'label': '𐭮', 'value': '𐭮'},
    {'label': '𐭯', 'value': '𐭯'},
    {'label': '𐭭', 'value': '𐭭'},
    {'label': '𐭲', 'value': '𐭲'},
    {'label': '𐭩', 'value': '𐭩'},
    {'label': '𐭰', 'value': '𐭰'},
    {'label': '␣', 'value': ' '}, 
    {'label': '↵', 'value': '\n'}, 
  ];

  void _onKeyPressed(String value) {
    final text = _controller.text;
    final selection = _controller.selection;

    setState(() {
      
      final newText = text.substring(0, selection.start) +
          value +
          text.substring(selection.end);
      _controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(
          offset: selection.start + value.length,
        ),
      );
    });
  }

  Widget _buildKeyboard() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6, 
        childAspectRatio: 1.5, 
      ),
      itemCount: _keyboardKeys.length,
      itemBuilder: (context, index) {
        final key = _keyboardKeys[index];
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: () => _onKeyPressed(key['value']),
            child: Text(
              key['label'],
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, 
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'متن خود را وارد کنید',
              ),
              maxLines: 5, 
              textDirection: TextDirection.rtl, 
              textAlign: TextAlign.right, 
            ),
          ),
          Expanded(
            child: _buildKeyboard(),
          ),
        ],
      ),
    );
  }
}