import 'package:doctorapp/core/extension/build_context_ext.dart';
import 'package:doctorapp/data/model/doctors_model.dart';
import 'package:flutter/material.dart';

class SpecialistsScreen extends StatelessWidget {
  final List<Specialists> specialists;
  const SpecialistsScreen({super.key, required this.specialists});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
            transitionOnUserGestures: true,
            tag: "specialist",
            child: Text("Specialist Doctor")),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: specialists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.025,
                vertical: context.height * 0.01),
            child: Container(
              width: 105,
              decoration: BoxDecoration(
                  color: Color(int.parse(specialists[index].color.toString())),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                specialists[index].name.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
