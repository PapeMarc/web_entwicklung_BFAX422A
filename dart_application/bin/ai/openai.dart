import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import "package:openapi/api.dart";

import "ai.dart";
import "../config.dart";

class OpenAiChat implements Ai {
  OpenAiChat({required this.model});

  final ChatModel model;

  @override
  Future<Message> chat(Message input) async {
    final config = await Config.readConfig();
    final openAI = OpenAI.instance.build(
        token: config.apiToken,
        orgId: config.organizationId,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 120)),
        enableLog: true);
    
    final request = ChatCompleteText(messages: [
      Map.of({"role": "user", "content": input.message})
    ], maxToken: 200, model: model);
    
    final response = await openAI.onChatCompletion(request: request);
    
    final answer = response?.choices.map((c) => c.message!.content).join("\n\n") ?? '<no answer received...>';
    return Message(
        timestamp: DateTime.now().toUtc(),
        author: MessageAuthorEnum.system,
        message: answer);
  }
}
