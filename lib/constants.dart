import 'package:flutter_blue/flutter_blue.dart';

class UUIDs{
  static Guid _makeServiceGuid(String id){
    return new Guid("0000$id-0000-1000-8000-00805f9b34fb");
  }
  static final Guid SERVICE_BASE_1 = _makeServiceGuid("fee0");
  static final Guid SERVICE_BASE_2 = _makeServiceGuid("fee1");

  static final Guid SERVICE_ALERT = _makeServiceGuid("1802");

  static final Guid SERVICE_ALERT_NOTIFICATION = _makeServiceGuid("1811");
  static final Guid CHARACTERISTIC_CUSTOM_ALERT = new Guid("00002a46-0000-1000-8000-00805f9b34fb");


  static final Guid SERVICE_HEART_RATE = _makeServiceGuid("180d");
  static final Guid SERVICE_DEVICE_INFO = _makeServiceGuid("180a");


}