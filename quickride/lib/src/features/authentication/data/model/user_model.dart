class User {
  String? uid;
  final String email;
  final String phoneNumber;
  final String username;

  User(
      {
      this.uid,
      required this.email,
      required this.phoneNumber,
      required this.username});
}
