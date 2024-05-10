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
  //final List<String> _messageStrings = List<String>.empty(growable: true);
  final List<MessageAndUsage> _messages = List<MessageAndUsage>.empty(growable: true);
  Alignment _alignment = Alignment.bottomLeft;

  ChatApi? _api;
    final FocusNode _focusNode = FocusNode();

  void _setAiAnswer(MessageAndUsage message) {
    setState(() {
      _messages.removeLast();
      _messages.add(message);
    });
  }

  void _setUserInput(String input) {
    _userInput = input;
  }

  void _askAI() async {

    var userMessage = MessageAndUsage(
      author: MessageAndUsageAuthorEnum.user,
      timestamp: DateTime.now(),
      usage: ChatUsage(
        completionTokens: 0,
        promptTokens: 0,
        totalTokens: 0
      ),
      message: _userInput
    );

    var gptMessage = MessageAndUsage(
      author: MessageAndUsageAuthorEnum.assistant,
      timestamp: DateTime.now(),
      usage: ChatUsage(
        completionTokens: 0,
        promptTokens: 0,
        totalTokens: 0
      ),
      message: ""
    );

    setState((){
      _messages.add(userMessage); 
      _messages.add(gptMessage); 
      _focusNode.requestFocus();
    });

    Chat chat = Chat(
      messages: _messages,
      maxTokens: 200
    );

    gptMessage.message = "Typing...";
    
    gptMessage = (await _api!.chatCompletion(chat)) ?? gptMessage;
    
    _setAiAnswer(gptMessage);
  }

    void _askAIwithInput(String input) async {

    var userMessage = MessageAndUsage(
      author: MessageAndUsageAuthorEnum.user,
      timestamp: DateTime.now(),
      usage: ChatUsage(
        completionTokens: 0,
        promptTokens: 0,
        totalTokens: 0
      ),
      message: input
    );

    var gptMessage = MessageAndUsage(
      author: MessageAndUsageAuthorEnum.assistant,
      timestamp: DateTime.now(),
      usage: ChatUsage(
        completionTokens: 0,
        promptTokens: 0,
        totalTokens: 0
      ),
      message: ""
    );

    setState((){
      _messages.add(userMessage); 
      _messages.add(gptMessage); 
      _focusNode.requestFocus();
    });

    Chat chat = Chat(
      maxTokens: 200,
      messages: _messages
    );

    gptMessage.message = "Typing...";
    try{
      gptMessage = (await _api!.chatCompletion(chat)) ?? gptMessage;
    }
    catch(e){
      gptMessage.message = e.toString();
      _setAiAnswer(gptMessage);
    }
    
    _setAiAnswer(gptMessage);
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
                TextStyle dynamicStyle = TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.background);
                var prefix = "You: ";
                if(index%2==0) {
                  _alignment = Alignment.bottomLeft;
                  dynamicStyle = const TextStyle(fontSize: 20, color: Colors.amber);
                  prefix = "ChatGPT: ";
                } else {
                  _alignment = Alignment.bottomRight;
                }
                /*if(_messages.reversed.elementAt(index).author == MessageAndUsageAuthorEnum.assistant){
                }*/
                var formattedMessage = prefix + _messages.reversed.elementAt(index).message.toString();
                return Container(
                  alignment: _alignment,
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    formattedMessage,
                    style: dynamicStyle,
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