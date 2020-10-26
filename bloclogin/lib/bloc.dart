import 'dart:async';

import 'package:bloclogin/validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators implements BaseBloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //-------------------------- INPUT ---------------------------------------

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  //-------------------------- OUTPUT --------------------------------------

  // initialising emailController for email TextField Output

  Stream<String> get email => _emailController.stream.transform(emailvalidator);

  // initialising password Controller for password TextField Output

  Stream<String> get password =>
      _passwordController.stream.transform(passwordvalidator);

  // Checking if both TxtFields are not empty so that successful login can take place !!
  Stream<bool> get submitCheck =>
      Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    print("xyx");
  }

  //---------------------------SUBMIT-------------------------------------

  // closing the streams
  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
