import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Clinic App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/patient_details': (context) => PatientDetailsScreen(),
      },
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
              child: Text('Login'),
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
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Medical Clinic App'),
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
              child: Text('View Patient Details'),
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
            Text('Patient Name: amr mohamed'),
            Text(' '),
            Text('Phone number: 012003930'),
            Text(' '),
            Text('Email: amr@gmail.com'),
            Text(' '),
            Text('Address: Moasuora'),
            Text(' '),
            Text('Doctor name: khaled mokhtar'),
            Text(' '),
            Text('Age: 35 years'),
            Text(' '),
            Text('Diagnosis: Sample diagnosis text'),
            // Add more patient details as needed
          ],
        ),
      ),
    );
  }
}
