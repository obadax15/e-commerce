part of 'register_cubit.dart';
enum Register_Status{loading,initial,failure,success}
class Register_State extends Equatable{
final Register_Status register_status;

    Register_State({required this.register_status});
factory Register_State.initial()=> Register_State(register_status: Register_Status.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [register_status];
  Register_State copyWith({Register_Status?register_status})=>Register_State(register_status: register_status??this.register_status);

}
