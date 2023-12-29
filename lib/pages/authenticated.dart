import 'package:e_learning/bloc/authenticated_page/authenticated_page_bloc.dart';
import 'package:e_learning/bloc/course/course_bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:e_learning/pages/course_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticatedPage extends StatelessWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticated Page'),
      ),
      body: BlocProvider(
          create: (context) => CourseBloc(
                ApiRepository(),
              )..add(
                  GetCourse(),
                ),
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CourseLoaded) {
                final courses = state.courseResponse.data;
                //return list view builder with the course response
                return ListView.builder(
                  itemCount: courses?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseListPage(courseId: courses?[index].id),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          courses?[index].attributes?.name ?? '',
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is CourseFailed) {
                return Center(
                  child: Text(state.message),
                );
              }
              return Container();
            },
          )),
    );
  }
}
