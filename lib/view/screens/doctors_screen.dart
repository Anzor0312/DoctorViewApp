import 'package:doctorapp/core/widgets/doctors_list_widget.dart';
import 'package:doctorapp/data/model/doctors_model.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  final List<Doctors> doctors;
  const DoctorsScreen({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Hero(tag: "topDoctors", child: Text("Top Doctors")),
        ),
        body: DoctorsListWidget(doctors: doctors));
  }
}
