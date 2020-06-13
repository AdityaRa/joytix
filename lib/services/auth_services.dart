// file tidak kotor smua file import ada di file induk services.dart
part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  //? Membuat semua hal yang dibutuhkan saat masuk aplikasi pertama kali
  //! SIGN UP
  static Future signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguange) async {
    try {
      //*Mendaftarkan email dan password ke firebase auth
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //*Kalau Sign Up berhasil akan mengambilkan objek baru (kalau Berhasil)
      //? Covert FirebaseUser menjadi User dengan method covertToUser yang sudah dibuat difrebase_user_extension

      User user = result.user.convertToUser(
          name: name,
          selectedLanguange: selectedLanguange,
          selectedGenres: selectedGenres);
      
      //?Save ke Fire Store dengan method yang sudah dibuat (message tidak diperlukan karena berhasil)
      await UserServices.updateUser(user);

      //*Message yang akan dikembalikan ketika berhasil 
      return SignInSignUpResult(user:user);
    } catch (e) {
      //!Kalau Sign Up Gagal akan mengembalikan message aja tanpa user
      //?To String akan di overide penampilan messagenya
      //?Merapihkan pesan error agar yang terlihat hanya yang mudah dimengerti AMBIL NO 1 DARI 0,1,2(error_password,The password is wrong,null)
      return SignInSignUpResult(message: e.toString().split(',')[1]);
    }
  }
  //!SIGN IN
  //*Membuat method SIGN In
  static Future<SignInSignUpResult> signIn(String email,String password) async{
    try{
      //? Jika Berhasil Sign In kita akan buat User dari firebase user karena firebase user hanya berisikan email & password ga include genre dll
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      //?buat user dari firestore user
      User user = await result.user.fromFireStore();
      
      return SignInSignUpResult(user: user);
    }
    catch(e){
      return SignInSignUpResult(message: e.toString().split(',')[1]);
      //?Merapihkan pesan error agar yang terlihat hanya yang mudah dimengerti AMBIL NO 1 DARI 0,1,2(error_password,The password is wrong,null)
    }
    

  }
  //!SIGN UP
  //*membuat method Sign Out
  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

//? Method untuk mengembalikan message agar rapih dan mudah dibaca
class SignInSignUpResult {
  final User user;
  final String message;

  //?Konstruksi 
  SignInSignUpResult({this.user,this.message});
}