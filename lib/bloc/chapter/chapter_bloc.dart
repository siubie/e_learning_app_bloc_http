import 'package:bloc/bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:e_learning/data/response/chapter_response/chapter_response.dart';
import 'package:meta/meta.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final ApiRepository apiRepository;
  ChapterBloc(this.apiRepository) : super(ChapterInitial()) {
    on<ChapterEvent>((event, emit) async {
      if (event is LoadChapter) {
        emit(ChapterInitial());
        //make the request to the api
        try {
          final chapterResponse =
              await apiRepository.getChapters(event.courseId);
          emit(ChapterLoaded(chapterResponse));
        } catch (e) {
          emit(ChapterError(e.toString()));
        }
      }
    });
  }
}
