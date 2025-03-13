abstract class HomeState {}

class HomeInitState extends HomeState {
  final List<Map<String, dynamic>> allEntries;
  HomeInitState(this.allEntries);
}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Map<String, dynamic>> allEntries;
  HomeSuccessState(this.allEntries);
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.message);
  final String message;
}
