import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';
import 'homePage.dart';
//import 'package:fluent_ui/fluent_ui.dart' hide Colors hide IconButton;

void main() {
  var apiClient = ApiClient(basePath: 'http://127.0.0.1:8080');
  var api = ChatApi(apiClient);
  runApp(
    Provider<ChatApi>(
      create: (_) => api,
      child: const ChatApp(),
    ),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return /*Material*/ MaterialApp(
      title: 'GPT Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade400),
        //scaffoldBackgroundColor: Color.fromARGB(1, 188, 188, 188),
        useMaterial3: true,
      ),
      home: const ChatPage(title: 'ChatGPT - Chat Completions'),
    );
  }
}