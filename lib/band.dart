
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue/gen/flutterblue.pb.dart' as FlutterProtos;

class Band{
  BluetoothDevice _device;

  String _addr;

  Band(this._addr){
    FlutterProtos.BluetoothDevice devPrototype = FlutterProtos.BluetoothDevice.create();
    devPrototype.remoteId = this._addr;
    devPrototype.type = FlutterProtos.BluetoothDevice_Type.LE;
    devPrototype.name = "Mi Band 4";
    _device = BluetoothDevice.fromProto(devPrototype);
    _connect();
  }

  _connect() async {
    await _device.connect();
  }
  _disconnect() async {
    await _device.disconnect();
  }

  Future<BluetoothService> getService(Guid guid) async{
    if(await _device.state.first != BluetoothDeviceState.connected){
      await _connect();
    }
    List<BluetoothService> services = await _device.discoverServices();
    for (var value in services) {
      if(value.uuid == guid){
        return value;
      }
    }
  }

  Future<BluetoothCharacteristic> getCharacteristic(Guid service, Guid characteristic) async{
    BluetoothService s = await getService(service);
    for(var char in s.characteristics){
      if(char.uuid == characteristic){
        return char;
      }
    }
  }

  String getAddr() {
    return _addr;
  }
}