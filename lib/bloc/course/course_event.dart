part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

//add event for course load
final class GetCourse extends CourseEvent {}
