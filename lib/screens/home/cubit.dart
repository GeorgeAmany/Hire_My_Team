import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_with_api/screens/home/states.dart';

class JobCubit extends Cubit<JobStates>{
  JobCubit(): super ( JobInitialState());
  
}