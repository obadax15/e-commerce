part of 'getproductbycat_cubit.dart';

enum GetProductByCatStatus{loading,failure,success,initial}
class GetProductByCatState extends Equatable{
  final GetProductByCatStatus getProductByCatStatus;

  GetProductByCatState({required this.getProductByCatStatus});
factory GetProductByCatState.initial()=>GetProductByCatState(getProductByCatStatus: GetProductByCatStatus.initial);
  @override
  // TODO: implement props
  List<Object?> get props => [getProductByCatStatus];
  GetProductByCatState copyWith({GetProductByCatStatus?getProductByCatStatus}){
    return GetProductByCatState(getProductByCatStatus: getProductByCatStatus??this.getProductByCatStatus);

  }
}