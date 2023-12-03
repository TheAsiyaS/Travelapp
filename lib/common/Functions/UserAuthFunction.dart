import 'package:email_validator/email_validator.dart';
import 'package:travelapp/common/RegExp.dart';

String usernamecheck({required String username}) {
  if (username.isEmpty) {
    return 'Username is empty';
  } else if (!usernameRegex.hasMatch(username)) {
    return 'We previously informed you that you may exclusively utilize the following characters: (a-z), (0-9), (.), and (_).';
  } else {
    return 'ok';
  }
}

String emailcheck({required String email}) {
  if (email.isEmpty) {
    return 'Email is empty';
  } else if (!email.contains('@gmail.com')) {
    return 'Incorrect email';
  } else if (!EmailValidator.validate(email)) {
    return 'Invalid email';
  } else {
    return 'ok';
  }
}

String phonenocheck({required String phoneNumber}) {
  if (phoneNumber.isEmpty) {
    return 'phoneNumber is empty';
  } else if (phoneNumber.length <= 9) {
    return 'Incorrect phoneNumber';
  }else if (phoneNumber.length > 10) {
    return 'Incorrect phoneNumber';
  } else {
    return 'ok';
  }
}

String passwordcheck({required String password}) {
  if (password.length < 6) {
    return 'Password must contain at least 6 characters';
  } else {
    RegExp specialCharacterPattern =
        RegExp(r'[!@#\$%^&*()_+{}\[\]:;<>,.?~\\|]');
    Iterable<RegExpMatch> matches =
        specialCharacterPattern.allMatches(password);

    if (matches.length < 3) {
      return 'Password must contain at least three special characters';
    } else {
      return 'ok';
    }
  }
}
