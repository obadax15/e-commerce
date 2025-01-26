part of 'login_cubit.dart';

enum LogIn_Status{loading,initial,failure,success}
class LogIn_State extends Equatable{

  final LogIn_Status logIn_Status;

  const LogIn_State({required this.logIn_Status});
  factory LogIn_State.initial()=>const LogIn_State(logIn_Status: LogIn_Status.initial);

  @override
  // TODO: implement props
  List<Object?> get props =>  [logIn_Status];
      LogIn_State copyWith({LogIn_Status? logIn_Status})=>LogIn_State(logIn_Status: logIn_Status??this.logIn_Status);
}
