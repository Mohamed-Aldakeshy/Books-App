import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FeauteredBooksState extends Equatable {
  const FeauteredBooksState();

  @override
  List<Object> get props => [];
}

class FeauteredBooksInitial extends FeauteredBooksState {}

class FeauteredBooksLoading extends FeauteredBooksState {}

class FeauteredBooksFailure extends FeauteredBooksState {
  final String errMessage;

  FeauteredBooksFailure(this.errMessage);
}

class FeauteredBooksSuccess extends FeauteredBooksState {
  final List<BookModel> cubitBooksList;

  const FeauteredBooksSuccess({required this.cubitBooksList});
}
