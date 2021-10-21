import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zartek/app/constants/app_errors.dart';
import 'package:zartek/app/local_storage/sessions.dart';
import 'package:zartek/app/models/user_details_model.dart';
import 'package:zartek/app/routes/app_pages.dart';

class GoolgleAuthentication {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static void signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      loginWithCredential(authCredential, auth);
    }
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Get.snackbar(
        AppErrors.signoutError,
        AppErrors.signoutErrorDetails,
      );
    }
  }
}

class PhoneAuthentication {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> signInWithPhone({required String phoneNumber}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: (String verificationId, int? forceResendingToken) {
        onCodeSent(verificationId, phoneNumber);
      },
      codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }

  static onVerificationCompleted(PhoneAuthCredential authCredential) {
    print("verification completed ${authCredential.smsCode}");
    loginWithCredential(authCredential, auth);
  }

  static onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      Get.snackbar(
        AppErrors.invalidPhoneNumber,
        AppErrors.invalidPhoneNumberDetails,
      );
    } else {
      Get.snackbar(
        AppErrors.errorOccurred,
        AppErrors.unknownErrorDetails,
      );
    }
  }

  static onCodeSent(String verificationId, String phoneNumber) {
    Get.toNamed(
      Routes.OTP,
      arguments: {'phoneNumber': phoneNumber, 'verificationId': verificationId},
    );

    print("code sent");
  }

  static onCodeAutoRetrievalTimeout(String verificationId) {
    print("Code AutoRetrieval Timeout.");
  }
}

void loginWithCredential(AuthCredential authCredential, FirebaseAuth auth) {
  try {
    auth.signInWithCredential(authCredential).then(
      (userCredential) {
        USER_DETAILS.value = UserDetails(
          name: userCredential.user?.displayName,
          userId: userCredential.user?.uid,
          phoneNumber: userCredential.user?.phoneNumber,
          userImage: userCredential.user?.photoURL,
        );
        Get.offAndToNamed(Routes.HOME);
      },
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'account-exists-with-different-credential') {
      Get.snackbar(
        AppErrors.accountAlreadyExistsError,
        AppErrors.accountAlreadyExistsErrorDetails,
      );
    } else if (e.code == 'invalid-credential') {
      Get.snackbar(
        AppErrors.invalidCredentials,
        AppErrors.invalidCredentialsDetails,
      );
    }
  } catch (e) {
    Get.snackbar(
      AppErrors.signInError,
      AppErrors.signInErrorDetails,
    );
  }
}
