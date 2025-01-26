import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repo/getall_category_repo.dart';
import 'package:equatable/equatable.dart';

part 'getall_category_state.dart';

class GetallCategoryCubit extends Cubit<GetallCategoryState> {
  GetallCategoryCubit() : super(GetallCategoryState.initial());
  var getcategory;
  Future getallcategory()async{
    emit(state.copyWith(getallCategoryStatus: GetallCategoryStatus.loading));

    try{
      getcategory=await GetAllCategory_Repo.getallcategory();
      print(getcategory);
      emit(state.copyWith(getallCategoryStatus: GetallCategoryStatus.success));

    }catch (e){
      emit(state.copyWith(getallCategoryStatus: GetallCategoryStatus.failure));
    }
  }

}
