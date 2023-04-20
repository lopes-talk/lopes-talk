import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/services/data_service.dart';

final dataServiceProvider = Provider(
  (ref) => DataService(apiUrl: 'https://api.goprogram.ai/inspiration'),
);
