import 'package:bloc/bloc.dart';
import 'package:ecommerce/constances/role.dart';
import 'package:ecommerce/constances/token.dart';
import 'package:ecommerce/data/repo/login_repo.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LogIn_State> {
  LoginCubit() : super(LogIn_State.initial());

  Future login(String email,String password)async{
    emit(state.copyWith(logIn_Status: LogIn_Status.loading));

    try{
      var rr= await LogIn_Repo.login(email, password);

      Token.token=await rr? ['token'];
      Role.role=await rr?['user']['role'];
      emit(state.copyWith(logIn_Status: LogIn_Status.success));

      print(Token.token);
    }catch(e){
      emit(state.copyWith(logIn_Status: LogIn_Status.failure));}
  }
}
