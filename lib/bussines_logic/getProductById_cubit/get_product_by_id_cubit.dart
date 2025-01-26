import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repo/getallproduct_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_product_by_id_state.dart';

class GetProductByIdCubit extends Cubit<GetProductById_State> {
  GetProductByIdCubit() : super(GetProductById_State.initial());
  var rr;

  Future getproductbyId(int id)async{
    emit(state.copyWith(getProductById_Status: GetProductById_Status.loading));
    try{
      rr=await GetProductById_Repo.getproductbyId(id);
      emit(state.copyWith(getProductById_Status: GetProductById_Status.success));
    }catch (e){
      emit(state.copyWith(getProductById_Status: GetProductById_Status.failure));
    }

  }
}
