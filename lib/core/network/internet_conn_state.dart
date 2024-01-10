part of 'internet_conn_bloc.dart';

abstract class InternetConnState {}

class InternetConnInitialState extends InternetConnState {}

class InternetConnSuccessState extends InternetConnState {}

class InternetConnFailureState extends InternetConnState {}
