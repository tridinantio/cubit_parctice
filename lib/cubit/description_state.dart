part of 'description_cubit.dart';

abstract class DescriptionState extends Equatable {
  const DescriptionState();

  @override
  List<Object> get props => [];
}

class DescriptionLoading extends DescriptionState {}

class DescriptionInitial extends DescriptionState {
  DescriptionModel description =
      DescriptionModel(description: "Enter Description");

  @override
  // TODO: implement props
  List<Object> get props => [description];
}

class DescriptionSuccess extends DescriptionState {
  DescriptionModel description;

  DescriptionSuccess(this.description);

  @override
  // TODO: implement props
  List<Object> get props => [description];
}
