import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_with_api/screens/home/states.dart';

import 'model.dart';

class JobCubit extends Cubit<JobStates> {
  JobCubit() : super(JobInitialState());

  JobDetailsModel? model;

  static JobCubit getObject(context) => BlocProvider.of(context);

  Future<void> getJobDetails() async {
    emit(GetJobLoadingState());
    final response = await Dio()
        .get('https://george-22084-default-rtdb.firebaseio.com/.json');
    if (response.statusCode != 500 && response.statusCode != 404) {
      emit(GetJobSuccessState());
      model = JobDetailsModel.fromJson(response.data);
    } else {
      emit(GetJobFailedState());
    }
  }
}
