import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_info.freezed.dart';
part 'service_info.g.dart';

@freezed
class ServiceInfo with _$ServiceInfo {
  const factory ServiceInfo({
    required int serviceId,
    required String name,
    String? baseUrl,
  }) = _ServiceInfo;

  factory ServiceInfo.fromJson(Map<String, dynamic> json) =>
      _$ServiceInfoFromJson(json);
}
