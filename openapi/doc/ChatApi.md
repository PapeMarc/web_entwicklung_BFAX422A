# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**none**](ChatApi.md#none) | **POST** /chat | Message conversation with ChatGPT.


# **none**
> Message none(message)

Message conversation with ChatGPT.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final message = Message(); // Message | none

try {
    final result = api_instance.none(message);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->none: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **message** | [**Message**](Message.md)| none | 

### Return type

[**Message**](Message.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

