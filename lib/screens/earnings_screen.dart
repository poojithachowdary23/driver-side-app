import 'package:flutter/material.dart';
import 'package:untitled/screens/vehicle_screen.dart';


class EarningsScreen extends StatefulWidget {
  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  final TextEditingController locationController =
  TextEditingController(text: "Bangalore");
  final TextEditingController referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLocationEntered = locationController.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top AppBar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFA500), Color(0xFFFF7A00)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo & Text
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.black, size: 28),
                      SizedBox(width: 6),
                      Text(
                        'CONNEKT',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '2PARK',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // Help Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Row(
                      children: [
                        Text("Help"),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Emoji image
            Center(
              child: Column(
                children: const [
                  Text("💰", style: TextStyle(fontSize: 60)),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Earn with Connekt2Park',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Decide when, where, and how you want to earn.',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 20),

            // Location Field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Where would you like to earn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),

            // Referral Field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Referral code (optional)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: referralController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Disclaimer
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'By proceeding, I agree that Connekt2Park or its representatives may contact me by email, phone, or SMS (including by automatic telephone dialing system) at the email address or number I provide, including for marketing purposes.',
                style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.4),
              ),
            ),

            const Spacer(),

            // Continue Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: isLocationEntered
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleScreen(),
                    ),
                  );
                }
                    : null,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: isLocationEntered
                        ? const LinearGradient(
                      colors: [Color(0xFFFFA14B), Color(0xFFFF7A00)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                        : null,
                    color: isLocationEntered ? null : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: isLocationEntered
                        ? [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.4),
                        offset: const Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ]
                        : [],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: isLocationEntered ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
