// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickride/src/features/authentication/data/repository/authentication_repository.dart';
import 'package:quickride/src/utils/firebase_options.dart';

void main() {
  
  testWidgets('Successful sign up', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    final result = await AuthenticationRepository.signUp(
        'test@example.com', 'password123', 'John', 'Doe', 1234567890, 'johndoe');

    expect(result, 'Sign up successful');
  });
}
