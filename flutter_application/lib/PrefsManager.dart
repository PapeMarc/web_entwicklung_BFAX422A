import 'dart:convert';
import 'package:openapi/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager{
  PrefsManager._();

  static saveConversation(List<MessageAndUsage> messages) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('conversation', json.encode(messages));
  }

  static Future<List<MessageAndUsage>> loadConversation() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefConversation = prefs.getString('conversation') ?? "";
    try{
      if(prefConversation.isNotEmpty){ 
        Iterable readJson = json.decode(prefConversation);
        return List<MessageAndUsage>.from(readJson.map((model) => MessageAndUsage.fromJson(model)));
      }
      else{
        return List<MessageAndUsage>.empty(growable: true);
      }
    }
    catch(e){
      return List<MessageAndUsage>.empty(growable: true);
    }
  }
}