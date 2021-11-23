part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemSuccess extends ItemState {
  final List<ItemModel> items;

  ItemSuccess(this.items);

  @override
  // TODO: implement props
  List<Object> get props => items;
}

class ItemFailed extends ItemState {}
