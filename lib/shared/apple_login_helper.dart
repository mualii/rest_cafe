// import 'package:apple_sign_in/apple_sign_in.dart';

import 'package:dio/dio.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_cafe/modules/save_location_screen/saveLocationScreen.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:rest_cafe/shared/cubits/startCubit.dart';
import 'package:rest_cafe/shared/dio_helper.dart';
import 'package:rest_cafe/shared/localstroage.dart';

class AppleLogin {
  final _firebaseAuth = FirebaseAuth.instance;

  // Future signInWithApple({required BuildContext context}) async {
  //   if (!await AppleSignIn.isAvailable()) {
  //     return null; //Break from the program
  //   }
  //
  //   // 1. perform the sign-in request
  //   AuthorizationResult result = await AppleSignIn.performRequests([
  //     AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
  //   ]);
  //
  //   // 2. check the result
  //   switch (result.status) {
  //     case AuthorizationStatus.authorized:
  //       final appleIdCredential = result.credential;
  //       final oAuthProvider = OAuthProvider('apple.com');
  //       final credential = oAuthProvider.credential(
  //         idToken: String.fromCharCodes(appleIdCredential!.identityToken!),
  //         accessToken:
  //             String.fromCharCodes(appleIdCredential.authorizationCode!),
  //       );
  //       print("credential accessToken = " + credential.accessToken!);
  //       print("credential idToken = " + credential.idToken!);
  //
  //       Response response = await DioHelper.postData(
  //           endpoint: "/api/v1/auth/apple-login",
  //           context: context,
  //           formData: {
  //             "token": credential.idToken!,
  //           });
  //       if (response.statusCode == 200) {
  //         StartCubit.get(context).saveNumber(response);
  //         navigateAndFinish(context, SaveLocationScreen());
  //       } else {
  //         print("error from server");
  //       }
  //
  //       // Either<String, Response> response = await DioHelper.postDataEither(
  //       //     endPoint: "/api/auth/login/apple",
  //       //     context: context,
  //       //     formDataInput: {
  //       //       "token": credential.idToken,
  //       //     });
  //       //
  //       // if (response.isRight) {
  //       //   print(response.right.data["token"]);
  //       //
  //       //
  //       //   LocalStorage.saveData(
  //       //       key: "access_token", value: response.right.data["token"].toString());
  //       //   // print(LocalStorage.getData(key: "access_token"));
  //       //   print("Done");
  //       //
  //       // await  firebase.FirebaseMessaging.instance.getToken().then((value) {
  //       //     String? token = value;
  //       //     print("FireBaseToken    " + token.toString());
  //       //     DioHelper.postData(
  //       //         endpoint:  "/api/user/fcm",
  //       //         context: context,
  //       //         formData: {"fcm": token});
  //       //   });
  //       //
  //       //   Navigator.of(context).pushReplacement(
  //       //       MaterialPageRoute(builder: (_) => MainScreen()));
  //       // } else {
  //       //   print(response.left);
  //       //   print("error from server");
  //       // }
  //
  //       return true;
  //     case AuthorizationStatus.error:
  //       print("Sign in failed: ${result.error!.localizedDescription}");
  //       throw PlatformException(
  //         code: 'ERROR_AUTHORIZATION_DENIED',
  //         message: result.error.toString(),
  //       );
  //
  //     case AuthorizationStatus.cancelled:
  //       print('User cancelled');
  //       throw PlatformException(
  //         code: 'ERROR_ABORTED_BY_USER',
  //         message: 'Sign in aborted by user',
  //       );
  //     default:
  //       throw UnimplementedError();
  //   }
  // }

  Future signOutWithApple() async {
    await _firebaseAuth.signOut();
    print("User Out");
  }
}
