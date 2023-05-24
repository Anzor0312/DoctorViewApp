import 'package:bloc/bloc.dart';
import 'package:doctorapp/core/config/network_config.dart';
import 'package:doctorapp/data/model/doctors_model.dart';
import 'package:doctorapp/data/service/doctors_service.dart';

part 'home_cubit.dart';

abstract class HomeStates {
  HomeStates();
}

class HomeInitState extends HomeStates {
  HomeInitState();
}

class HomeLoadingState extends HomeStates {
  HomeLoadingState();
}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState({required this.error});
}

class HomeSuccessfulState extends HomeStates {
  DoctorsModel data;
  HomeSuccessfulState({required this.data});
}
