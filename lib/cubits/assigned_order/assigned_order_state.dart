part of 'assigned_order_cubit.dart';

@immutable
abstract class AssignedOrderState {}

// class AssignedOrderInitial extends AssignedOrderState {}

class FilterAppliedState extends AssignedOrderState{
  final int selectedFilter;

  FilterAppliedState({required this.selectedFilter});
}

class DateSelectedState extends AssignedOrderState{
  final bool isDateSelected;

  DateSelectedState({required this.isDateSelected});
}