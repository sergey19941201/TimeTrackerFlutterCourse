import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';

abstract class Database {
  void createJob(Job job);

  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null){
    jobData= List<Job>.from([Job(name: 'initial job', ratePerHour: 22)]);
    _jobsController.add(jobData);
  }

  static List<Job> jobData;
  final StreamController<List<Job>> _jobsController =
      StreamController<List<Job>>();

  // TODO call from somewhere
  void dispose() {
    _jobsController.close();
  }

  final String uid;

  void createJob(Job job) {
    jobData.add(job);
    _jobsController.add(jobData);
  }

  Stream<List<Job>> jobsStream() => _jobsController.stream;
}
