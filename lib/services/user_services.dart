part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<SignInSignUpResult> updateUser(User user) async {
    // //? Mengubah selected genre menjadi String Asli
    // String genres="";

    // //? Cara agar merubah data list selecetedGenres jadi string asli utk ke db firebase ['action','film','drama'] =>"action,film,drama"
    // for(var genre in user.selectedGenres){
    //   genre += genre + ((genre != user.selectedGenres.last) ? ',' :'');
    // }

    //? set method untuk Save FireStore
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguange': user.selectedLanguange,
      //! Kalau profile picturenya kaga ada , di kasih null
      'profilePicture': user.profilePicture ?? ""
    });
  }

  //? set method untuk ngambil user (sign in) dari firestore
  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();
    //?Mengembalikan data yang diminta dari firestore
    return User(
      id,
      snapshot.data['email'],
      balance: snapshot.data['balance'],
      profilePicture: snapshot.data['profilePicture'],
      selectedGenres: (snapshot.data['selectedGenres'] as List).map((e)=> e.toString()).toList(),
      selectedLanguange: snapshot.data['selectedLanguage'],
      name: snapshot.data['name'],
    );
  }
}
