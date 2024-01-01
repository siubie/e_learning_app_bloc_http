import 'package:e_learning/bloc/chapter/chapter_bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseListPage extends StatelessWidget {
  final int? courseId;
  const CourseListPage({Key? key, this.courseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChapterBloc(
        ApiRepository(),
      )..add(
          LoadChapter(courseId!),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Course Detail'),
        ),
        body: BlocBuilder<ChapterBloc, ChapterState>(
          builder: (context, state) {
            if (state is ChapterInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ChapterError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontSize: 24),
                ),
              );
            }
            if (state is ChapterLoaded) {
              final chapter = state.chapterResponse.data;
              return ListView.builder(
                itemCount: chapter?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(chapter![index].attributes?.title ?? ''),
                  );
                },
              );
            }
            return Center(
              child: Text(
                'Course Id Nomor : $courseId',
                style: const TextStyle(fontSize: 24),
              ),
            );
          },
        ),
      ),
    );
  }
}
