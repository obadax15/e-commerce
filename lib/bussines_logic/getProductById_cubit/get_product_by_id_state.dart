part of 'get_product_by_id_cubit.dart';

enum GetProductById_Status{loading,success,failure,initial}

class GetProductById_State extends Equatable{
  final GetProductById_Status getProductById_Status;

  GetProductById_State({required this.getProductById_Status});
  factory GetProductById_State.initial()=>GetProductById_State(getProductById_Status: GetProductById_Status.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [getProductById_Status];


  GetProductById_State copyWith({GetProductById_Status?getProductById_Status}){
    return GetProductById_State(getProductById_Status: getProductById_Status??this.getProductById_Status);

  }
}

