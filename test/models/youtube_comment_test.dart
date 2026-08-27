import 'package:flutter_test/flutter_test.dart';
import 'package:newpipeextractor_dart/newpipeextractor_dart.dart';

void main() {
  group('YoutubeComment.isEdited', () {
    test('defaults to false for backward-compatible construction', () {
      const comment = YoutubeComment();

      expect(comment.isEdited, isFalse);
    });

    test('round-trips edited state through JSON', () {
      const comment = YoutubeComment(
        commentId: 'comment-1',
        commentText: 'Updated comment',
        isEdited: true,
      );

      final restored = YoutubeComment.fromJson(comment.toJson());

      expect(restored, equals(comment));
      expect(restored.isEdited, isTrue);
    });
  });
}
