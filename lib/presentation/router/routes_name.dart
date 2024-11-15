class RoutesName {
  static const String splash="splash";
  static const String home="home";
  static const String create="create";
}
extension GoRoutesPath on String{
  String path()=>"/$this";
}