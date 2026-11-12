class UserSettings {
  final String name;
  final String email;
  final String address;
  final bool receiveNewsletter;


  const UserSettings({
    this.name = '',
    this.email = '',
    this.address = '',
    this.receiveNewsletter = false,
  });
}