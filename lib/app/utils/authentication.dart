import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zartek/app/constants/app_errors.dart';
import 'package:zartek/app/routes/app_pages.dart';

class GoolgleAuthentication {
  static Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
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

    return user;
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
  static RxString otpCode = ''.obs;
  static RxString smsVerificationCode = ''.obs;

  static Future<void> signInWithPhone({required String phoneNumber}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }

  static onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    otpCode.value = authCredential.smsCode!;
    User? user = FirebaseAuth.instance.currentUser;

    if (authCredential.smsCode != null) {
      user!.linkWithCredential(authCredential).then((_) {
        Get.offAndToNamed(Routes.HOME);
      }).onError(
        (FirebaseAuthException error, stackTrace) {
          if (error.code == 'provider-already-linked') {
            auth.signInWithCredential(authCredential).then((__) {
              Get.offAndToNamed(Routes.HOME);
            });
          }
        },
      );
    }
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

  static onCodeSent(String verificationId, int? forceResendingToken) {
    // set the verification code so that we can use it to log the user in
    smsVerificationCode.value = verificationId;
    print('This is verification id ${smsVerificationCode.value}.');
    print('This is force resending token $forceResendingToken.');
    print("code sent");
  }

  static onCodeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    smsVerificationCode.value = verificationId;
    print('This is verification id ${smsVerificationCode.value}.');
    print("Code AutoRetrieval Timeout.");
  }
}
