import 'package:first_firebase_app/entities/football.dart';
import 'package:flutter/material.dart';
class score_card extends StatelessWidget {
  const score_card({
    super.key, required this.football,
  });

  final Football football;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeam(football.team1Name,football.team1Score),
            Text('vs'),
            _buildTeam(football.team2Name, football.team2Score),
          ],
        ),
      ),
    );
  }

  Widget _buildTeam(String teamName, int score) {
    return Column(
            children: [
              Text(score.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
              Text(teamName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
            ],
          );
  }
}