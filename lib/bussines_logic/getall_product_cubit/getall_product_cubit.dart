import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repo/getallproduct_repo.dart';
import 'package:equatable/equatable.dart';

part 'getall_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit() : super(GetAllProductState.initial());
  var getproduct;
  Future getallproduct()async{
    emit(state.copyWith(getallProductStatus: GetallProductStatus.loading));

    try{
      getproduct=await GetAllProduct_Repo.getallproduct();
      print(getproduct);
      emit(state.copyWith(getallProductStatus: GetallProductStatus.success));

    }catch (e){
      emit(state.copyWith(getallProductStatus: GetallProductStatus.failure));
    }
  }

}