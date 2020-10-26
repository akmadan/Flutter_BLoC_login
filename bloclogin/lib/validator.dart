import 'dart:async';

mixin Validators {
  var emailvalidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Email is invalid');
    }
  });
  var passwordvalidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length>4) {
      sink.add(password);
    } else {
      sink.addError('Password is short');
    }
  });
}
