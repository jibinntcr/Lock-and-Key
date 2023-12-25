# Lock and Key

This Dart code implements a **PasswordManager** class that provides functionality to validate the strength of passwords and generate passwords of varying levels.

## Password Strength Validation

The `validatePasswordStrength` method checks the strength of a password based on the following criteria:

- Password length:
  - "Strong": At least 8 characters.
  - "Intermediate": At least 6 characters.
  - "Low": Any length.

- Character types:
  - At least one lowercase letter.
  - At least one uppercase letter.
  - At least one number.
  - At least one special character from `!@#\$%^&*()_+[]{}.

## Password Generation

The `generatePassword` method can generate passwords with three different levels:

- "Strong": A combination of lowercase letters, uppercase letters, numbers, and special characters. Length: 12 characters.
- "Intermediate": A combination of lowercase letters, uppercase letters, and numbers. Length: 10 characters.
- "Low": Only lowercase letters. Length: 6 characters.

## Usage

Here's how you can use the PasswordManager class:

```dart
String password = "safa@TM";
print("Password Strength: ${PasswordManager.validatePasswordStrength(password)}");

String generatedStrongPassword = PasswordManager.generatePassword(level: "strong");
print("Generated Strong Password: $generatedStrongPassword");

The password strength is evaluated based on the following criteria:

Length of at least 8 characters
Presence of at least one lowercase letter (a-z)
Presence of at least one uppercase letter (A-Z)
Presence of at least one digit (0-9)
Presence of at least one special character (!@#$%^&*()_+[]{})

### Password Generation
The generatePassword method generates passwords with varying levels of complexity based on the level parameter provided. The method takes a level ("strong," "intermediate," or "low") and returns a password of the specified complexity.

static String generatePassword({required String level})

Password generation is customized according to the following complexity levels:

"strong": Includes lowercase letters, uppercase letters, numbers, and special characters. Password length is 12 characters.
"intermediate": Includes lowercase letters, uppercase letters, and numbers. Password length is 10 characters.
"low": Includes only lowercase letters. Password length is 6 characters.
Regular Expressions
To check for password requirements, the class uses regular expressions (Regex):

_lowerCase: Matches lowercase letters (a-z)
_upperCase: Matches uppercase letters (A-Z)
_number: Matches digits (0-9)
_specialChar: Matches special characters (!@#$%^&*()_+[]{})

# Main Function
The main function demonstrates the usage of the PasswordManager class. It validates a sample password and generates a strong password

void main() {
  String password = "J1Master@2020!!";
  
  // Validate password strength and print the result
  print("Password Strength: ${PasswordManager.validatePasswordStrength(password)}");

  // Generate a strong password and print it
  String generatedStrongPassword = PasswordManager.generatePassword(level: "strong");
  print("Generated Strong Password: $generatedStrongPassword");
}
The PasswordManager class provides a convenient way to evaluate the strength of passwords and generate secure passwords of different complexity levels in Dart.


