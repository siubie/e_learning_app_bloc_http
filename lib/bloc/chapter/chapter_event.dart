part of 'chapter_bloc.dart';

@immutable
sealed class ChapterEvent {}

//add event to load chapter by course id
final class LoadChapter extends ChapterEvent {
  final int courseId;
  LoadChapter(this.courseId);
}
