  class User {
    final String uid;
    final String email;
    final String? displayName;

    User({required this.uid, required this.email, this.displayName});

    factory User.fromFirebaseUser(user) {
      return User(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
      );
    }
  }
