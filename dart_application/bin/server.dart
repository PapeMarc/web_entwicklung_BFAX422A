import 'dart:convert';
import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
//import 'package:http/http.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:openapi/api.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..post('/chat', _chatHandler);

Response _rootHandler(Request req) {
  return Response.ok('Server reached. Hello there!\n');
}

Future<Response> _chatHandler(Request request) async {
  print('Chat Handler active.');
  final body = await request.readAsString();
  final Message? message = Message.fromJson(json.decode(body)); //(author: MessageAuthorEnum.user, message: body.toString(), timestamp: DateTime.now());
  final ChatModel model;

  final openAI = OpenAI.instance.build(
    orgId: "", 
    token: "", 
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 120)), 
    enableLog: true);

    final response = await openAI.onChatCompletion(
      request: ChatCompleteText(messages: [Map.of({"role": "user", "content": message?.message})], maxToken: 200, model: GptTurbo0631Model())
      );

    //final answer = response?.choices.map((c) => c.message!.content).join("\n\n") ?? '<no answer received...>';
    return Response.ok(json.encode(response?.toJson()));
        /*return Response(
          HttpStatus.accepted,
            body: (object) => Message(
            timestamp: DateTime.now().toUtc(),
            author: MessageAuthorEnum.system,
            message: answer)
        );*/
}

void main(List<String> args) async {
  
  final ip = InternetAddress.anyIPv4; // Use any available host or container IP (usually `0.0.0.0`).
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router.call); // Configure a pipeline that logs requests.

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
