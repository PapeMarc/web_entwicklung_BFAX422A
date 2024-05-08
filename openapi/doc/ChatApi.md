# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**chat**](ChatApi.md#chat) | **POST** /chat | Message conversation with ChatGPT.


# **chat**
> Message chat(message)

Message conversation with ChatGPT.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final message = Message(); // Message | Chat

try {
    final result = api_instance.chat(message);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->chat: $e\n');
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

