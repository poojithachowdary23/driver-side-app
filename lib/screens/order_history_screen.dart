import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  Widget buildOrderCard({required bool isActive, VoidCallback? onTap}) {
    final card = Card(
      elevation: isActive ? 4 : 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_pin, color: Colors.teal),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "456 Elim Street, Springfield",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "\$12",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "739 Main Street, Springfield",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  "12km",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // If onTap is provided, wrap with GestureDetector
    return onTap != null ? GestureDetector(onTap: onTap, child: card) : card;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("History", style: TextStyle(color: Colors.grey)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFF7A00),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "History",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Showing all your order history",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Active orders",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                buildOrderCard(
                  isActive: true,
                  onTap: () {
                    Navigator.pushNamed(context, '/orderDetails');
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  "Post orders",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.orange),
                ),
                buildOrderCard(isActive: false),
                buildOrderCard(isActive: false),
                buildOrderCard(isActive: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
