import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/queries/projects/donate_project.dart';

class DonateProjectPage extends StatefulWidget {
  final int projectId;
  const DonateProjectPage({super.key, required this.projectId});

  @override
  State<DonateProjectPage> createState() => _DonateProjectPageState();
}

class _DonateProjectPageState extends State<DonateProjectPage> {
  final _donateProjectFormKey = GlobalKey<FormState>();

  int nominal = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
        backgroundColor: Color.fromARGB(255, 10, 13, 170),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _donateProjectFormKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Donation Amount',
                    hintText: "Nominal",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      if (int.tryParse(value!) != null) {
                        nominal = int.parse(value);
                      }
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      if (int.tryParse(value!) != null) {
                        nominal = int.parse(value);
                      }
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong!';
                    } else if (int.tryParse(value) == null) {
                      return 'Nominal harus berupa angka!';
                    } else if (int.tryParse(value)! < 1) {
                      return 'Nominal harus positif!';
                    }
                    return null;
                  },
                ),
                Center(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () async {
                      if (_donateProjectFormKey.currentState!.validate()) {
                        await donateProject(request, widget.projectId, nominal)
                            .then((value) => Navigator.pop(context));
                      }
                    },
                    child: const Text(
                      "Donate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
