import 'package:e_commerce_flutter/Login.dart';
import 'package:e_commerce_flutter/check_box.dart';
import 'package:e_commerce_flutter/constants.dart';
import 'package:e_commerce_flutter/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sign up Form', () {
    testWidgets("test sign up form validations", (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(const MaterialApp(home: SignUpScreen()));

      //Act
      Finder firstNameTextFormField = find.byKey(const ValueKey('First_Name_Key'));
      Finder lastNameTextFormField = find.byKey(const ValueKey('Last_Name_Key'));
      Finder mobileNoTextFormField = find.byKey(const ValueKey('Mobile_No_Key'));
      Finder emailTextFormField = find.byKey(const ValueKey('Sign_Up_Email_text_form'));
      Finder passwordTextFormField = find.byKey(const ValueKey('Sign_Up_Password_text_form'));
      Finder signUpButton = find.byType(ElevatedButton);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorTexts = find.text(ErrorStrings().error_message_field_required);
      expect(errorTexts, findsNWidgets(2));

      //Assertion ===> First Name
      await tester.enterText(firstNameTextFormField, 'V');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errotText2 = find.text("Enter at least 2 characters");
      expect(errotText2, findsOneWidget);

      await tester.enterText(firstNameTextFormField, 'Vkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjkkkkssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorText3 = find.text("Max 50 characters are allowed");
      expect(errorText3, findsOneWidget);

      await tester.enterText(firstNameTextFormField, '850935');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorText4 = find.text("Allow only alpha characters");
      expect(errorText4, findsOneWidget);

      await tester.enterText(firstNameTextFormField, 'Vijay');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(errotText2, findsNothing);
      expect(errorText3, findsNothing);
      expect(errorText4, findsNothing);

      //Assertion ===> Last Name

      await tester.enterText(lastNameTextFormField, 'k');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorText5 = find.text("Enter at least 2 characters");
      expect(errorText5, findsOneWidget);

      await tester.enterText(lastNameTextFormField, 'sjlkglklkjklgkljlkgjlkglkgjlkgjglkgjlgkjglkgjglkjgkgjgklgjlkjglkgjklgjglkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjglkgjlkgjglkjglkjglkgjglkjglkjgl');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorText6 = find.text("Max 50 characters are allowed");
      expect(errorText6, findsOneWidget);

      await tester.enterText(lastNameTextFormField, '38590345');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorText7 = find.text("Allow only alpha characters");
      expect(errorText7, findsOneWidget);

      await tester.enterText(lastNameTextFormField, 'Kamble');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(errorText5, findsNothing);
      expect(errorText6, findsNothing);
      expect(errorText7, findsNothing);

      //Assertion ===> Mooile No
      await tester.enterText(mobileNoTextFormField, '193809');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errotText8 = find.text("Enter at least 10 characters");
      expect(errotText8, findsOneWidget);

      await tester.enterText(mobileNoTextFormField, '209385092590859083095839058903839508035');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorText9 = find.text("Max 20 characters are allowed");
      expect(errorText9, findsOneWidget);

      await tester.enterText(mobileNoTextFormField, 'jkfkkjhkjkjjkk');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorText10 = find.text("Allow only numbers");
      expect(errorText10, findsOneWidget);

      await tester.enterText(mobileNoTextFormField, '9373428415');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      expect(errotText8, findsNothing);
      expect(errorText9, findsNothing);
      expect(errorText10, findsNothing);

      //Assertion ===> Email

      await tester.enterText(emailTextFormField, 'vijaykamble1794@gmail.com');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorTexts1 = find.text(ErrorStrings().error_message_field_required);

      //Assertion ===> Password
      expect(errorTexts, findsNWidgets(1));

      await tester.enterText(passwordTextFormField, 'Vijay123*');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      Finder errorTexts_Field_Required = find.text(ErrorStrings().error_message_field_required);
      Finder errorTexts_valid_email = find.text(ErrorStrings().error_message_valid_email_id);
      Finder errorTexts_valid_password = find.text(ErrorStrings().error_message_valid_password);
      Finder errorTexts_valid_password_max_char = find.text(ErrorStrings().error_message_password_max_characters);
      Finder errorTexts_valid_password_min_char = find.text(ErrorStrings().error_message_password_min_characters);

      //Assertion
      expect(errotText2, findsNothing);
      expect(errorText3, findsNothing);
      expect(errorText4, findsNothing);
      expect(errorText5, findsNothing);
      expect(errorText6, findsNothing);
      expect(errorText7, findsNothing);
      expect(errotText8, findsNothing);
      expect(errorTexts_Field_Required, findsNothing);
      expect(errorTexts_valid_email, findsNothing);
      expect(errorTexts_valid_password, findsNothing);
      expect(errorTexts_valid_password_max_char, findsNothing);
      expect(errorTexts_valid_password_min_char, findsNothing);
    });
  });

  testWidgets('Checkbox Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyCheckboxWidget()));

    // Find the checkbox widget
    final checkboxFinder = find.byType(Checkbox);

    // Verify that the checkbox starts as unchecked
    expect(tester.widget<Checkbox>(checkboxFinder).value, false);

    // Tap the checkbox
    await tester.tap(checkboxFinder);
    await tester.pump();

    // Verify that the checkbox is checked after tapping
    expect(tester.widget<Checkbox>(checkboxFinder).value, true);
  });
}
