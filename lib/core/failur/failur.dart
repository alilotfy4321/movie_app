// ignore_for_file: camel_case_types

abstract class Failur {
  String? errorMessage;
  Failur(this.errorMessage);
}

class ServerExeption extends Failur {
  ServerExeption(super.errorMessage);

}
class LocalDataBaseExeption extends Failur {
  LocalDataBaseExeption(super.errorMessage);

}