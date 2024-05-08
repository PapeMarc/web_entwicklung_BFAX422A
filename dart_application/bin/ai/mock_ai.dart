import 'package:openapi/api.dart';

import 'ai.dart';

class MockAi implements Ai {
  static final message = 'My mock message';

  @override
  Future<Message> chat(Message input) async {
    return Message(
        timestamp: DateTime.now().toUtc(),
        author: MessageAuthorEnum.system,
        message: message);
  }
}
