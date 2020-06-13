part of 'pages.dart';

//! Mengatur tata muka halaman event apakah sign in atau main page
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? Jika ada perubahan status maka method ini akan di panggil lagi ( Sign Up Sign In Berubah Halaman)
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    //?Kalau firebase user itu null maka tidak login dan yang direturn sign in page,
    if (firebaseUser == null) {
      return SignInPage();
    } else {
      //?kalau firebase user itu ada maka lgoin dan yang direturn Main Page,
      return MainPage();
    }
  }
}
