# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**chatCompletion**](ChatApi.md#chatcompletion) | **POST** /chat/completion | Chat completion based conversation with ChatGPT.
[**chatMessage**](ChatApi.md#chatmessage) | **POST** /chat/message | Message conversation with ChatGPT.


# **chatCompletion**
> MessageAndUsage chatCompletion(chat)

Chat completion based conversation with ChatGPT.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final chat = Chat(); // Chat | Request_Body

try {
    final result = api_instance.chatCompletion(chat);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->chatCompletion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chat** | [**Chat**](Chat.md)| Request_Body | 

### Return type

[**MessageAndUsage**](MessageAndUsage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatMessage**
> Message chatMessage(message)

Message conversation with ChatGPT.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final message = Message(); // Message | Chat

try {
    final result = api_instance.chatMessage(message);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->chatMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **message** | [**Message**](Message.md)| Chat | 

### Return type

[**Message**](Message.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

