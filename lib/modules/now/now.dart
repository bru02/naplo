import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/ui/card.dart';
import 'package:filcnaplo/modules/now/upcoming_todos/view.dart';
import 'package:filcnaplo/modules/now/helper.dart';
import 'package:filcnaplo/modules/now/mode.dart';
import 'package:filcnaplo/ui/pages/planner/timetable/week.dart';

class Now extends StatefulWidget {
  final Function jumpToPage;
  Now(this.jumpToPage);
  @override
  NowState createState() => NowState();
}

class NowState extends State<Now> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: app.sync.fullSyncFinished,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) return Container();
          Mode currentMode = getMode(app.user.sync.timetable.data);
          return UpcomingToDoList(widget.jumpToPage);
        });
  }
}
