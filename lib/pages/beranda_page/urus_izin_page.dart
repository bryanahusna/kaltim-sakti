import 'dart:math';

import 'package:flutter/material.dart';

class UrusIzinPage extends StatefulWidget {
  const UrusIzinPage({super.key});

  @override
  State<UrusIzinPage> createState() => _UrusIzinPageState();
}

class _UrusIzinPageState extends State<UrusIzinPage> {
  final List<_IzinModel> _izinModels = [
    _IzinModel(title: 'Perizinan Usaha', description: 'Izin Mendirikan Bangunan (IMB)\nIzin Lokasi', onTap: () {}),
    _IzinModel(title: 'Layanan Sosial dan Kesehatan', description: 'Pengurusan Bantuan Sosial\nKartu Sehat', onTap: () {}),
    _IzinModel(title: 'Layanan Kependudukan', description: 'Pembuatan KTP\nPembuatan KK', onTap: () {}),
    _IzinModel(title: 'Layanan Perpajakan', description: 'Pengurusan NPWP\nPembayaran Pajak Daerah', onTap: () {}),
    _IzinModel(title: 'Layanan Pertanahan', description: 'Sertifikasi Tanah\nHak Guna Tanah', onTap: () {}),
    _IzinModel(title: 'Layanan Pendidikan', description: 'Pendaftaran Bantuan Pendidikan\nIzin Pembangunan Sekolah', onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF95C7DF),
      appBar: AppBar(
        title: const Text('Urus Izin',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF02517C),
        // change color of back button
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: _izinModels.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16,),
                itemBuilder: (BuildContext context, int index) {
                  return _IzinCard(izinModel: _izinModels[index],);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IzinModel {
  String title;
  String description;
  void Function() onTap;
  
  _IzinModel({
    required this.title,
    required this.description,
    required this.onTap
  });
}

class _IzinCard extends StatelessWidget {
  final _IzinModel izinModel;
  const _IzinCard({
    super.key,
    required this.izinModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color(0xFF02517C)
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 32,),
                  Transform.rotate(
                    angle: -pi / 6,
                    child: Image.asset('assets/beranda/to-do-list.png', height: 100,),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    izinModel.title,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32),
                ),
                const SizedBox(height: 4,),
                Text(
                    izinModel.description,
                    style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4,),
                FilledButton(
                    onPressed: izinModel.onTap,
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFFEAB203)
                    ),
                    child: Text('Cek di sini >', style: TextStyle(color: Colors.black),)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
