import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'completed_order_state.dart';

class CompletedOrderCubit extends Cubit<CompletedOrderState> {
  CompletedOrderCubit() : super(FilterAppliedForCompletedOrderState(selectedFilter: 0));

    List timeList = ['Today','Yesterday','Last 7 days','Custom'];
  int selectedTime = 0;
  String selectedDate = '';
  TextEditingController toDate = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  bool isCustomDateSelected = false;

  applyFilter(int value){
    selectedTime = value;
    emit(FilterAppliedForCompletedOrderState(selectedFilter: selectedTime));
  }

  void openDatePicker(context)async{
    emit(DateSelectedForCompletedOrderState(isDateSelected: isCustomDateSelected));
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:DateTime(2000), 
      lastDate: DateTime(2101),
    );
    DateTime fromDateValue = DateTime.now();
    toDate.text = '${pickedDate!.day.toString()}/${pickedDate.month.toString()}/${pickedDate.year.toString()}';
    fromDate.text = '${fromDateValue.day.toString()}/${fromDateValue.month.toString()}/${fromDateValue.year.toString()}';

    debugPrint('selected date is--->${toDate.value.text}');
  }
}
