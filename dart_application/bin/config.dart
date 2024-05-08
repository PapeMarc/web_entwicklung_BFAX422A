import 'dart:io' as io;
import 'dart:convert';


class Config{
  Config({required this.apiToken, required this.organizationId});

  final String apiToken;
  final String organizationId;

  static Future<Config> readConfig() async {
    var secrets = await io.File("secrets.json").readAsString();
    var json = jsonDecode(secrets);
    return Config(
      apiToken: json['api_token'], 
      organizationId: json['organization_id'],);
  }

}