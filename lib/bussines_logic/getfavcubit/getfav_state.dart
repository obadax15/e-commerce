part of 'getfav_cubit.dart';

enum GetFavStatus { loading, success, failure, initial }

class GetFavState  extends Equatable{
  final GetFavStatus getFavStatus;

  GetFavState({required this.getFavStatus});

  factory GetFavState.initial()=>GetFavState(getFavStatus: GetFavStatus.initial);

  @override
  // TODO: implement props
  List<Object?> get props =>[getFavStatus];
  GetFavState copyWith({GetFavStatus?getFavStatus}){
    return GetFavState(getFavStatus: getFavStatus??this.getFavStatus);
  }
}
