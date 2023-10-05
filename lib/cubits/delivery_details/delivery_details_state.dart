part of 'delivery_details_cubit.dart';

@immutable
abstract class DeliveryDetailsState {}

class ListInitialState extends DeliveryDetailsState{
  final List imageList;

  ListInitialState({required this.imageList});
}

class ListAddItemState extends DeliveryDetailsState{
  final List imageList;

  ListAddItemState({required this.imageList});
}

class RemoveListItemState extends DeliveryDetailsState{
  final List removeItemList;

  RemoveListItemState({required this.removeItemList});
}