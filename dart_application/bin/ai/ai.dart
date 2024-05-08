import 'package:openapi/api.dart';

abstract class Ai {
  Future<Message> chat(Message input);
}
