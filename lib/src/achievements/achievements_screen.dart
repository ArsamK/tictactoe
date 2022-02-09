import 'package:flutter/material.dart';
import 'package:flutter_game_sample/src/achievements/player_progress.dart';
import 'package:flutter_game_sample/src/style/rough/button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<PlayerProgress>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(34),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _gap,
                  const Text(
                    'Achievements',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 45,
                      height: 1,
                    ),
                  ),
                  _gap,
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text('#'),
                          Text('Name'),
                          Text('Level'),
                          Text('Time'),
                          Text('Score'),
                        ],
                      ),
                      if (progress.highestScores.isEmpty)
                        TableRow(children: [
                          Text('---'),
                          Text('---'),
                          Text('---'),
                          Text('---'),
                          Text('---'),
                        ]),
                      for (var i = 0; i < progress.highestScores.length; i++)
                        TableRow(
                          children: [
                            Text('${i + 1}'),
                            Text('PLAYER'),
                            Text(progress.highestScores[i].level.toString()),
                            Text(progress.highestScores[i].formattedTime),
                            Text(progress.highestScores[i].score.toString()),
                          ],
                        ),
                    ],
                  ),
                  _gap,
                  Text('NOT IMPLEMENTED YET:\n\n'
                      '* Global / friend leaderboard\n\n'
                      '* List of “achievements” such as '
                      '“Won in 5 moves,” '
                      '“Gomoku champion” or '
                      '“The only winning move is not to play.”'),
                  _gap,
                ],
              ),
            ),
            Center(
              child: RoughButton(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: const Text('Back'),
              ),
            ),
            _gap,
          ],
        ),
      ),
    );
  }
}
