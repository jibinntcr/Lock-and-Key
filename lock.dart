import 'dart:math';

class PasswordManager {
  // Regular expressions to check for password requirements
  static final RegExp _lowerCase = RegExp(r'[a-z]');
  static final RegExp _upperCase = RegExp(r'[A-Z]');
  static final RegExp _number = RegExp(r'[0-9]');
  static final RegExp _specialChar = RegExp(r'[!@#\$%^&*()_+[\]{}]');

  /// Validates the strength of a password.
  /// Returns "Strong" if the password meets all requirements,
  /// "Intermediate" if it meets minimum requirements, and "Low" otherwise.
  static String validatePasswordStrength(String password) {
    bool hasLower = _lowerCase.hasMatch(password);
    bool hasUpper = _upperCase.hasMatch(password);
    bool hasNumber = _number.hasMatch(password);
    bool hasSpecial = _specialChar.hasMatch(password);

    int length = password.length;

    if (length >= 8 && hasLower && hasUpper && hasNumber && hasSpecial) {
      return "Strong";
    } else if (length >= 6 && hasLower && hasUpper && hasNumber) {
      return "Intermediate";
    } else {
      return "Low";
    }
  }

  /// Generates a password based on the specified [level].
  /// Returns a password with the desired level of complexity.
  static String generatePassword({required String level}) {
    const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String specialChars = '!@#\$%^&*()_+[]{}';

    String chars = '';
    int length = 8;

    switch (level) {
      case "strong":
        chars = lowerCaseLetters + upperCaseLetters + numbers + specialChars;
        length = 12;
        break;
      case "intermediate":
        chars = lowerCaseLetters + upperCaseLetters + numbers;
        length = 10;
        break;
      case "low":
        chars = lowerCaseLetters;
        length = 6;
        break;
      default:
        return "Invalid level";
    }

    // Generate a random password using characters from 'chars'
    return List.generate(length, (index) => chars[Random().nextInt(chars.length)]).join();
  }
}

void main() {
  String password = "J1Master@2020!!";
  
  // Validate password strength and print the result
  print("Password Strength: ${PasswordManager.validatePasswordStrength(password)}");

  // Generate a strong password and print it
  String generatedStrongPassword = PasswordManager.generatePassword(level: "strong");
  print("Generated Strong Password: $generatedStrongPassword");
}
