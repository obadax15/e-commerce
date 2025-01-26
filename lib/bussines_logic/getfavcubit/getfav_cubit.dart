import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repo/get_fav_repo.dart';
import 'package:equatable/equatable.dart';

part 'getfav_state.dart';

class GetfavCubit extends Cubit<GetFavState> {
  GetfavCubit() : super(GetFavState.initial());
  var getallfav;
  Future getfav ()async{
    emit(state.copyWith(getFavStatus: GetFavStatus.loading));
    try{
      getallfav=await GetFavRepo.getfav();
      print(getallfav);
      emit(state.copyWith(getFavStatus: GetFavStatus.success));

    }catch(e){emit(state.copyWith(getFavStatus: GetFavStatus.failure));}

  }

}
