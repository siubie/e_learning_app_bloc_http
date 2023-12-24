import 'package:e_learning/bloc/login/login_bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:e_learning/pages/authenticated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    //add bloc provider to the app
    BlocProvider(
      create: (context) => LoginBloc(
        ApiRepository(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/authenticated': (context) => const AuthenticatedPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //add text editing controller for identifier
  final TextEditingController _identifierController =
      TextEditingController(text: "admin");
  //add text editing controller for password
  final TextEditingController _passwordController =
      TextEditingController(text: "12345678");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          //add event listener for login state
          if (state is LoginSuccess) {
            //navigate to authenticated page
            Navigator.pushNamed(context, '/authenticated');
          } else if (state is LoginFailed) {
            //show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.all(8), // Set the desired margin value
          child: Column(
            //make the children to bottom
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //add title to the login page
              const Spacer(),
              Text(
                'Flutter E Learning App',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              //add space between title and text fields
              const SizedBox(height: 10),
              //add subtitle to the login page
              Text(
                'Playlist by dosenNgoding',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              //add bloc builder to show loading indicator
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginInProgress) {
                    return const CircularProgressIndicator();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const Spacer(),
              // add space between text fields and button
              const Spacer(),
              // create text field for identifier
              TextField(
                controller:
                    _identifierController, // Assign the controller property outside of the constant context
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Identifier',
                ),
              ),
              //add space between text fields
              const SizedBox(height: 10),
              //create text field for password
              TextField(
                //add controller to the text field
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              // add space between text fields and button
              const SizedBox(height: 10),
              //create button login
              SizedBox(
                width: double.infinity,
                height: 50, // Set the desired height value
                child: ElevatedButton(
                  onPressed: () {
                    //add event for login button pressed
                    context.read<LoginBloc>().add(
                          LoginButtonPressed(
                            _identifierController.text,
                            _passwordController.text,
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor:
                        Colors.green, // Change button color to green
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // Change text color to white
                      fontSize: 20, // Set the desired font size
                      fontWeight:
                          FontWeight.bold, // Set the font weight to bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
