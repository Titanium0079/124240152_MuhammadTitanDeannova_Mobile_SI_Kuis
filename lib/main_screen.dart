import 'package:flutter/material.dart';

import 'home.dart';
import 'profil.dart';

// StatefulWidget digunakan untuk merekam posisi indeks tab yang sedang aktif
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Variabel untuk menyimpan indeks halaman yang sedang aktif (0 = Menu, 1 = Profil)
  int _currentIndex = 0;

  // Fungsi untuk mengganti posisi tab saat diklik
  void _onItemTapped(int index) {
    setState(() {
      //setState memicu perombakan UI (rebuild) saat variable _currentIndex berubah
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Daftar halaman yang akan ditampilkan sesuai urutan tab
    final List<Widget> pages = [
      HomePage(
        // Menggunakan HomePage (bukan Home)
        onRefresh: () {
          // Fungsi setState kosong memicu perombakan UI agar angka total harga terbaru langsung tampil
          setState(() {});
        },
      ),
      const ProfilePage(),
    ];

    return Scaffold(
      // Menampilkan halaman sesuai dengan indeks aktif saat ini
      body: pages[_currentIndex],

      // BottomNavigationBar: Navigasi bagian bawah layar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped, // Menjalankan fungsi saat ikon di klik
        selectedItemColor: Colors.red, // Warna ikon yang sedang aktif
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
