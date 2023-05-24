part of 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState()){
    getDoctorsData();
  }

  // instance
  DoctorsService doctorsService = DoctorsService();

  Future<void> getDoctorsData() async {
    emit(HomeLoadingState());
    await doctorsService.getDoctorsData().then((NetworkResponse response) {
      if (response is NetworkSucceedResponse<DoctorsModel>) {
        emit(HomeSuccessfulState(data: response.data));
      } else if (response is NetworkHttpErrorResponse) {
        emit(HomeErrorState(error: response.error));
      } else if (response is NetworkExceptionResponse) {
        emit(HomeErrorState(error: response.exception));
      }
    });
  }
}
