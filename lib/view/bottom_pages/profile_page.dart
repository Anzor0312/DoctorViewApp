import 'package:doctorapp/core/extension/build_context_ext.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Profile Settings",
          style: TextStyle(color: Color(0xff027C90)),
        ),
      ),
      body: Column(
        children: [
          Container(
              height: context.height * 0.17,
              width: double.infinity,
              color: const Color(0xffD6EAED),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.add),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
