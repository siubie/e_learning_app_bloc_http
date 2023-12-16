import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
            // create text field for identifier
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Identifier',
              ),
            ),
            //add space between text fields
            const SizedBox(height: 10),
            //create text field for password
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
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
                onPressed: () {},
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
