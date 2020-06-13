part of 'models.dart';

class User extends Equatable {
  //? Semua hal yang akan diperlukan di deklrasikan dulu
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguange;
  final int balance;

  //?Membuat konstruksi (tanda dalam kurung = opsional tidak harus ada)
  User(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.balance,
      this.selectedGenres,
      this.selectedLanguange});

  //? Merubah tampilan message toString saat dipakai SignUp
  @override
  String toString() {
    // TODO: implement toString
    return "[$id] - $name,  $email";
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguange,
        balance
      ];
}
