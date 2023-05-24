import 'package:doctorapp/core/extension/build_context_ext.dart';
import 'package:doctorapp/cubit/home/home_states.dart';
import 'package:doctorapp/view/screens/search_delegater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: const Text(
              "Home",
              style: TextStyle(color: Color(0xff027C90)),
            ),
            backgroundColor: Colors.white,
            actions: [
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: SvgPicture.asset('assets/notification.svg'),
                    ),
                    InkWell(
                      onTap: () {
                        // navigation to Favorite Page
                        Navigator.pushNamed(context, 'favorite');
                      },
                      child: SizedBox(
                        child: SvgPicture.asset('assets/favorite.svg'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: Builder(
            builder: (context) {
              if (state is HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is HomeSuccessfulState) {
                return RefreshIndicator(
                  onRefresh: context.read<HomeCubit>().getDoctorsData,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: context.height * 0.03,
                              horizontal: context.width * 0.035),
                          child: SizedBox(
                            width: double.infinity,
                            height: context.height * 0.07,
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                showSearch(
                                    context: context,
                                    delegate: MySearchDelegater(doctors: state.data.doctors!),
                                    query: "Dr. ");
                              },
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.search),
                                  hintText: "Search for doctors",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          )),
                      // Specialist Doctors line
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.02,
                            horizontal: context.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Hero(
                              tag: "specialist",
                              child: Text(
                                "Specialist Doctor",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  // navigation to Specialists Page
                                  Navigator.pushNamed(context, 'specialist',
                                      arguments: state.data.specialists!);
                                },
                                child: const Text(
                                  "See all",
                                  style: TextStyle(color: Color(0xff027C90)),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width * 0.025),
                        child: SizedBox(
                          width: double.infinity,
                          height: context.height * 0.25,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.data.specialists!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.width * 0.025),
                                child: Container(
                                  width: 105,
                                  decoration: BoxDecoration(
                                      color: Color(int.parse(state
                                          .data.specialists![index].color
                                          .toString())),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    state.data.specialists![index].name
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.02,
                            horizontal: context.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Hero(
                              transitionOnUserGestures: true,
                              tag: "topDoctors",
                              child: Text(
                                "Top Doctors",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  // navigation to Top Doctors Page
                                  Navigator.pushNamed(context, 'topDoctors',
                                      arguments: state.data.doctors!);
                                },
                                child: const Text(
                                  "See all",
                                  style: TextStyle(color: Color(0xff027C90)),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width * 0.025),
                        child: SizedBox(
                          width: double.infinity,
                          height: context.height * 0.25,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.data.doctors!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.width * 0.025),
                                child: Container(
                                  width: 105,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.5,
                                          color: const Color(0xffE5E5E5)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    state.data.doctors![index].name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
