import 'dart:math';

import 'package:flutter/material.dart';

class InfoKaltimPage extends StatefulWidget {
  const InfoKaltimPage({super.key});

  @override
  State<InfoKaltimPage> createState() => _InfoKaltimPageState();
}

class _InfoKaltimPageState extends State<InfoKaltimPage> {
  final List<_InfoKaltimModel> _infoKaltimModels = [
    _InfoKaltimModel(title: 'Info Lowongan Pekerjaan', assetUrl: 'assets/beranda/lowongan.png',  onTap: () {}),
    _InfoKaltimModel(title: 'Info\nPelatihan', assetUrl: 'assets/beranda/training.png', onTap: () {}),
    _InfoKaltimModel(title: 'Info UMKM', assetUrl: 'assets/beranda/umkm.png', onTap: () {}),
    _InfoKaltimModel(title: 'Info Wisata', assetUrl: 'assets/beranda/wisata.png', onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF95C7DF),
      appBar: AppBar(
        title: const Text('Info Kaltim',
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
                itemCount: _infoKaltimModels.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16,),
                itemBuilder: (BuildContext context, int index) {
                  return _InfoKaltimCard(model: _infoKaltimModels[index],);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InfoKaltimModel {
  String title;
  String assetUrl;
  void Function() onTap;

  _InfoKaltimModel({
    required this.title,
    required this.assetUrl,
    required this.onTap
  });
}

class _InfoKaltimCard extends StatelessWidget {
  final _InfoKaltimModel model;
  const _InfoKaltimCard({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Color(0xFF02517C)
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 8,),
                  Image.asset(model.assetUrl, height: 125, fit: BoxFit.fitHeight,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32),
                  ),

                  const SizedBox(height: 4,),
                  FilledButton(
                      onPressed: model.onTap,
                      style: FilledButton.styleFrom(
                          backgroundColor: Color(0xFFEAB203)
                      ),
                      child: Text('Cek di sini >', style: TextStyle(color: Colors.black),)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
