//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Message {
  /// Returns a new [Message] instance.
  Message({
    this.timestamp,
    this.message,
    this.author,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? timestamp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  MessageAuthorEnum? author;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Message &&
    other.timestamp == timestamp &&
    other.message == message &&
    other.author == author;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (author == null ? 0 : author!.hashCode);

  @override
  String toString() => 'Message[timestamp=$timestamp, message=$message, author=$author]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.timestamp != null) {
      json[r'timestamp'] = this.timestamp!.toUtc().toIso8601String();
    } else {
      json[r'timestamp'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.author != null) {
      json[r'author'] = this.author;
    } else {
      json[r'author'] = null;
    }
    return json;
  }

  /// Returns a new [Message] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Message? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Message[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Message[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Message(
        timestamp: mapDateTime(json, r'timestamp', r''),
        message: mapValueOfType<String>(json, r'message'),
        author: MessageAuthorEnum.fromJson(json[r'author']),
      );
    }
    return null;
  }

  static List<Message> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Message>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Message.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Message> mapFromJson(dynamic json) {
    final map = <String, Message>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Message.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Message-objects as value to a dart map
  static Map<String, List<Message>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Message>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Message.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class MessageAuthorEnum {
  /// Instantiate a new enum with the provided [value].
  const MessageAuthorEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const user = MessageAuthorEnum._(r'user');
  static const system = MessageAuthorEnum._(r'system');
  static const ai = MessageAuthorEnum._(r'ai');

  /// List of all possible values in this [enum][MessageAuthorEnum].
  static const values = <MessageAuthorEnum>[
    user,
    system,
    ai,
  ];

  static MessageAuthorEnum? fromJson(dynamic value) => MessageAuthorEnumTypeTransformer().decode(value);

  static List<MessageAuthorEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MessageAuthorEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MessageAuthorEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MessageAuthorEnum] to String,
/// and [decode] dynamic data back to [MessageAuthorEnum].
class MessageAuthorEnumTypeTransformer {
  factory MessageAuthorEnumTypeTransformer() => _instance ??= const MessageAuthorEnumTypeTransformer._();

  const MessageAuthorEnumTypeTransformer._();

  String encode(MessageAuthorEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MessageAuthorEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MessageAuthorEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'user': return MessageAuthorEnum.user;
        case r'system': return MessageAuthorEnum.system;
        case r'ai': return MessageAuthorEnum.ai;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MessageAuthorEnumTypeTransformer] instance.
  static MessageAuthorEnumTypeTransformer? _instance;
}


