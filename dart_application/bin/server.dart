import 'dart:convert';
import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:openapi/api.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';

import 'ai/ai.dart';
import 'ai/mock_ai.dart';
import 'ai/openai.dart';

class EnvVariables {
  static final useMockAi = 'CHAT_SERVER_USE_MOCK';
  static final port = 'CHAT_SERVER_PORT';
}


Ai _ai = OpenAiChat(model: GptTurbo0631Model());


final _router = Router()
  ..get('/', _rootHandler)
  ..post('/chat', _chatHandler);


Response _rootHandler(Request req) {
  return Response.ok('Chat Server V0.0.1');
}

Future<Response> _chatHandler(Request request) async {
  if (request.contentLength == 0) {
    return Response.badRequest(body: 'Request body is empty');
  }
  final inJson = await request.readAsString();

  Map<String, dynamic> messageMap;
  try {
    messageMap = json.decode(inJson);
  } catch (e) {
    return Response.badRequest(body: 'Invalid JSON format: $e');
  }

  Message message;
  try {
    message = Message.fromJson(messageMap)!;
  } catch (e) {
    return Response.badRequest(body: 'Invalid Message format: $e');
  }

  Message response;
  try {
    response = await _ai.chat(message);
  } catch (e) {
    return Response.internalServerError(body: 'Error invoking AI: $e');
  }

  return Response.ok(json.encode(response.toJson()));
}

void main(List<String> args) async {
  bool useMock = bool.parse(Platform.environment[EnvVariables.useMockAi] ?? 'false');
  if (useMock) {
    _ai = MockAi();
    print('Warning: Using Mock AI.');
  }

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment[EnvVariables.port] ?? '8080');
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(_router.call);

  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}.');
}
