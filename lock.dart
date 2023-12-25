import 'dart:math';

class PasswordManager {
  // Regular expressions for character types
  static final RegExp _lowerCase = RegExp(r'[a-z]');
  static final RegExp _upperCase = RegExp(r'[A-Z]');
  static final RegExp _number = RegExp(r'[0-9]');
  static final RegExp _specialChar = RegExp(r'[!@#\$%^&*()_+[\]{}]');

  /// Validates the strength of a password.
  ///
  /// This method checks if the [password] meets certain criteria to determine
  /// its strength. It verifies the presence of at least one lowercase letter,
  /// one uppercase letter, one number, and one special character. Additionally,
  /// it requires the password to be at least 8 characters long for "Strong"
  /// strength, 6 characters for "Intermediate," and any length for "Low."
  ///
  /// Returns a string indicating the password strength: "Strong",
  /// "Intermediate", or "Low" based on the criteria.
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

  /// Generates a password of the specified [level].
  ///
  /// The [level] parameter can be one of three values: "strong", "intermediate",
  /// or "low". Depending on the chosen level, this method selects the character
  /// set (lowercase letters, uppercase letters, numbers, and special characters)
  /// and the length of the generated password.
  ///
  /// Returns the generated password as a string.
  static String generatePassword({required String level}) {
    // Character sets for password generation
    const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String specialChars = '!@#\$%^&*()_+[]{}';

    String chars = ''; // Initialize characters set
    int length = 8;   // Default password length

    // Select character set and length based on the specified level
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
        return "Invalid level"; // Return error message for an invalid level
    }

    // Generate a password by randomly selecting characters from the set
    return List.generate(length, (index) => chars[Random().nextInt(chars.length)]).join();
  }
}

void main() {
  // Sample password for strength validation
  String password = "safa@TM";
  
  // Validate the password strength and print the result
  print("Password Strength: ${PasswordManager.validatePasswordStrength(password)}");

  // Generate a strong password and print it
  String generatedStrongPassword = PasswordManager.generatePassword(level: "strong");
  print("Generated Strong Password: $generatedStrongPassword");
}
