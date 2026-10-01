import 'package:flutter/material.dart';

import '../models/stationery_item.dart';

class DetailPage extends StatefulWidget {
  final StationeryItem stationeryItem;

  const DetailPage({super.key, required this.stationeryItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Controller terpisah untuk stok dan deskripsi
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    // Mengisi nilai awal masing-masing controller
    _stockController = TextEditingController(
      text: widget.stationeryItem.stock.toString(),
    );
    _priceController = TextEditingController(
      text: widget.stationeryItem.price.toString(),
    );
    _descriptionController = TextEditingController(
      text: widget.stationeryItem.description,
    );
  }

  @override
  void dispose() {
    _stockController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Alat Tulis',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.stationeryItem.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.stationeryItem.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Harga: Rp ${widget.stationeryItem.formattedPrice} / item',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 1. TextField untuk Mengubah Deskripsi
                  TextField(
                    controller: _descriptionController,
                    maxLines:
                        3, // Agar teks deskripsi yang panjang muat dengan rapi
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Deskripsi Produk',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2. TextField untuk Mengubah Stok / Jumlah
                  TextField(
                    controller: _stockController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock Tersedia',
                      prefixIcon: Icon(Icons.inventory),
                    ),
                  ),

                  const SizedBox(height: 16),
                  // 3. Menampilkan Total Harga Berdasarkan Stok

                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Harga Produk',
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // BottomNavigationBar untuk tombol simpan
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            // Konversi teks stok ke angka integer
            int newQuantity = int.tryParse(_stockController.text) ?? 0;
            if (newQuantity < 0) newQuantity = 0;

            // Simpan perubahan ke objek model
            widget.stationeryItem.stock = newQuantity;
            widget.stationeryItem.description = _descriptionController.text;
            widget.stationeryItem.price =
                int.tryParse(_priceController.text) ?? 0;
            // Menutup halaman detail dan kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
          child: const Text(
            'Simpan Perubahan',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
