part of 'add_fav_cubit.dart';

enum AddFavStatus { loading, failure, success, initial }

class AddFavState extends Equatable {
  final AddFavStatus addFavStatus;

  AddFavState({required this.addFavStatus});

  factory AddFavState.initial() => AddFavState(addFavStatus: AddFavStatus.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [addFavStatus];

  AddFavState copyWith({AddFavStatus? addFavStatus}) => AddFavState(addFavStatus: addFavStatus ?? this.addFavStatus);
}
