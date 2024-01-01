import 'package:geolocator/geolocator.dart';

class MaskStockLocationRepository {
  //선언
  final _geolocator = Geolocator();

  // 현재위치 받기
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
