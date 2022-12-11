// import 'package:start_in_mobile/pages/shop/screens/form.dart';
import 'package:start_in_mobile/models/alamat.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/shop/screens/forms.dart';
import 'package:start_in_mobile/pages/shop/screens/done.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, required item});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final item;
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Address'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: Address.addressList.map((address) {
            return InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DoneOrder(
                                title: '',
                              )));
                },
                child: ListTile(
                  title: Text(
                      '${address.street}, ${address.city}, ${address.province}, ${address.postal}'),
                ));
          }).toList(),
        ),
      ),
      bottomSheet: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const FormPage()));
              },
              child: const Text(
                'Add New Address',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Back"),
          )
        ],
      ),
    );
  }
}
