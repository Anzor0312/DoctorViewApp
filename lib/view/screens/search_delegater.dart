import 'package:doctorapp/core/widgets/doctors_list_widget.dart';
import 'package:doctorapp/data/model/doctors_model.dart';
import 'package:flutter/material.dart';

class MySearchDelegater extends SearchDelegate {
  final List<Doctors> doctors;
  MySearchDelegater({required this.doctors});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "search result");
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Doctors> results = doctors.where((element) {
      return element.name
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
    return DoctorsListWidget(doctors: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Doctors> suggestions = doctors.where((element) {
      return element.name
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
    return DoctorsListWidget(doctors: suggestions);
  }
}
