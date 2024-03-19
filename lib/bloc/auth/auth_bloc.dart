import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<EmailLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        return emit(AuthSuccess(uid: userCredential.user!.uid));
      } catch (e) {
        return emit(
          AuthFailure(
            e.toString(),
          ),
        );
      }
    });
    on<EmailSignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;
        final rePassword = event.rePassword;
        if (password != rePassword) {
          return emit(
            AuthFailure('Password do not match!'),
          );
        }
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        return emit(AuthSuccess(
            uid: userCredential.user!.displayName ?? 'anonymously'));
      } catch (e) {
        return emit(
          AuthFailure(
            e.toString(),
          ),
        );
      }
    });
    on<GoogleLoginRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        return emit(AuthSuccess(uid: googleUser!.displayName!));
      } catch (e) {
        return emit(
          AuthFailure(
            e.toString(),
          ),
        );
      }
    });
    on<FacebookLoginRequested>((event, emit) async {
      final UserCredential userData;
      //emit(AuthLoading());
      try {
        final FacebookLogin fb = FacebookLogin();
        final result = await fb.logIn(permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ]);
        final OAuthCredential authCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userdata =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        userData = userdata;
        return emit(
          AuthSuccess(uid: userData.user!.displayName!),
        );
      } catch (e) {
        return emit(
          AuthFailure(
            e.toString(),
          ),
        );
      }
    });
    on<SignOutRequest>((event, emit) async {
      emit(
        AuthLoading(),
      );
      try {
        await FirebaseAuth.instance.signOut();
        return emit(AuthInitial());
      } catch (e) {
        return emit(
          AuthFailure(
            e.toString(),
          ),
        );
      }
    });
  }
}
