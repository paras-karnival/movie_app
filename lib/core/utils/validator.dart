class Validator {
  Validator._();

  // ignore: prefer_function_declarations_over_variables
  static Function validateEmpty = (String? input) {
    if (input == null || input.isEmpty || input.trim().isEmpty) {
      return "The field is required";
    } else {
      return null;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function validateList = (input) {
    if (input == null || input.length < 1) {
      return "List is empty";
    } else {
      return null;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function keepValidatorClean = (String input) {
    if (input.isEmpty || input.trim().isEmpty) {
      return null;
    } else {
      return null;
    }
  };

  static final RegExp _emailRgex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');


  // ignore: prefer_function_declarations_over_variables
  static Function validateEmail = (String? input) {
    if (input != null && _emailRgex.hasMatch(input)) {
      return null;
    } else {
      return "Email address not valid";
    }
  };

}
