import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repo/getallproduct_repo.dart';
import 'package:equatable/equatable.dart';

part 'getproductbycat_state.dart';

class GetproductbycatCubit extends Cubit<GetProductByCatState> {
  GetproductbycatCubit() : super(GetProductByCatState.initial());
  var getprodcat;

  Future getproductbycategory(int id)async{
    emit(state.copyWith(getProductByCatStatus: GetProductByCatStatus.loading));
    try{
      getprodcat=await GetProductByCategory_Repo.getproductbycategory(id);
      emit(state.copyWith(getProductByCatStatus: GetProductByCatStatus.success));

    }catch(e){
      emit(state.copyWith(getProductByCatStatus: GetProductByCatStatus.failure));
    }

  }
}
