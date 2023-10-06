import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'issue_detail_state.dart';

class IssueDetailCubit extends Cubit<IssueDetailState> {
  IssueDetailCubit() : super(ListInitialState(imageList: const []));

  int selectedPayment = 0;
  XFile? image;
  List list = [];
  String selectedDropValue = '';

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
      debugPrint('Failed to pick image: $e');
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
      debugPrint('Failed to pick image: $e');
    }
  }

  void removeItemsFrOmList(int index){
    list.removeAt(index);
    emit(RemoveListItemState(removeImageList: list));
  }

  void selecteCoutry(value){
    selectedDropValue = value;
    emit(SelecteCountryState(country: value));
  }
}
