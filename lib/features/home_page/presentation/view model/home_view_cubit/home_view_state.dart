
abstract class HomeViewState {}

class HomeViewInitial extends HomeViewState {}
class HomeViewSuccess extends HomeViewState {}
class HomeViewFailure extends HomeViewState {
  final String errorMessage;
  HomeViewFailure(this.errorMessage);
}