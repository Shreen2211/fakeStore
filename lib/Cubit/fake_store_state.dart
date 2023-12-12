part of 'fake_store_cubit.dart';

@immutable
abstract class FakeStoreState {}

class FakeStoreInitial extends FakeStoreState {}

class loadingLogingState extends FakeStoreState {}

class ErrorLogingState extends FakeStoreState {}

class SucessLogingState extends FakeStoreState {}

class loadingGetState extends FakeStoreState {}

class ErrorGetState extends FakeStoreState {}

class SucessGetState extends FakeStoreState {}

class loadingProductState extends FakeStoreState {}

class ErrorProductState extends FakeStoreState {}

class SucessProductState extends FakeStoreState {}

class loadingSingleProductState extends FakeStoreState {}

class ErrorSingleProductState extends FakeStoreState {}

class SucessSingleProductState extends FakeStoreState {}
