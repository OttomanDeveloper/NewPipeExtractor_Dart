// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YoutubeComment _$YoutubeCommentFromJson(Map<String, dynamic> json) {
  return _YoutubeComment.fromJson(json);
}

/// @nodoc
mixin _$YoutubeComment {
  String? get author => throw _privateConstructorUsedError;
  String? get commentText => throw _privateConstructorUsedError;
  String? get uploadDate => throw _privateConstructorUsedError;
  List<String> get uploaderAvatars => throw _privateConstructorUsedError;
  String? get uploaderUrl => throw _privateConstructorUsedError;
  String? get commentId => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  bool get hearted => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  int get replyCount => throw _privateConstructorUsedError;
  bool get isChannelOwner => throw _privateConstructorUsedError;
  bool get isUploaderVerified => throw _privateConstructorUsedError;

  /// Timestamp in the video this comment references, in seconds. Null if not a timestamped comment.
  int? get streamPosition => throw _privateConstructorUsedError;

  /// Serializes this YoutubeComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YoutubeComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YoutubeCommentCopyWith<YoutubeComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeCommentCopyWith<$Res> {
  factory $YoutubeCommentCopyWith(
          YoutubeComment value, $Res Function(YoutubeComment) then) =
      _$YoutubeCommentCopyWithImpl<$Res, YoutubeComment>;
  @useResult
  $Res call(
      {String? author,
      String? commentText,
      String? uploadDate,
      List<String> uploaderAvatars,
      String? uploaderUrl,
      String? commentId,
      int? likeCount,
      bool hearted,
      bool pinned,
      int replyCount,
      bool isChannelOwner,
      bool isUploaderVerified,
      int? streamPosition});
}

/// @nodoc
class _$YoutubeCommentCopyWithImpl<$Res, $Val extends YoutubeComment>
    implements $YoutubeCommentCopyWith<$Res> {
  _$YoutubeCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubeComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? commentText = freezed,
    Object? uploadDate = freezed,
    Object? uploaderAvatars = null,
    Object? uploaderUrl = freezed,
    Object? commentId = freezed,
    Object? likeCount = freezed,
    Object? hearted = null,
    Object? pinned = null,
    Object? replyCount = null,
    Object? isChannelOwner = null,
    Object? isUploaderVerified = null,
    Object? streamPosition = freezed,
  }) {
    return _then(_value.copyWith(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      commentText: freezed == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadDate: freezed == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderAvatars: null == uploaderAvatars
          ? _value.uploaderAvatars
          : uploaderAvatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uploaderUrl: freezed == uploaderUrl
          ? _value.uploaderUrl
          : uploaderUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hearted: null == hearted
          ? _value.hearted
          : hearted // ignore: cast_nullable_to_non_nullable
              as bool,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      isChannelOwner: null == isChannelOwner
          ? _value.isChannelOwner
          : isChannelOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploaderVerified: null == isUploaderVerified
          ? _value.isUploaderVerified
          : isUploaderVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      streamPosition: freezed == streamPosition
          ? _value.streamPosition
          : streamPosition // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YoutubeCommentImplCopyWith<$Res>
    implements $YoutubeCommentCopyWith<$Res> {
  factory _$$YoutubeCommentImplCopyWith(_$YoutubeCommentImpl value,
          $Res Function(_$YoutubeCommentImpl) then) =
      __$$YoutubeCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? author,
      String? commentText,
      String? uploadDate,
      List<String> uploaderAvatars,
      String? uploaderUrl,
      String? commentId,
      int? likeCount,
      bool hearted,
      bool pinned,
      int replyCount,
      bool isChannelOwner,
      bool isUploaderVerified,
      int? streamPosition});
}

/// @nodoc
class __$$YoutubeCommentImplCopyWithImpl<$Res>
    extends _$YoutubeCommentCopyWithImpl<$Res, _$YoutubeCommentImpl>
    implements _$$YoutubeCommentImplCopyWith<$Res> {
  __$$YoutubeCommentImplCopyWithImpl(
      _$YoutubeCommentImpl _value, $Res Function(_$YoutubeCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? commentText = freezed,
    Object? uploadDate = freezed,
    Object? uploaderAvatars = null,
    Object? uploaderUrl = freezed,
    Object? commentId = freezed,
    Object? likeCount = freezed,
    Object? hearted = null,
    Object? pinned = null,
    Object? replyCount = null,
    Object? isChannelOwner = null,
    Object? isUploaderVerified = null,
    Object? streamPosition = freezed,
  }) {
    return _then(_$YoutubeCommentImpl(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      commentText: freezed == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadDate: freezed == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as String?,
      uploaderAvatars: null == uploaderAvatars
          ? _value._uploaderAvatars
          : uploaderAvatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uploaderUrl: freezed == uploaderUrl
          ? _value.uploaderUrl
          : uploaderUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hearted: null == hearted
          ? _value.hearted
          : hearted // ignore: cast_nullable_to_non_nullable
              as bool,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      isChannelOwner: null == isChannelOwner
          ? _value.isChannelOwner
          : isChannelOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploaderVerified: null == isUploaderVerified
          ? _value.isUploaderVerified
          : isUploaderVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      streamPosition: freezed == streamPosition
          ? _value.streamPosition
          : streamPosition // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubeCommentImpl implements _YoutubeComment {
  const _$YoutubeCommentImpl(
      {this.author,
      this.commentText,
      this.uploadDate,
      final List<String> uploaderAvatars = const [],
      this.uploaderUrl,
      this.commentId,
      this.likeCount,
      this.hearted = false,
      this.pinned = false,
      this.replyCount = 0,
      this.isChannelOwner = false,
      this.isUploaderVerified = false,
      this.streamPosition})
      : _uploaderAvatars = uploaderAvatars;

  factory _$YoutubeCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubeCommentImplFromJson(json);

  @override
  final String? author;
  @override
  final String? commentText;
  @override
  final String? uploadDate;
  final List<String> _uploaderAvatars;
  @override
  @JsonKey()
  List<String> get uploaderAvatars {
    if (_uploaderAvatars is EqualUnmodifiableListView) return _uploaderAvatars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploaderAvatars);
  }

  @override
  final String? uploaderUrl;
  @override
  final String? commentId;
  @override
  final int? likeCount;
  @override
  @JsonKey()
  final bool hearted;
  @override
  @JsonKey()
  final bool pinned;
  @override
  @JsonKey()
  final int replyCount;
  @override
  @JsonKey()
  final bool isChannelOwner;
  @override
  @JsonKey()
  final bool isUploaderVerified;

  /// Timestamp in the video this comment references, in seconds. Null if not a timestamped comment.
  @override
  final int? streamPosition;

  @override
  String toString() {
    return 'YoutubeComment(author: $author, commentText: $commentText, uploadDate: $uploadDate, uploaderAvatars: $uploaderAvatars, uploaderUrl: $uploaderUrl, commentId: $commentId, likeCount: $likeCount, hearted: $hearted, pinned: $pinned, replyCount: $replyCount, isChannelOwner: $isChannelOwner, isUploaderVerified: $isUploaderVerified, streamPosition: $streamPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeCommentImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.commentText, commentText) ||
                other.commentText == commentText) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            const DeepCollectionEquality()
                .equals(other._uploaderAvatars, _uploaderAvatars) &&
            (identical(other.uploaderUrl, uploaderUrl) ||
                other.uploaderUrl == uploaderUrl) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.hearted, hearted) || other.hearted == hearted) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.isChannelOwner, isChannelOwner) ||
                other.isChannelOwner == isChannelOwner) &&
            (identical(other.isUploaderVerified, isUploaderVerified) ||
                other.isUploaderVerified == isUploaderVerified) &&
            (identical(other.streamPosition, streamPosition) ||
                other.streamPosition == streamPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      author,
      commentText,
      uploadDate,
      const DeepCollectionEquality().hash(_uploaderAvatars),
      uploaderUrl,
      commentId,
      likeCount,
      hearted,
      pinned,
      replyCount,
      isChannelOwner,
      isUploaderVerified,
      streamPosition);

  /// Create a copy of YoutubeComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeCommentImplCopyWith<_$YoutubeCommentImpl> get copyWith =>
      __$$YoutubeCommentImplCopyWithImpl<_$YoutubeCommentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubeCommentImplToJson(
      this,
    );
  }
}

abstract class _YoutubeComment implements YoutubeComment {
  const factory _YoutubeComment(
      {final String? author,
      final String? commentText,
      final String? uploadDate,
      final List<String> uploaderAvatars,
      final String? uploaderUrl,
      final String? commentId,
      final int? likeCount,
      final bool hearted,
      final bool pinned,
      final int replyCount,
      final bool isChannelOwner,
      final bool isUploaderVerified,
      final int? streamPosition}) = _$YoutubeCommentImpl;

  factory _YoutubeComment.fromJson(Map<String, dynamic> json) =
      _$YoutubeCommentImpl.fromJson;

  @override
  String? get author;
  @override
  String? get commentText;
  @override
  String? get uploadDate;
  @override
  List<String> get uploaderAvatars;
  @override
  String? get uploaderUrl;
  @override
  String? get commentId;
  @override
  int? get likeCount;
  @override
  bool get hearted;
  @override
  bool get pinned;
  @override
  int get replyCount;
  @override
  bool get isChannelOwner;
  @override
  bool get isUploaderVerified;

  /// Timestamp in the video this comment references, in seconds. Null if not a timestamped comment.
  @override
  int? get streamPosition;

  /// Create a copy of YoutubeComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YoutubeCommentImplCopyWith<_$YoutubeCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
