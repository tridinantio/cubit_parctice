import 'package:bloc/bloc.dart';
import 'package:cubit_practice/model/item_Model.dart';
import 'package:cubit_practice/services/image_service.dart';
import 'package:equatable/equatable.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());

  void fetchItem() async {
    try {
      emit(ItemLoading());
      List<ItemModel> items = await ImageService().fetchItem();

      emit(ItemSuccess(items));
    } catch (e) {}
  }
}
