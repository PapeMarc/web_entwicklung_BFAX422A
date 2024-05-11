import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _ChatPageState();

  String _userInput = "";
  final List<MessageAndUsage> _messages = List<MessageAndUsage>.empty(growable: true);
  Alignment _alignment = Alignment.bottomLeft;
  EdgeInsets _margin = EdgeInsets.zero;
  bool assistantActive = false;

  ChatApi? _api;
    final FocusNode _focusNode = FocusNode();

  void _setAiAnswer(MessageAndUsage message) {
    
    if(!assistantActive){return;}
    assistantActive = false;

    setState(() {
      _messages.removeLast();
      _messages.add(message);
    });
  }

  void _setUserInput(String input) {
    _userInput = input;
  }

  void _askAI() async {

    if(assistantActive || _userInput.isEmpty){return;}
    assistantActive = true;

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
    _userInput = "";
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

    if(assistantActive || _userInput.isEmpty){return;}
    assistantActive = true;

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

    _userInput = "";

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
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(

      appBar: AppBar(

        backgroundColor: colorScheme.primary,
        title: Text(
          widget.title, 
          style: TextStyle(
            color: colorScheme.background
          ),
        ),
      ),

      body: Container(

        color: colorScheme.onBackground,
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
                  TextStyle dynamicStyle = TextStyle(fontSize: 20, color: colorScheme.background);
                  var prefix = "You: ";
                  if(index%2==0) {
                    _alignment = Alignment.bottomLeft;
                    _margin = EdgeInsets.fromLTRB(8, 15, MediaQuery.of(context).size.width/3, 15);
                    dynamicStyle = const TextStyle(fontSize: 20, color: Colors.amber);
                    prefix = "ChatGPT: ";
                  } else {
                    _alignment = Alignment.bottomRight;
                    _margin = EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/3, 15, 8, 15);
                  }
                  var formattedMessage = prefix + _messages.reversed.elementAt(index).message.toString();
                  return Container(
                    alignment: _alignment,
                    margin: _margin,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

                    /*decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, 
                        end: Alignment.bottomCenter, 
                        colors: [
                          colorScheme.primary,
                          colorScheme.primary
                        ]
                      ),
                      color: Colors.blueGrey
                    ),*/

                    child: Text(
                      formattedMessage,
                      style: dynamicStyle,
                    )
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
                  style: TextStyle(color: colorScheme.background),
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Example: Hey ChatGPT! How are you?",
                    labelText: "Message",
                    hintStyle: TextStyle(color: colorScheme.secondary),
                    fillColor: colorScheme.primary,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: colorScheme.background,
                        width: 2.0,
                      ),
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2.0,
                      )
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send_rounded, size: 25),
                      onPressed: ()=>{_askAI(), controller.clear()},
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      color: colorScheme.background,
                    ),
                    prefixIcon: const Icon(Icons.message_rounded),
                    prefixIconColor: colorScheme.background,
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

          ],
        ),
      ),

    );

  }
}