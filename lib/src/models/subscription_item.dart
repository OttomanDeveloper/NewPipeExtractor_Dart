import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_item.freezed.dart';
part 'subscription_item.g.dart';

/// A single subscribed channel/artist extracted from a public subscription list
/// or an imported export file.
@freezed
class SubscriptionItem with _$SubscriptionItem {
  const factory SubscriptionItem({
    required int serviceId,
    String? url,
    String? name,
  }) = _SubscriptionItem;

  factory SubscriptionItem.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionItemFromJson(json);
}
