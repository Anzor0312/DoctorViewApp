import 'package:doctorapp/core/extension/build_context_ext.dart';
import 'package:doctorapp/cubit/appointments/appointments_states.dart';
import 'package:doctorapp/cubit/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsCubit(),
      child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
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
            body: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.height * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<AppointmentsCubit>()
                                .upcomingCondition();
                          },
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: Color(0xff027C90), width: 1.5),
                              elevation: 0,
                              shape: const StadiumBorder(),
                              backgroundColor:
                                  context.watch<AppointmentsCubit>().condition
                                      ? const Color(0xffD6EAED)
                                      : const Color(0xff027C90),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.16,
                                  vertical: 15)),
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                              color: context
                                          .watch<AppointmentsCubit>()
                                          .condition ==
                                      false
                                  ? Colors.white
                                  : const Color(0xff027C90),
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            context.read<AppointmentsCubit>().pastCondition();
                          },
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: Color(0xff027C90), width: 1.5),
                              elevation: 0,
                              backgroundColor: context
                                          .watch<AppointmentsCubit>()
                                          .condition ==
                                      false
                                  ? const Color(0xffD6EAED)
                                  : const Color(0xff027C90),
                              shape: const StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.16,
                                  vertical: 15)),
                          child: Text(
                            "Past",
                            style: TextStyle(
                              color:
                                  context.watch<AppointmentsCubit>().condition
                                      ? Colors.white
                                      : const Color(0xff027C90),
                            ),
                          ))
                    ],
                  ),
                ),
                context.watch<AppointmentsCubit>().condition == false
                    ? const Upcoming()
                    : const PastWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}

class PastWidget extends StatelessWidget {
  const PastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
        builder: (BuildContext context, HomeStates state) {
      return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
      );
    });
  }
}

class Upcoming extends StatelessWidget {
  const Upcoming({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: context.height * 0.09),
          child: SvgPicture.asset("assets/smile.svg"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.15),
                child: const Text("You do not have an appointment"),
              ),
              SizedBox(
                width: double.infinity,
                height: context.height * 0.05,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<AppointmentsCubit>().pastCondition();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xff027C90),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Booking appointment now",
                        style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        )
      ],
    );
  }
}
