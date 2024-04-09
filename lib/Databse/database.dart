import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  
  final CollectionReference bennettBitesCollection = FirebaseFirestore.instance.collection('BennettBites');

}