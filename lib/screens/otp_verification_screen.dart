import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'driver_earnings_screen.dart'; // Make sure this file exists

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String otp = "";
  int secondsRemaining = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _verifyOtp() {
    // You can add actual verification logic here
    print("Entered OTP: $otp");
    if (otp.length == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DriverEarningsScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 4-digit OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                color: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                width: double.infinity,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                ),
              ),
              const SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange,
                child: Image.asset(
                  'assets/images/email_icon.png',
                  height: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Verification CODE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please type the verification code\nsent to +91 8431155756",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {
                  setState(() => otp = value);
                },
                textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeColor: Colors.orange,
                  selectedColor: Colors.orange,
                  inactiveColor: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "00:${secondsRemaining.toString().padLeft(2, '0')}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
