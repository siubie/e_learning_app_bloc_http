part of 'chapter_bloc.dart';

@immutable
sealed class ChapterState {}

final class ChapterInitial extends ChapterState {}

//add state for loaded chapter
final class ChapterLoaded extends ChapterState {
  final ChapterResponse chapterResponse;

  ChapterLoaded(this.chapterResponse);
}

//add state for chapter error
final class ChapterError extends ChapterState {
  final String message;
  ChapterError(this.message);
}
