import 'package:openapi/api.dart';

import 'ai.dart';

class MockAi implements Ai {
  static final _message = 'My mock message';

  @override
  Future<Message> message(Message input) async {
    return Message(
        timestamp: DateTime.now().toUtc(),
        author: MessageAuthorEnum.system,
        message: _message);
  }

  @override
  Future<MessageAndUsage> chat(Chat input) async {
    return MessageAndUsage(
        timestamp: DateTime.now().toUtc(),
        author: MessageAndUsageAuthorEnum.system,
        message: _message);
  }
}
