// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionItemImpl _$$SubscriptionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionItemImpl(
      serviceId: (json['serviceId'] as num).toInt(),
      url: json['url'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$SubscriptionItemImplToJson(
        _$SubscriptionItemImpl instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'url': instance.url,
      'name': instance.name,
    };
