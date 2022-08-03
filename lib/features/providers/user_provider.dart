import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../viewmodels/user_viewmodel.dart';

final userProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  return UserViewModel();
});
