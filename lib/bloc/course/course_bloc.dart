import 'package:bloc/bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:e_learning/data/response/course_response/course_response.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final ApiRepository apiRepository;
  CourseBloc(this.apiRepository) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetCourse) {
        emit(CourseInitial());
        //add try catch block
        try {
          final courseResponse = await apiRepository.getCourses();
          //get course response from api
          emit(
            CourseLoaded(courseResponse: courseResponse),
          );
        } catch (e) {
          //return the error message
          emit(CourseFailed(message: 'Failed to load courses'));
        }
      }
    });
  }
}
