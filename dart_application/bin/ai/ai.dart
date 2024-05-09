import 'package:openapi/api.dart';

abstract class Ai {
  Future<Message> message(Message input);
  Future<MessageAndUsage> chat(Chat chat);
}