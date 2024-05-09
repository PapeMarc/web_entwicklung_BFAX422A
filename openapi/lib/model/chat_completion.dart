//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChatCompletion {
  /// Returns a new [ChatCompletion] instance.
  ChatCompletion({
    this.id,
    this.object,
    this.created,
    this.model,
    this.systemFingerprint,
    this.choices = const [],
    this.usage,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? object;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? created;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? model;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? systemFingerprint;

  List<ChatChoice> choices;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? usage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChatCompletion &&
    other.id == id &&
    other.object == object &&
    other.created == created &&
    other.model == model &&
    other.systemFingerprint == systemFingerprint &&
    _deepEquality.equals(other.choices, choices) &&
    other.usage == usage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (object == null ? 0 : object!.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (model == null ? 0 : model!.hashCode) +
    (systemFingerprint == null ? 0 : systemFingerprint!.hashCode) +
    (choices.hashCode) +
    (usage == null ? 0 : usage!.hashCode);

  @override
  String toString() => 'ChatCompletion[id=$id, object=$object, created=$created, model=$model, systemFingerprint=$systemFingerprint, choices=$choices, usage=$usage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    if (this.created != null) {
      json[r'created'] = this.created;
    } else {
      json[r'created'] = null;
    }
    if (this.model != null) {
      json[r'model'] = this.model;
    } else {
      json[r'model'] = null;
    }
    if (this.systemFingerprint != null) {
      json[r'system_fingerprint'] = this.systemFingerprint;
    } else {
      json[r'system_fingerprint'] = null;
    }
      json[r'choices'] = this.choices;
    if (this.usage != null) {
      json[r'usage'] = this.usage;
    } else {
      json[r'usage'] = null;
    }
    return json;
  }

  /// Returns a new [ChatCompletion] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChatCompletion? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChatCompletion[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChatCompletion[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChatCompletion(
        id: mapValueOfType<String>(json, r'id'),
        object: mapValueOfType<String>(json, r'object'),
        created: mapValueOfType<int>(json, r'created'),
        model: mapValueOfType<String>(json, r'model'),
        systemFingerprint: mapValueOfType<String>(json, r'system_fingerprint'),
        choices: ChatChoice.listFromJson(json[r'choices']),
        usage: mapValueOfType<String>(json, r'usage'),
      );
    }
    return null;
  }

  static List<ChatCompletion> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChatCompletion>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChatCompletion.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChatCompletion> mapFromJson(dynamic json) {
    final map = <String, ChatCompletion>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChatCompletion.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChatCompletion-objects as value to a dart map
  static Map<String, List<ChatCompletion>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChatCompletion>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChatCompletion.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

