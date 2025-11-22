import 'dart:async';
import 'package:easacc/core/utils/shared_pref_services.dart';
import 'package:easacc/features/home/presentation/controllers/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  StreamSubscription<List<ScanResult>>? _scanSubscription;

  SettingsCubit() : super(const SettingsState());

  /// Load saved URL
  Future<void> loadUrl() async {
    emit(state.copyWith(isLoadingUrl: true));
    final savedUrl = SharedPrefServices.getString("webview_url") ?? "";

    emit(state.copyWith(isLoadingUrl: false, url: savedUrl));
  }

  /// Save URL
  Future<void> saveUrl(String newUrl) async {
    emit(state.copyWith(isSavingUrl: true));
    await SharedPrefServices.setString("webview_url", newUrl);
    emit(state.copyWith(isSavingUrl: false, url: newUrl));
  }

  /// Request Bluetooth permissions
  Future<bool> _requestBluetoothPermissions() async {
    // Android 12+ Bluetooth permissions
    final bluetoothScan = await Permission.bluetoothScan.request();
    final bluetoothConnect = await Permission.bluetoothConnect.request();

    // Location required for pre-Android 12 scanning
    final location = await Permission.location.request();

    if (bluetoothScan.isGranted &&
        bluetoothConnect.isGranted &&
        location.isGranted) {
      return true;
    }

    return false;
  }

  /// Scan for Bluetooth devices
  Future<void> scanDevices() async {
    emit(state.copyWith(isScanning: true, devices: []));

    // 🔐 Request permissions first
    final hasPermission = await _requestBluetoothPermissions();

    if (!hasPermission) {
      emit(state.copyWith(
        isScanning: false,
        errorMessage:
        "Bluetooth permissions are required.\nPlease enable them from Settings.",
      ));
      return;
    }

    // 📡 Check Bluetooth state
    final isBluetoothOn = await FlutterBluePlus.adapterState
        .map((s) => s == BluetoothAdapterState.on)
        .first;

    if (!isBluetoothOn) {
      emit(state.copyWith(
        isScanning: false,
        errorMessage: "Please turn Bluetooth ON",
      ));
      return;
    }

    // Stop previous scan if exists
    await _scanSubscription?.cancel();

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    _scanSubscription = FlutterBluePlus.scanResults.listen((results) {
      emit(
        state.copyWith(
          devices: results.map((r) => r.device).toList(),
        ),
      );
    });

    await Future.delayed(const Duration(seconds: 4));
    await FlutterBluePlus.stopScan();

    emit(state.copyWith(isScanning: false));
  }

  /// Select a Bluetooth device
  void selectDevice(BluetoothDevice? device) {
    emit(state.copyWith(selectedDevice: device));
  }

  @override
  Future<void> close() {
    _scanSubscription?.cancel();
    return super.close();
  }
}
