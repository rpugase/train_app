import 'package:flutter/material.dart';
import 'package:flutterapp/domain/workout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Home page'),
        leading: Icon(Icons.fitness_center),
      ),
      body: WorkoutsList(),
    );
  }
}

class WorkoutsList extends StatelessWidget {

  final workouts = <Workout>[
    Workout("Test1", "Max1", "Tests Workout", "Beginner"),
    Workout("Test2", "Max2", "Tests Workout", "Intermediate"),
    Workout("Test3", "Max3", "Tests Workout", "Advanced"),
    Workout("Test4", "Max4", "Tests Workout", "Beginner"),
    Workout("Test5", "Max5", "Tests Workout", "Intermediate"),
    Workout("Test5", "Max5", "Tests Workout", "Intermediate"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) => Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
          child: ListTile(
            title: Text(workouts[index].title),
            subtitle: _subtitle(context, workouts[index]),
            leading: Container(
              child: Icon(Icons.fitness_center, color: Colors.white),
              padding: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white24)),
              ),
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _subtitle(BuildContext context, Workout workout) {
    var color = Colors.grey;
    double indicatorLevel = 0;

    switch (workout.level) {
      case 'Beginner':
        color = Colors.green;
        indicatorLevel = 0.33;
        break;
      case 'Intermediate':
        color = Colors.yellow;
        indicatorLevel = 0.66;
        break;
      case 'Advanced':
        color = Colors.red;
        indicatorLevel = 1;
        break;
    }

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            value: indicatorLevel,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Text(workout.level),
        ),
      ],
    );
  }
}
