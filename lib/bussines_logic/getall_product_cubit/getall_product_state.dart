part of 'getall_product_cubit.dart';


enum GetallProductStatus{loading,initial,success,failure}

class GetAllProductState extends Equatable{
  final GetallProductStatus getallProductStatus;

  GetAllProductState({required this.getallProductStatus});
  factory GetAllProductState.initial()=>GetAllProductState(getallProductStatus: GetallProductStatus.initial);

  @override

  // TODO: implement props
  List<Object?> get props =>  [getallProductStatus];

  GetAllProductState copyWith({GetallProductStatus? getallProductStatus}){
    return GetAllProductState(getallProductStatus: getallProductStatus??this.getallProductStatus);

  }

}