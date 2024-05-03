class User {
  const User({
    required this.uuid,
    required this.name,
    required this.cpf,
    required this.email,
    required this.password,
  });

  final String uuid;
  final String name;
  final String email;
  final String password;
  final String cpf;
}
