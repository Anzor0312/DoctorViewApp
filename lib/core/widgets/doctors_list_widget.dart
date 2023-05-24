import 'package:doctorapp/core/extension/build_context_ext.dart';
import 'package:doctorapp/data/model/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsListWidget extends StatelessWidget {
  final List<Doctors> doctors;
  const DoctorsListWidget({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.01,
              vertical: context.height * 0.01),
          child: Container(
            height: context.height * 0.17,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 170, 170, 170)),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://source.unsplash.com/random/?$index"),
                ),
                SizedBox(
                    width: context.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          doctors[index].name.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${doctors[index].special.toString()}-${doctors[index].current.toString()}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    )),
                SizedBox(
                  child: SvgPicture.asset('assets/favorite.svg'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
