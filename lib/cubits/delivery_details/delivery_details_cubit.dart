import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'delivery_details_state.dart';


class DeliveryDetailsCubit extends Cubit<DeliveryDetailsState> {
  DeliveryDetailsCubit() : super(ListInitialState(imageList: []));
  int selectedPayment = 0;
  XFile? image;
  List list = [];

  Future pickImage() async {
    // list.clear();
    // Navigator.of(context).pop();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      final imageTemp = XFile(image!.path);
      this.image = imageTemp;
      list.add(image.path);
      emit(ListAddItemState(imageList: list));
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future takeImage() async {
    // list.clear();
    // Navigator.of(context).pop();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      final imageTemp = XFile(image!.path);
      this.image = imageTemp;
      list.add(image.path);
      emit(ListAddItemState(imageList: list));
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  void removeItemsFrOmList(int index){
    list.removeAt(index);
    emit(RemoveListItemState(imageList: list));
  }

  void changePaymentMethod(int val){
    selectedPayment = val;
  }
}
