import 'dart:async';
import "package:cloud_firestore/cloud_firestore.dart";

import "../models/user.dart";

class UserService {
  
  CollectionReference userRef = Firestore.instance.collection("users");

  Future<User> getUserById(String id) async {
    DocumentSnapshot snapshot = await userRef.document(id).get();
    User user = User.fromMap(id, snapshot.data);
    return user;
  }
}
