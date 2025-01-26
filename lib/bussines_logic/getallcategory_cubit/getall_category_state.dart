part of 'getall_category_cubit.dart';

enum GetallCategoryStatus{loading,initial,success,failure}

class GetallCategoryState extends Equatable{
  final GetallCategoryStatus getallCategoryStatus;

  GetallCategoryState({required this.getallCategoryStatus});
factory GetallCategoryState.initial()=>GetallCategoryState(getallCategoryStatus: GetallCategoryStatus.initial);

  @override

  // TODO: implement props
  List<Object?> get props =>  [getallCategoryStatus];

GetallCategoryState copyWith({GetallCategoryStatus? getallCategoryStatus}){
  return GetallCategoryState(getallCategoryStatus: getallCategoryStatus??this.getallCategoryStatus);

}

}