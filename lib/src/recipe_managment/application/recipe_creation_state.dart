import 'package:equatable/equatable.dart';

class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeStateInitial extends RecipeState {
  const RecipeStateInitial();

  @override
  List<Object> get props => [];
}

class RecipeStateLoading extends RecipeState {
  const RecipeStateLoading();

  @override
  List<Object> get props => [];
}

class RecipeStateSuccess extends RecipeState {
  const RecipeStateSuccess();

  @override
  List<Object> get props => [];
}

class RecipeStateError extends RecipeState {
  final String error;

  const RecipeStateError(this.error);

  @override
  List<Object> get props => [error];
}
