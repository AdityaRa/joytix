part of 'extensions.dart';


extension FirebaseUserExtension on FirebaseUser {
  //?Method merubah firebase user menjadi User
  User convertToUser(
          {String name = "No Name",
          List<String> selectedGenres,
          String selectedLanguange = "English",
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguange: selectedLanguange);
  //?Method ngambil data firestore berdasarkan id  (Sign IN)
  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);

}
