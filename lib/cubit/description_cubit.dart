import 'package:bloc/bloc.dart';
import 'package:cubit_practice/model/description_model.dart';
import 'package:equatable/equatable.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  DescriptionCubit() : super(DescriptionInitial());

  void saveDescription(String text) async {
    try {
      emit(DescriptionLoading());
      DescriptionModel description = await DescriptionModel(description: text);

      print(description.description);
      emit(DescriptionSuccess(description));
    } catch (e) {
      throw e;
    }
  }
}
