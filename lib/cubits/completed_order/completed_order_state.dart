part of 'completed_order_cubit.dart';

@immutable
abstract class CompletedOrderState {}

class FilterAppliedForCompletedOrderState extends CompletedOrderState{
  final int selectedFilter;

  FilterAppliedForCompletedOrderState({required this.selectedFilter});
}

class DateSelectedForCompletedOrderState extends CompletedOrderState{
  final bool isDateSelected;

  DateSelectedForCompletedOrderState({required this.isDateSelected});
}
