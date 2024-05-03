import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:let_him_cook/screens/initial_screen/initial_screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://amhxayhdopoarwmvnpyn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFtaHhheWhkb3BvYXJ3bXZucHluIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ3NTc2NzEsImV4cCI6MjAzMDMzMzY3MX0.3KVOxbzLzIbQoH82maRa99IUwQQsecPzsbzmCToJBog',
  );

  runApp(const MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitialScreen(),
    );
  }
}
