part of 'issue_detail_cubit.dart';

@immutable
abstract class IssueDetailState {}

class ListInitialState extends IssueDetailState{
  final List imageList;

  ListInitialState({required this.imageList});
}

class ListAddItemState extends IssueDetailState{
  final List imageList;

  ListAddItemState({required this.imageList});
}

class RemoveListItemState extends IssueDetailState{
  final List removeImageList;

  RemoveListItemState({required this.removeImageList});
}

class SelecteCountryState extends IssueDetailState{
  final String country;

  SelecteCountryState({required this.country});
}
