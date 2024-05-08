# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://petstore3.swagger.io/api/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**postChat**](ChatApi.md#postchat) | **POST** /chat | Posts a Chat


# **postChat**
> Message postChat(message)

Posts a Chat

Posts a Chat

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final message = Message(); // Message | Chat

try {
    final result = api_instance.postChat(message);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->postChat: $e\n');
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

 - **Content-Type**: application/json, application/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, application/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

