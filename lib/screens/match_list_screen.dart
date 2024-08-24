import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_firebase_app/entities/football.dart';
import 'package:first_firebase_app/screens/widgets/football_score_card.dart';
import 'package:flutter/material.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> matchList = [];

  Future<void> _getfootballMatches() async {
    matchList.clear();
    final QuerySnapshot result =
        await firebaseFirestore.collection('football').get();
    for (QueryDocumentSnapshot doc in result.docs) {
      matchList.add(Football(
          matchName: doc.id,
          team1Name: doc.get('team1Name'),
          team2Name: doc.get('team2Name'),
          team1Score: doc.get('team1Score'),
          team2Score: doc.get('team2Score'),
       ),
      );
    }
    setState(() {});

  }

  @override
  void initState() {

    super.initState();
    _getfootballMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Live score'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: matchList.length,
        itemBuilder: (context, index) {
          return score_card(football: matchList[index]);
        },
      ),
    );
  }
}
