import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  String _userInput = "";
  String _aiAnswer = "Empty Textbox for AI Answers.";

  ChatApi? _api;

  void _setAiAnswer(Message message) {
    setState(() {
      _aiAnswer = message.message ?? "<no message received>";
    });
  }

  void _setUserInput(String input) {
    _userInput = input;
  }

  void _askAI() async {

    var message = Message(
      timestamp: DateTime.now().toUtc(),
      author: MessageAuthorEnum.user,
      message: _userInput,
    );

    var response = await _api!.postChat(message);
    _setAiAnswer(response!);
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ChatApi>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            children: [
              SizedBox(width: 15),
              Text(
                _aiAnswer,
                key: const Key('AiAnswerText'),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(height: 30,),
            ],
          ),
          Row(
            children:<Widget>[
              const SizedBox(width: 20),
              Expanded(child: TextFormField(decoration: const InputDecoration(
                icon: Icon(Icons.message),
                hintText: "Example: Hey ChatGPT! Who are you?",
                labelText: "Message"
              ),onChanged: (String value) {_setUserInput(value);},),),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.send_rounded, size: 25),
                onPressed: _askAI,
              ),
              const SizedBox(width: 300),
            ],
          ),
        ],),
      ),
    );
  }
}