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
  final List<String> _messages = List<String>.empty(growable: true);
  Alignment _alignment = Alignment.bottomLeft;

  ChatApi? _api;
    final FocusNode _focusNode = FocusNode();

  void _setAiAnswer(Message message) {
    setState(() {
      _messages.removeLast();
      _messages.add("ChatGPT: \"${message.message ?? "<no message received>"}\"");
    });
  }

  void _setUserInput(String input) {
    _userInput = input;
  }

  void _askAI() async {
    setState((){_messages.add("You: \"$_userInput\""); _messages.add("ChatGPT: typing..."); _focusNode.requestFocus();});
    var message = Message(
      timestamp: DateTime.now().toUtc(),
      author: MessageAuthorEnum.user,
      message: _userInput,
    );

    var response = await _api!.chat(message);
    _setAiAnswer(response!);
  }

    void _askAIwithInput(String input) async {
    setState((){_messages.add("You: \"$input\""); _messages.add("ChatGPT: typing..."); _focusNode.requestFocus();});
    var message = Message(
      timestamp: DateTime.now().toUtc(),
      author: MessageAuthorEnum.user,
      message: input,
    );

    var response = await _api!.chat(message);
    _setAiAnswer(response!);
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ChatApi>(context);
    var controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: TextStyle(color: Theme.of(context).colorScheme.background),),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onBackground,
        child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.fromLTRB(30, 10, 100, 30),
              //physics: const NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: false,
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                if(index%2==0) {
                  _alignment = Alignment.bottomLeft;
                } else {
                  _alignment = Alignment.bottomRight;
                }
                return Container(
                  alignment: _alignment,
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    _messages.reversed.elementAt(index),
                    style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.background),
                  ),
                );
              },
              ),
            ),
          const Row(
            children: [
              SizedBox(height: 20,),
            ],
          ),
          Row(
            children:<Widget>[
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  focusNode: _focusNode,
                  style: TextStyle(color: Theme.of(context).colorScheme.background),
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Example: Hey ChatGPT! How are you?",
                    labelText: "Message",
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    fillColor: Theme.of(context).colorScheme.primary,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 2.0,
                      ),
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      )
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    //prefixText: " ",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send_rounded, size: 25),
                      onPressed: ()=>{_askAI(), controller.clear()},
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      color: Theme.of(context).colorScheme.background,
                    ),
                    prefixIcon: const Icon(Icons.message_rounded),
                    prefixIconColor: Theme.of(context).colorScheme.background,
                  ),
                  cursorColor: Theme.of(context).primaryColorLight,
                  onChanged: (String value) {_setUserInput(value);},
                  onFieldSubmitted: (value) {
                    controller.clear();
                    _askAIwithInput(value);
                  },
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/2),
            ],
          ),
      ],),
      ),
    );
  }
}