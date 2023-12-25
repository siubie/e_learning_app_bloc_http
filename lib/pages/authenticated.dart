import 'package:e_learning/bloc/authenticated_page/authenticated_page_bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
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
        create: (context) => AuthenticatedPageBloc(
          ApiRepository(),
        )..add(GetToken()),
        child: BlocBuilder<AuthenticatedPageBloc, AuthenticatedPageState>(
          builder: (context, state) {
            if (state is AuthenticatedPageInitial) {
              return Container();
            } else if (state is AuthenticatedPageLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AuthenticatedPageSuccess) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is AuthenticatedPageFailed) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
