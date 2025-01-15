import 'package:flutter/material.dart';

class DaruratPage extends StatefulWidget {
  const DaruratPage({super.key});

  @override
  State<DaruratPage> createState() => _DaruratPageState();
}

class _DaruratPageState extends State<DaruratPage> {
  String _selectedEmergency = "ambulance";

  void _onEmergencySelected(String type) {
    setState(() {
      _selectedEmergency = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0ECF5),
      appBar: AppBar(
        title: const Text('Darurat',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF02517C),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.44, // Sesuaikan tinggi grid
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildEmergencyButton(
                    context,
                    'TIM SAR',
                    'assets/logo_tim_sar',
                    'sar',
                  ),
                  _buildEmergencyButton(
                    context,
                    'AMBULAN',
                    'assets/logo_ambulan',
                    'ambulance',
                  ),
                  _buildEmergencyButton(
                    context,
                    'POLISI',
                    'assets/logo_polisi',
                    'police',
                  ),
                  _buildEmergencyButton(
                    context,
                    'DAMKAR',
                    'assets/logo_damkar',
                    'firetruck',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Lokasi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF113273)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Deskripsi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF113273)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color(0xFFF8BE2E),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'KIRIM PESAN DARURAT',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(
    BuildContext context,
    String title,
    String assetPath,
    String type,
  ) {
    final isSelected = _selectedEmergency == type;
    return GestureDetector(
      onTap: () => _onEmergencySelected(type),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF8BE2E) : Color(0xFF02517C),
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
          children: [
            // get color filter based on isSelected
            Image.asset(
              isSelected? '$assetPath.png' : '${assetPath}_bnw.png',
              height: MediaQuery.of(context).size.width * 0.2,
              // color: isSelected ? Colors.white : Colors.black,
            ),

            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
