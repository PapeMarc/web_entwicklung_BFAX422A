//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChatRequest {
  /// Returns a new [ChatRequest] instance.
  ChatRequest({
    this.model,
    this.messages = const [],
    this.frequencyPenalty,
    this.logitBias,
    this.logprobs,
    this.topLogprobs,
    this.maxTokens,
    this.n,
    this.presencePenalty,
    this.responseFormat,
    this.seed,
    this.stop,
    this.stream,
    this.streamOptions,
    this.temperature,
    this.topP,
    this.tools = const [],
    this.toolsChoice,
    this.user,
    this.functionCall,
    this.functions = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? model;

  List<Message> messages;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? frequencyPenalty;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? logitBias;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? logprobs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? topLogprobs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxTokens;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? n;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? presencePenalty;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? responseFormat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? seed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stop;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? stream;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? streamOptions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? temperature;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? topP;

  List<String> tools;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? toolsChoice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? functionCall;

  List<String> functions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChatRequest &&
    other.model == model &&
    _deepEquality.equals(other.messages, messages) &&
    other.frequencyPenalty == frequencyPenalty &&
    other.logitBias == logitBias &&
    other.logprobs == logprobs &&
    other.topLogprobs == topLogprobs &&
    other.maxTokens == maxTokens &&
    other.n == n &&
    other.presencePenalty == presencePenalty &&
    other.responseFormat == responseFormat &&
    other.seed == seed &&
    other.stop == stop &&
    other.stream == stream &&
    other.streamOptions == streamOptions &&
    other.temperature == temperature &&
    other.topP == topP &&
    _deepEquality.equals(other.tools, tools) &&
    other.toolsChoice == toolsChoice &&
    other.user == user &&
    other.functionCall == functionCall &&
    _deepEquality.equals(other.functions, functions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (model == null ? 0 : model!.hashCode) +
    (messages.hashCode) +
    (frequencyPenalty == null ? 0 : frequencyPenalty!.hashCode) +
    (logitBias == null ? 0 : logitBias!.hashCode) +
    (logprobs == null ? 0 : logprobs!.hashCode) +
    (topLogprobs == null ? 0 : topLogprobs!.hashCode) +
    (maxTokens == null ? 0 : maxTokens!.hashCode) +
    (n == null ? 0 : n!.hashCode) +
    (presencePenalty == null ? 0 : presencePenalty!.hashCode) +
    (responseFormat == null ? 0 : responseFormat!.hashCode) +
    (seed == null ? 0 : seed!.hashCode) +
    (stop == null ? 0 : stop!.hashCode) +
    (stream == null ? 0 : stream!.hashCode) +
    (streamOptions == null ? 0 : streamOptions!.hashCode) +
    (temperature == null ? 0 : temperature!.hashCode) +
    (topP == null ? 0 : topP!.hashCode) +
    (tools.hashCode) +
    (toolsChoice == null ? 0 : toolsChoice!.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (functionCall == null ? 0 : functionCall!.hashCode) +
    (functions.hashCode);

  @override
  String toString() => 'ChatRequest[model=$model, messages=$messages, frequencyPenalty=$frequencyPenalty, logitBias=$logitBias, logprobs=$logprobs, topLogprobs=$topLogprobs, maxTokens=$maxTokens, n=$n, presencePenalty=$presencePenalty, responseFormat=$responseFormat, seed=$seed, stop=$stop, stream=$stream, streamOptions=$streamOptions, temperature=$temperature, topP=$topP, tools=$tools, toolsChoice=$toolsChoice, user=$user, functionCall=$functionCall, functions=$functions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.model != null) {
      json[r'model'] = this.model;
    } else {
      json[r'model'] = null;
    }
      json[r'messages'] = this.messages;
    if (this.frequencyPenalty != null) {
      json[r'frequency_penalty'] = this.frequencyPenalty;
    } else {
      json[r'frequency_penalty'] = null;
    }
    if (this.logitBias != null) {
      json[r'logit_bias'] = this.logitBias;
    } else {
      json[r'logit_bias'] = null;
    }
    if (this.logprobs != null) {
      json[r'logprobs'] = this.logprobs;
    } else {
      json[r'logprobs'] = null;
    }
    if (this.topLogprobs != null) {
      json[r'top_logprobs'] = this.topLogprobs;
    } else {
      json[r'top_logprobs'] = null;
    }
    if (this.maxTokens != null) {
      json[r'max_tokens'] = this.maxTokens;
    } else {
      json[r'max_tokens'] = null;
    }
    if (this.n != null) {
      json[r'n'] = this.n;
    } else {
      json[r'n'] = null;
    }
    if (this.presencePenalty != null) {
      json[r'presence_penalty'] = this.presencePenalty;
    } else {
      json[r'presence_penalty'] = null;
    }
    if (this.responseFormat != null) {
      json[r'response_format'] = this.responseFormat;
    } else {
      json[r'response_format'] = null;
    }
    if (this.seed != null) {
      json[r'seed'] = this.seed;
    } else {
      json[r'seed'] = null;
    }
    if (this.stop != null) {
      json[r'stop'] = this.stop;
    } else {
      json[r'stop'] = null;
    }
    if (this.stream != null) {
      json[r'stream'] = this.stream;
    } else {
      json[r'stream'] = null;
    }
    if (this.streamOptions != null) {
      json[r'stream_options'] = this.streamOptions;
    } else {
      json[r'stream_options'] = null;
    }
    if (this.temperature != null) {
      json[r'temperature'] = this.temperature;
    } else {
      json[r'temperature'] = null;
    }
    if (this.topP != null) {
      json[r'top_p'] = this.topP;
    } else {
      json[r'top_p'] = null;
    }
      json[r'tools'] = this.tools;
    if (this.toolsChoice != null) {
      json[r'tools_choice'] = this.toolsChoice;
    } else {
      json[r'tools_choice'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.functionCall != null) {
      json[r'function_call'] = this.functionCall;
    } else {
      json[r'function_call'] = null;
    }
      json[r'functions'] = this.functions;
    return json;
  }

  /// Returns a new [ChatRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChatRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChatRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChatRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChatRequest(
        model: mapValueOfType<String>(json, r'model'),
        messages: Message.listFromJson(json[r'messages']),
        frequencyPenalty: num.parse('${json[r'frequency_penalty']}'),
        logitBias: mapValueOfType<Object>(json, r'logit_bias'),
        logprobs: mapValueOfType<bool>(json, r'logprobs'),
        topLogprobs: mapValueOfType<int>(json, r'top_logprobs'),
        maxTokens: mapValueOfType<int>(json, r'max_tokens'),
        n: mapValueOfType<int>(json, r'n'),
        presencePenalty: num.parse('${json[r'presence_penalty']}'),
        responseFormat: mapValueOfType<Object>(json, r'response_format'),
        seed: mapValueOfType<int>(json, r'seed'),
        stop: mapValueOfType<String>(json, r'stop'),
        stream: mapValueOfType<bool>(json, r'stream'),
        streamOptions: mapValueOfType<Object>(json, r'stream_options'),
        temperature: num.parse('${json[r'temperature']}'),
        topP: num.parse('${json[r'top_p']}'),
        tools: json[r'tools'] is Iterable
            ? (json[r'tools'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        toolsChoice: mapValueOfType<Object>(json, r'tools_choice'),
        user: mapValueOfType<String>(json, r'user'),
        functionCall: mapValueOfType<Object>(json, r'function_call'),
        functions: json[r'functions'] is Iterable
            ? (json[r'functions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ChatRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChatRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChatRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChatRequest> mapFromJson(dynamic json) {
    final map = <String, ChatRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChatRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChatRequest-objects as value to a dart map
  static Map<String, List<ChatRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChatRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChatRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

