import 'package:flutter/material.dart';
import 'package:rezaei_flutter_test_task/data/repositories/airport_repo/airport_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var airRepo = AirportRepository();
  airRepo.getAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
