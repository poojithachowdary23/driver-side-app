import 'package:flutter/material.dart';


class DriverEarningsScreen extends StatelessWidget {
  const DriverEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4F1),
      body: SafeArea(
        child: Column(
          children: [
            // Header with navigation icon
            Container(
              width: double.infinity,
              color: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Earnings',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.history, color: Colors.white),
                    tooltip: "Order History",
                    onPressed: () {
                      Navigator.pushNamed(context, '/orderHistory');
                    },
                  ),
                ],
              ),
            ),

            // Wallet Balance
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Wallet Balance',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 4),
                      Text('\$76.23',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/orderHistory');
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    child: const Text('WITHDRAW',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            // Week Summary
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'Sep 17–25',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '\$1725.03',
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Bar Chart
                  SizedBox(
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBar(day: 'S', value: 80),
                        _buildBar(day: 'M', value: 40),
                        _buildBar(day: 'T', value: 90),
                        _buildBar(day: 'W', value: 30, showLabel: true),
                        _buildBar(day: 'T', value: 60),
                        _buildBar(day: 'F', value: 70),
                        _buildBar(day: 'S', value: 95),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Trip Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _StatsItem(label: "Total Trips", value: "170"),
                      _StatsItem(label: "Time Online", value: "7d 19ht"),
                      _StatsItem(label: "Total Distance", value: "79km"),
                    ],
                  )
                ],
              ),
            ),

            // Earnings Breakdown
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Earnings', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('\$1725.03',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Trip Earnings', style: TextStyle(color: Colors.grey)),
                      Text('\$1622.89', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Taxes', style: TextStyle(color: Colors.grey)),
                      Text('\$99.90', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(
      {required String day, required double value, bool showLabel = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showLabel)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Day 7\n\$179.03',
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        Container(
          width: 16,
          height: value,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _StatsItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatsItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
