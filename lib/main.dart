import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() {
  runApp(const RestoApp());
}

class RestoApp extends StatelessWidget {
  const RestoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Kuis Alat Tulis 124240152',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red, // Warna utama aplikasi
        scaffoldBackgroundColor:
            Colors.grey[100], // Warna dasar latar belakang seluruh layar
      ),
      // Menentukan layar pertama yang akan dibuka saat aplikasi dinyalakan
      home: const MainScreen(),
    );
  }
}
