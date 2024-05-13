import 'package:flutter/material.dart';
import 'package:flutter_application/PrefsManager.dart';
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

  ChatApi? _api;

  String _userInput = "";
  double _conversationCosts = 0;
  String _conversationCostsFiveDecimals = "0.00000";
  Alignment _alignment = Alignment.bottomLeft;
  EdgeInsets _margin = EdgeInsets.zero;
  bool assistantActive = false;

  String _errorMessage = "No Errors detected.";
  TextStyle _errorMessageTextStyle = const TextStyle(color: Colors.green,fontWeight: FontWeight.normal);
  Color _errorMessageBoxColor = const Color.fromARGB(255, 92, 91, 125); // this color is overwritten by building the Widget.
  

  final FocusNode _focusNode = FocusNode();
  final double _modelCostsPerToken = (0.93/500000); // The current Model gpt-3.5-turbo-0613 costs 2 Dollar per 1 million Tokens
  final List<MessageAndUsage> _messages = List<MessageAndUsage>.empty(growable: true);

  @override
  void initState(){
    super.initState();
    _loadConversation();
  }

  /*@override
  void dispose() {
    prefsManager.saveConversation(_messages);
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ChatApi>(context);
    var controller = TextEditingController();
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size displaySize = MediaQuery.of(context).size;

    /*App GUI*/
    return Scaffold(

      /*App-Bar = Bar located at the top.*/
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          widget.title, 
          style: TextStyle(color: colorScheme.background),
        ),
      ),

      /*Body: GUI below the App-Bar.*/
      body: Container(

        color: colorScheme.onBackground,

        /*Main vertical Column for all other GUI-components to attatch to.*/
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _errorMessageBoxColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    constraints: BoxConstraints(maxWidth: displaySize.width*0.48),
                    child: Text(_errorMessage, style: _errorMessageTextStyle, maxLines: 1, overflow: TextOverflow.clip),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  constraints: BoxConstraints(maxWidth: displaySize.width*0.2),
                  decoration: BoxDecoration(
                      color: colorScheme.tertiary, 
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  child: 
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: 
                      Text(
                       "Chat Costs till now: $_conversationCostsFiveDecimals €",
                        style: TextStyle(color: colorScheme.surface, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                ),
                const SizedBox(width: 5),
                Container(
                  constraints: BoxConstraints(maxWidth: displaySize.width*0.1),
                  decoration: BoxDecoration(
                      color: colorScheme.tertiary, 
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  padding: const EdgeInsets.fromLTRB(0,4,0,4),
                  child: TextButton.icon(
                      icon: Icon(Icons.delete, color: colorScheme.background,), 
                      label: Text("Delete Chat", style: TextStyle(color: colorScheme.background, overflow: TextOverflow.ellipsis)),
                      onPressed: _deleteConversation
                    )
                    /*Row(
                    children: [
                      SizedBox(width: 10),
                      Text("Delete whole Conversation.", style: TextStyle(color: colorScheme.background),),
                      IconButton(
                        onPressed: null, 
                        icon: Icon(Icons.delete, color: colorScheme.background,)
                      ),
                    ],
                  ),*/
                ),
                const SizedBox(width: 5),
                Container(
                  constraints: BoxConstraints(maxWidth: displaySize.width*0.1),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary, 
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  padding: const EdgeInsets.fromLTRB(0,4,0,4),
                  child: TextButton.icon(
                      icon: Icon(Icons.save_alt, color: colorScheme.background,), 
                      label: Text("Save Chat", style: TextStyle(color: colorScheme.background, overflow: TextOverflow.ellipsis)),
                      onPressed: _save,
                    )
                ),
                SizedBox(width: displaySize.width*0.05, height: displaySize.height*0.1,),
              ],
            ),

            /*SizedBox with ListView inside, to display the Chat.*/
            Container(
              margin: EdgeInsets.fromLTRB(displaySize.width*0.05, 0, displaySize.width*0.05, 0),
              decoration: BoxDecoration(
                border: Border.all(color:colorScheme.primary, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              child: SizedBox(
                height: displaySize.height *0.6,
                child: RawScrollbar(
                  thumbColor: colorScheme.secondary,
                  radius: const Radius.circular(20),
                  thickness: 5,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    //physics: const NeverScrollableScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      TextStyle dynamicStyle = TextStyle(fontSize: 20, color: colorScheme.surface);
                      var prefix = "You: ";
                      if(index%2==0) {
                        _alignment = Alignment.bottomLeft;
                        _margin = EdgeInsets.fromLTRB(8, 15, displaySize.width/3, 15);
                        dynamicStyle = const TextStyle(fontSize: 20, color: Colors.amber);
                        prefix = "ChatGPT: ";
                      } else {
                        _alignment = Alignment.bottomRight;
                        _margin = EdgeInsets.fromLTRB(displaySize.width/3, 15, 8, 15);
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
              ),
            ),
            
            /*Row adds some Space between the Chat and the Input TextFormField*/
            Row(
              children: [
                SizedBox(height: displaySize.height*0.05,),
              ],
            ),

            /*Implements a TextFormField for setting UserInput and sending Messages.*/
            Row(
            children:<Widget>[
              // some left padding
              SizedBox(width: displaySize.width*0.05), 
              
              // TextFormField
              Expanded(
                child: TextFormField(

                  /*Autofocus on Page loaded.*/
                  autofocus: true,

                  /*Controller*/
                  focusNode: _focusNode,
                  controller: controller,

                  /*Text Styling */
                  cursorColor: Theme.of(context).primaryColorLight,
                  style: TextStyle(color: colorScheme.surface),

                  /*FormField Styling*/
                  decoration: InputDecoration(

                    /*Textbox Styling*/
                    hintText: "Example: Hey ChatGPT! How are you?",
                    labelText: "Message",
                    hintStyle: TextStyle(color: colorScheme.secondary),
                    fillColor: colorScheme.primary,
                    contentPadding: const EdgeInsets.all(20),

                    /*focusedBorder Styling */
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),

                      borderSide: BorderSide(
                        color: colorScheme.background,
                        width: 2.0,
                      ),
                    ),

                    /*enabledBorder Styling */
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2.0,
                      )
                    ),
                    
                    /*Suffix Icon Styling*/
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send_rounded, size: 25),
                      onPressed: ()=>{_askAI(), controller.clear()},
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      color: colorScheme.background,
                    ),

                    /*Prefix Icon Styling*/
                    prefixIcon: const Icon(Icons.message_rounded),
                    prefixIconColor: colorScheme.background,
                  ),

                  /*Event implementations*/
                  onChanged: (String value) {_setUserInput(value);},
                  onFieldSubmitted: (value) {
                    controller.clear();
                    _askAIwithInput(value);
                  },
                ),
              ),
              
              // defines the display width of the Input Textfield
              SizedBox(width: displaySize.width/2), 
            ],
          ),
          ],
        ),
      ),

    );

  }

  void setErrorMessage({ColorScheme? colorScheme, String? message}){

    String defaultMessage = "No Errors detected.";

    _errorMessage = message ?? defaultMessage;

    if(_errorMessage == defaultMessage){
      setState(() {
        _errorMessageTextStyle = const TextStyle(color: Colors.green,fontWeight: FontWeight.normal);
        _errorMessageBoxColor = colorScheme?.tertiary ?? const Color.fromARGB(255, 92, 91, 125);
      });
      return;
    }
    else{
      setState(() {
        _errorMessageTextStyle = TextStyle(color: colorScheme?.error ?? Colors.red, fontWeight: FontWeight.bold);
        _errorMessageBoxColor = colorScheme?.onErrorContainer ?? Colors.white;
      });
    }
  }

  /// Try-Catch included.
  void _deleteConversation(){
    try{
      _setConversationCosts(0);
      setState(() {
        _messages.clear();
      });
      _save();
      setErrorMessage();
    }
    catch(e){
      setErrorMessage(colorScheme: Theme.of(context).colorScheme, message: e.toString());
    }
  }

  /// No Try-Catch included.
  void _setConversationCosts(double costs){
      _conversationCosts = costs;
      setState(() {
        _conversationCostsFiveDecimals = _conversationCosts.toStringAsFixed(5);
      });
  }

  /// No Try-Catch included.
  void _setAiAnswer(MessageAndUsage message) {

    if(!assistantActive){return;}
    assistantActive = false;

    setState(() {
      _messages.removeLast();
      _messages.add(message);
    });

    double costs = 0;
    _messages.forEach((element) {costs += element.usage!.totalTokens! * _modelCostsPerToken;});
    _setConversationCosts(costs);

  }

  /// No Try-Catch included.
  void _setUserInput(String input) {
    _userInput = input;
  }

  /// Try-Catch included.
  void _askAI() async {
    try{
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
      
      try{
        gptMessage = (await _api!.chatCompletion(chat)) ?? gptMessage;
      }
      catch(e){
        gptMessage.message = "failed.";
        _setAiAnswer(gptMessage);
        throw e;
        //rethrow; <- doesn't work here?
      }

      _setAiAnswer(gptMessage);
    }
    catch(e){
      setErrorMessage(message: e.toString());
    }
  }

  /// Try-Catch included.
  void _askAIwithInput(String input) async {
    try{
      
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
        gptMessage.message = "failed.";
        _setAiAnswer(gptMessage);
        rethrow;
      }
      
      _setAiAnswer(gptMessage);

    }
    catch(e){
      setErrorMessage(message: e.toString());
    }
  }

  /// Try-Catch included.
  void _loadConversation() async{
    try{
      List<MessageAndUsage> list = await PrefsManager.loadConversation();
      double costs = 0;
      
      if(list.isNotEmpty){
        list.forEach((element) {costs += element.usage!.totalTokens! * _modelCostsPerToken;});
      }
      
      setState(() {
        _messages.addAll(list);
      });
      _setConversationCosts(costs);
    }
    catch(e){
      setErrorMessage(message: e.toString());
    }
  }

  // was an exit method. Exit doesn't work in flutter (for web), so we use a simple save button function.
  /// Try-Catch included.
  void _save() async{
    try{
      await PrefsManager.saveConversation(_messages);
      /*SystemNavigator.pop();
      exit(0);*/
    }
    catch(e){
      setErrorMessage(message: e.toString());
    }
  }
}