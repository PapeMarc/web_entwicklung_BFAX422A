//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChatUsage {
  /// Returns a new [ChatUsage] instance.
  ChatUsage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? promptTokens;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? completionTokens;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? totalTokens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChatUsage &&
    other.promptTokens == promptTokens &&
    other.completionTokens == completionTokens &&
    other.totalTokens == totalTokens;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (promptTokens == null ? 0 : promptTokens!.hashCode) +
    (completionTokens == null ? 0 : completionTokens!.hashCode) +
    (totalTokens == null ? 0 : totalTokens!.hashCode);

  @override
  String toString() => 'ChatUsage[promptTokens=$promptTokens, completionTokens=$completionTokens, totalTokens=$totalTokens]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.promptTokens != null) {
      json[r'prompt_tokens'] = this.promptTokens;
    } else {
      json[r'prompt_tokens'] = null;
    }
    if (this.completionTokens != null) {
      json[r'completion_tokens'] = this.completionTokens;
    } else {
      json[r'completion_tokens'] = null;
    }
    if (this.totalTokens != null) {
      json[r'total_tokens'] = this.totalTokens;
    } else {
      json[r'total_tokens'] = null;
    }
    return json;
  }

  /// Returns a new [ChatUsage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChatUsage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChatUsage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChatUsage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChatUsage(
        promptTokens: num.parse('${json[r'prompt_tokens']}'),
        completionTokens: num.parse('${json[r'completion_tokens']}'),
        totalTokens: num.parse('${json[r'total_tokens']}'),
      );
    }
    return null;
  }

  static List<ChatUsage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChatUsage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChatUsage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChatUsage> mapFromJson(dynamic json) {
    final map = <String, ChatUsage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChatUsage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChatUsage-objects as value to a dart map
  static Map<String, List<ChatUsage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChatUsage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChatUsage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

