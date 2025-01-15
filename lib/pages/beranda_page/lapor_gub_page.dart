import 'package:flutter/material.dart';

class LaporGubPage extends StatefulWidget {
  const LaporGubPage({super.key});

  @override
  State<LaporGubPage> createState() => _LaporGubPageState();
}

class _LaporGubPageState extends State<LaporGubPage> {
  final List<Map<String, String>> _reports = [
    {
      'status': 'MENUNGGU',
      'title': 'Orang Hilang',
      'description':
          'Usia 8 tahun, rambut cepak, terakhir menggunakan baju biru, celana hitam pendek.',
      'location': 'KUTAI BARAT',
      'time': '3 jam lalu',
      'image': 'assets/lapor-gub-image/orang_hilang.jpg',
    },
    {
      'status': 'SELESAI',
      'title': 'Kekerasan',
      'description':
          'Tolong segera ditindak, tetangga saya dipukuli pak, warga sudah coba memediasi.',
      'location': 'SAMARINDA',
      'time': '1 hari lalu',
      'image': 'assets/lapor-gub-image/kekerasan.webp',
    },
    {
      'status': 'MENUNGGU',
      'title': 'Pohon Tumbang',
      'description': 'Pohon tumbang di jalan utama menuju Balikpapan.',
      'location': 'BALIKPAPAN',
      'time': '2 jam lalu',
      'image': 'assets/lapor-gub-image/pohon_tumbang.jpeg',
    },
  ];

  String _searchQuery = '';

  List<Map<String, String>> get _filteredReports {
    if (_searchQuery.isEmpty) {
      return _reports;
    }
    return _reports
        .where((report) =>
            report['title']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            report['description']!
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0ECF5),
      appBar: AppBar(
        title: const Text(
          'LaporGub',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF02517C),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari Laporan',
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
          Expanded(
            child: ListView.builder(
              itemCount: _filteredReports.length,
              itemBuilder: (context, index) {
                final report = _filteredReports[index];
                final isWaiting = report['status'] == 'MENUNGGU';
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              child: Image.asset(
                                report['image']!,
                                width: 120,
                                height: 135,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 32,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: isWaiting ? Color(0xFFCC4F2D) : Colors.green,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(14),
                                ),
                              ),
                              child: Text(
                                report['status']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  report['title']!.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: isWaiting ? Color(0xFFCC4F2D) : Colors.green,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  report['description']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  report['location']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  report['time']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
