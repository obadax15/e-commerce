import 'package:bloc/bloc.dart';
import 'package:ecommerce/constances/role.dart';
import 'package:ecommerce/constances/token.dart';
import 'package:ecommerce/data/repo/register_repo.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<Register_State> {
  RegisterCubit() : super(Register_State.initial());

  Future register(String name, String address, String phoneNumber, String email, String role, String password,
      String confirmPassword) async {
    emit(state.copyWith(register_status: Register_Status.loading));
    try {
var rr=await Register_Repo.register(name, address, phoneNumber, email, role, password, confirmPassword);
Token.token=rr['token'];

Role.role=role;

emit(state.copyWith(register_status: Register_Status.success));
    } catch (e) {
      emit(state.copyWith(register_status: Register_Status.failure));
    }
  }
}
