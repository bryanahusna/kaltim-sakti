import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0ECF5),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: const Color(0xFF02517C),
        toolbarHeight: MediaQuery.of(context).size.height * 0.24,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    'assets/logo_sakti_2.png',
                    height: 60,
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Satu Akses \nKalimantan Timur',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/illustration_beranda.png',
              height: MediaQuery.of(context).size.height * 0.24,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Layanan di SAKTI',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFF113273)),
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildGridItem(
                    context,
                    'LaporGub',
                    'assets/logo_laporgub.png',
                    () => context.goNamed('lapor_gub_page')),
                _buildGridItem(
                    context,
                    'Darurat',
                    'assets/logo_darurat.png',
                    () => context.goNamed('darurat_page')),
                _buildGridItem(
                    context,
                    'Info Kaltim',
                    'assets/logo_info_kaltim.png',
                    () => context.goNamed('info_kaltim_page')),
                _buildGridItem(
                    context,
                    'Urus Izin',
                    'assets/logo_urus_izin.png',
                    () => context.goNamed('urus_izin_page')),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(16),
              // padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF02517C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cari tahu tentang \nGRATISPOL!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFD701),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Cek di sini',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Image.asset(
                      'assets/illustration_beranda_2.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      BuildContext context, String title, String iconPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF113273),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
