import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymentService {
  StripePaymentService._();
  static final StripePaymentService instance = StripePaymentService._();

  final String baseUrl = 'http://192.168.100.224:3000';

  Future<void> makePayment({required int amount}) async {
    try {
      print('function triger');
      final response = await http.post(
        Uri.parse('$baseUrl/create-payment-intent'),
        body: jsonEncode({
          "amount": amount,
          "currency": "usd",
          "propertyId": "property_123",
          "userId": "user_456",
        }),
        headers: {"Content-Type": "application/json"},
      );
      print("📡 Status Code: ${response.statusCode}");
      print("📦 Response Body: ${response.body}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        final clientSecret = data['clientSecret'];
        final paymentIntentId = data['paymentIntentId'];

        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: "Real Estate App",
          ),
        );

        await Stripe.instance.presentPaymentSheet();

        print("Payment confirmed: $paymentIntentId");
      }
    } on StripeException catch (e) {
      print("Payment cancelled: ${e.error.localizedMessage}");
    } catch (e) {
      print("Payment failed: $e");
    }
  }

  Future<void> saveCard(String customerId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/create-setup-intent'),
        body: jsonEncode({'customerId': customerId}),
        headers: {"Content-Type": "application/json"},
      );

      final data = jsonDecode(response.body);
      final clientSecret = data['clientSecret'];

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: clientSecret,
          merchantDisplayName: 'Real State App',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> fetchCards(String customerId) async {
    try {
      final response =await http.post(Uri.parse('$baseUrl/list-payment-methods'),
       body: jsonEncode({
        'customerId': customerId
       }), 
         headers: {"Content-Type": "application/json"},
      ) ;

        return   jsonDecode( response.body ) ; 
     
    } catch( e) {
      print (e) ;
      return [];
    }
  }

  Future<void> chargeCard(String customerId, int amount) async {
  await http.post(
    Uri.parse("$baseUrl/charge-default-card"),
    body: jsonEncode({
      "customerId": customerId,
      "amount": amount
    }),
    headers: {"Content-Type": "application/json"},
  );
} 


}
