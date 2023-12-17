import 'package:e_learning/bloc/login/login_bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Container(
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
            const Spacer(),
            //add bloc builder to the login page
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                //check if the state is LoginSuccess
                if (state is LoginSuccess) {
                  //show the success message
                  return Column(
                    children: [
                      //add identifier
                      Text(
                        state.loginResponse.user!.username.toString(),
                      ),
                      Text(
                        state.loginResponse.jwt.toString(),
                      ),
                    ],
                  );
                }
                //check if the state is LoginFailed
                if (state is LoginFailed) {
                  //show the failed message
                  return Text(state.message);
                }
                //check if the state is LoginInProgress
                if (state is LoginInProgress) {
                  //show the progress indicator
                  return const CircularProgressIndicator();
                }
                //show empty text
                return const Text('');
              },
            ),
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
                  backgroundColor: Colors.green, // Change button color to green
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Change text color to white
                    fontSize: 20, // Set the desired font size
                    fontWeight: FontWeight.bold, // Set the font weight to bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
