import 'package:freezed_annotation/freezed_annotation.dart';
part 'frameset.freezed.dart';
part 'frameset.g.dart';

@freezed
class Frameset with _$Frameset {
  const factory Frameset({
    @Default([]) List<String> urls,
    @Default(0) int width,
    @Default(0) int height,
    @Default(0) int totalCount,
  }) = _Frameset;

  factory Frameset.fromJson(Map<String, dynamic> json) =>
      _$FramesetFromJson(json);
}
