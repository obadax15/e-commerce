import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repo/get_fav_repo.dart';
import 'package:equatable/equatable.dart';

part 'add_fav_state.dart';

class AddFavCubit extends Cubit<AddFavState> {
  AddFavCubit() : super(AddFavState.initial());

  Future addproducttofav(String id)async{
    emit(state.copyWith(addFavStatus: AddFavStatus.loading));
    try{
      var ff= await GetFavRepo.addproducttofav(id);
      emit(state.copyWith(addFavStatus: AddFavStatus.success));

    }catch(e){emit(state.copyWith(addFavStatus: AddFavStatus.failure));}

  }
}
