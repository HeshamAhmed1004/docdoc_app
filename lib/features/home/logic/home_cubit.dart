
import 'package:docdoc_app/core/helpers/extention.dart';
import 'package:docdoc_app/core/networking/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/specializations_response_model.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
List<SpecializationData?>? specializationList=[];
  void getSpecialization() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationList=specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        getDoctorsList(specializationId:specializationList?.first?.id);

        emit(HomeState.specializationSuccess(specializationList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) async {
    List<Doctors?>? doctorsList =
    getDoctorsListBySpecializationId(specializationId);
    if(!doctorsList.isNullOrEmpty()){
      emit(HomeState.doctorsSuccess(doctorsList));
    }else{
      emit(HomeState.doctorsError(ErrorHandler.handle("NO DOCTORS FOUND")));
    }
  }
  /// returns list of doctors based on specialization id
getDoctorsListBySpecializationId(specializationId)  {
    return specializationList?.firstWhere((specialization) => specialization?.id==specializationId)?.doctorsList;
  }

}
