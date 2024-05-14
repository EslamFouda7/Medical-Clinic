import 'dart:async';

import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Clinic ',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(), // New route for splash screen
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/patient_details': (context) => PatientDetailsScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/'); // Navigate to login screen after 3 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/es2.png'), // Replace 'app_logo.png' with your logo asset
            SizedBox(height: 5,
            ),
            Text('Medical Clinic',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            ),
            SizedBox(height: 20
            ),
            CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Change color here
            ),
          ],
        ),
      ),
    );
  }
}



class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void attemptLogin(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    // Simulate login logic
    if (username == 'admin' && password == 'password') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please check username and password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => attemptLogin(context),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class HomeScreen extends StatelessWidget {
  void navigateToPatientDetails(BuildContext context) {
    Navigator.pushNamed(context, '/patient_details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("eslam fouda"),
              accountEmail: Text("eslam@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    'images/es1.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Patient Details'),
              onTap: () {
                Navigator.pushNamed(context, '/patient_details');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/'); 
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Medical Clinic App!'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => navigateToPatientDetails(context),
              child: Text('View Patient Details',
                style: TextStyle(
                color: Colors.white,
              ) ,
              ),
              style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Change color here
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('images/es1.jpg'),
            ),
            Text(' '),
            Text('Patient Name: eslam fouda'),
            Text(' '),
            Text('Phone number: 01029485081'),
            Text(' '),
            Text('Email: eslam@gmail.com'),
            Text(' '),
            Text('Address: Moasuora'),
            Text(' '),
            Text('Doctor name: khaled mokhtar'),
            Text(' '),
            Text('Age: 21 years'),
            Text(' '),
            Text('Diagnosis: Sample diagnosis text'),
            
          ],
        ),
      ),
    );
  }
}
