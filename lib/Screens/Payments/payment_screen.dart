import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod;
  String? _selectedMonth;
  String? _selectedYear;
  bool _cvvHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Payment Method',
                border: OutlineInputBorder(),
              ),
              items: ['Credit Card', 'Debit Card', 'UPI', 'Wallet', 'Cash on Delivery']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                });
              },
              value: _selectedPaymentMethod,
            ),
            SizedBox(height: 20),
            if (_selectedPaymentMethod == 'Credit Card' || _selectedPaymentMethod == 'Debit Card') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Expiry Month',
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'))
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMonth = newValue;
                        });
                      },
                      value: _selectedMonth,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Expiry Year',
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(10, (index) => (DateTime.now().year + index).toString())
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedYear = newValue;
                        });
                      },
                      value: _selectedYear,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_cvvHidden ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _cvvHidden = !_cvvHidden;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.number,
                obscureText: _cvvHidden, // Ensure CVV is hidden by default
              ),
            ] else if (_selectedPaymentMethod == 'UPI') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'UPI ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ] else if (_selectedPaymentMethod == 'Wallet') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Wallet ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic here
                // Ensure payment occurs only after customer acceptance
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}