import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/queries/projects/donate_project.dart';
import 'package:start_in_mobile/queries/projects/edit_project.dart';
import 'package:start_in_mobile/queries/projects/fetch_projects.dart';

class EditProjectPage extends StatefulWidget {
  final int projectId;
  const EditProjectPage({super.key, required this.projectId});

  @override
  State<EditProjectPage> createState() => _EditProjectPageState();
}

class _EditProjectPageState extends State<EditProjectPage> {
  final _editProjectFormKey = GlobalKey<FormState>();

  String title = '';
  String description = '';
  int donationTarget = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<Project>(
        future: fetchProject(request, widget.projectId),
        builder: (BuildContext context, AsyncSnapshot<Project> snapshot) {
          if (snapshot.hasData) {
            title = snapshot.data!.title;
            description = snapshot.data!.description;
            donationTarget = snapshot.data!.donationTarget;

            return Form(
              key: _editProjectFormKey,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        initialValue: snapshot.data!.title,
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
                        initialValue: snapshot.data!.description,
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
                        initialValue: snapshot.data!.donationTarget.toString(),
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () async {
                            if (_editProjectFormKey.currentState!.validate()) {
                              await editProject(request, widget.projectId,
                                      title, description, donationTarget)
                                  .then((value) => Navigator.pop(context));
                            }
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Retrieving Data...'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
