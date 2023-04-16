import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth/services/dataService.dart';

final dataServiceProvider = Provider(
  (ref) => DataService(apiUrl: 'https://api.goprogram.ai/inspiration'),
);
