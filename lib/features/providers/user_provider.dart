import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../viewmodels/user_viewmodel.dart';

final userProvider = Provider<UserViewModel>((ref) {
  return UserViewModel();
});
