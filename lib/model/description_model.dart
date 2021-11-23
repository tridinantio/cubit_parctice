import 'package:equatable/equatable.dart';

class DescriptionModel extends Equatable {
  String description;
  DescriptionModel({this.description = 'Enter Descripption'});

  @override
  // TODO: implement props
  List<Object?> get props => [description];
}
