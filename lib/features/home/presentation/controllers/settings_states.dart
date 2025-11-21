import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class SettingsState extends Equatable {
  final bool isLoadingUrl;
  final bool isSavingUrl;
  final String url;

  final bool isScanning;
  final List<BluetoothDevice> devices;
  final BluetoothDevice? selectedDevice;

  final String? errorMessage;

  const SettingsState({
    this.isLoadingUrl = false,
    this.isSavingUrl = false,
    this.url = "",
    this.isScanning = false,
    this.devices = const [],
    this.selectedDevice,
    this.errorMessage,
  });

  SettingsState copyWith({
    bool? isLoadingUrl,
    bool? isSavingUrl,
    String? url,
    bool? isScanning,
    List<BluetoothDevice>? devices,
    BluetoothDevice? selectedDevice,
    String? errorMessage,
  }) {
    return SettingsState(
      isLoadingUrl: isLoadingUrl ?? this.isLoadingUrl,
      isSavingUrl: isSavingUrl ?? this.isSavingUrl,
      url: url ?? this.url,
      isScanning: isScanning ?? this.isScanning,
      devices: devices ?? this.devices,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [isLoadingUrl, isSavingUrl, url, isScanning, devices, selectedDevice, errorMessage];
}
