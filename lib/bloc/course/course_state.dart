part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

//add state for course loaded
final class CourseLoaded extends CourseState {
  final CourseResponse courseResponse;

  CourseLoaded({required this.courseResponse});
}

//add state for course failed
final class CourseFailed extends CourseState {
  final String message;

  CourseFailed({required this.message});
}
