import 'package:firebase/stripe/service/payment_service.dart';
import 'package:flutter/material.dart';



class StripeScreen extends StatefulWidget {
  const StripeScreen({super.key});

  @override
  State<StripeScreen> createState() => _StripeScreenState();
}

class _StripeScreenState extends State<StripeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stripe Payment'), centerTitle: true),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
              ),
              onPressed: () {
                StripePaymentService.instance.makePayment(amount: 1000);
              },
              child: Text('Purchase', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
