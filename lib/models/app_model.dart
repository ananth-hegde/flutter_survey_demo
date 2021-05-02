import 'package:hive/hive.dart';

part 'app_model.g.dart';

@HiveType(typeId: 0)
class AppModel extends HiveObject{
  @HiveField(0)
  bool isLoggedIn;
  AppModel(this.isLoggedIn);
}