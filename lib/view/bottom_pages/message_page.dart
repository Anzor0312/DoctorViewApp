import 'package:doctorapp/core/extension/build_context_ext.dart';
import 'package:doctorapp/cubit/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
        builder: (BuildContext context, HomeStates state) {
      return Scaffold(
         backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: SvgPicture.asset("assets/add.svg"),
                  ),
                )
              ],
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                "My Appointments",
                style: TextStyle(color: Color(0xff027C90)),
              ),
            ),
          body:Column(
            children: [
               Row(
                children: [
                  Expanded(
                    flex: 12,
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(
                            0xffEEF4F4,
                          ),
                          hintText: "Search",
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Expanded(
                      flex: 2, child: SvgPicture.asset("assets/filtr.svg")),
                ],
              ),
             Expanded(
                  flex: 8,
                  child: Builder(builder: (context) {
                    if (state is HomeLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is HomeErrorState) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else if (state is HomeSuccessfulState) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.14,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffD9D9D9))),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Center(
                                      child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        "https://source.unsplash.com/random/?$index"),
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Image(
                                    image: AssetImage("assets/line.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: context.width * 0.05,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data.doctors![index].name
                                              .toString(),
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          state.data.doctors![index].special
                                              .toString(),
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: state.data.doctors!.length,
                      );
                    } else {
                      return const SizedBox();
                    }
                  }))
            ],
          ) );
    });
  }
}
