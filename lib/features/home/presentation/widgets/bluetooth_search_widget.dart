import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothSearchWidget extends StatelessWidget {
  final bool isScanning;
  final List<BluetoothDevice> devices;
  final BluetoothDevice? selectedDevice;
  final Function(BluetoothDevice?) onDeviceSelected;

  const BluetoothSearchWidget({
    super.key,
    required this.isScanning,
    required this.devices,
    required this.selectedDevice,
    required this.onDeviceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Printer (Bluetooth)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        isScanning
            ? Text("Looking for bluetooth devices..", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[500]),)
            : DropdownButton<BluetoothDevice>(
          isExpanded: true,
          value: selectedDevice,
          hint: const Text("Select device"),
          items: devices.map((device) {
            return DropdownMenuItem(
              value: device,
              child: Text(device.platformName.isNotEmpty
                  ? device.platformName
                  : device.remoteId.str),
            );
          }).toList(),
          onChanged: onDeviceSelected,
        ),
      ],
    );
  }
}
