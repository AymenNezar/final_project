abstract class LayoutStates{}

class LayoutInitial extends LayoutStates{}

class GetDataSuccess extends LayoutStates{}
class GetDataFailed extends LayoutStates{
  String message;
  GetDataFailed({required this.message});
}
class GetDataLoading extends LayoutStates{}

class ChangePassLoading extends LayoutStates{}
class ChangePassSuccess extends LayoutStates{}
class ChangePassFailed extends LayoutStates{
  String error;
  ChangePassFailed(this.error);
}
