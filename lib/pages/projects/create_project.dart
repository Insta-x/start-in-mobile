import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/queries/projects/create_project.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final _createProjectFormKey = GlobalKey<FormState>();

  String title = '';
  String description = '';
  int donationTarget = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
        backgroundColor: Color.fromARGB(255, 10, 13, 170),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _createProjectFormKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.title),
                    labelText: 'Title',
                    hintText: "Title",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    title = value!;
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    title = value!;
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 14,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    icon: Icon(Icons.description),
                    labelText: 'Description',
                    hintText: "Description",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    description = value!;
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    description = value!;
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Description tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 14,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Donation Target',
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
                    if (int.tryParse(value!) != null) {
                      donationTarget = int.parse(value);
                    }
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    if (int.tryParse(value!) != null) {
                      donationTarget = int.parse(value);
                    }
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
                      if (_createProjectFormKey.currentState!.validate()) {
                        await createProject(
                                request, title, description, donationTarget)
                            .then((value) => Navigator.pop(context));
                      }
                    },
                    child: const Text(
                      "Create",
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
