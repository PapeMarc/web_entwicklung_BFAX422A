# openapi.model.ChatRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**model** | **String** |  | [optional] 
**messages** | [**List<Message>**](Message.md) |  | [optional] [default to const []]
**frequencyPenalty** | **num** |  | [optional] 
**logitBias** | [**Object**](.md) |  | [optional] 
**logprobs** | **bool** |  | [optional] 
**topLogprobs** | **int** |  | [optional] 
**maxTokens** | **int** |  | [optional] 
**n** | **int** |  | [optional] 
**presencePenalty** | **num** |  | [optional] 
**responseFormat** | [**Object**](.md) |  | [optional] 
**seed** | **int** |  | [optional] 
**stop** | **String** |  | [optional] 
**stream** | **bool** |  | [optional] 
**streamOptions** | [**Object**](.md) |  | [optional] 
**temperature** | **num** |  | [optional] 
**topP** | **num** |  | [optional] 
**tools** | **List<String>** |  | [optional] [default to const []]
**toolsChoice** | [**Object**](.md) |  | [optional] 
**user** | **String** |  | [optional] 
**functionCall** | [**Object**](.md) |  | [optional] 
**functions** | **List<String>** |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


