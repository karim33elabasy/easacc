import 'package:easacc/core/widgets/app_icon_button.dart';
import 'package:easacc/core/widgets/app_scaffold.dart';
import 'package:easacc/features/home/presentation/controllers/settings_cubit.dart';
import 'package:easacc/features/home/presentation/controllers/settings_states.dart';
import 'package:easacc/features/home/presentation/widgets/bluetooth_search_widget.dart';
import 'package:easacc/features/home/presentation/widgets/url_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit()..loadUrl(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          final urlController = TextEditingController(text: state.url);

          return AppScaffold(
            appBar: AppBar(title: const Text("Settings")),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  UrlInput(urlController: urlController),

                  AppIconButton(
                    isLoading: state.isSavingUrl,
                    icon: Icons.link,
                    text: "Save URL",
                    onPressed: () => cubit.saveUrl(urlController.text),
                  ),

                  const SizedBox(height: 40),

                  BluetoothSearchWidget(
                    isScanning: state.isScanning,
                    devices: state.devices,
                    selectedDevice: state.selectedDevice,
                    onDeviceSelected: (device) {
                      cubit.selectDevice(device);
                    },
                  ),

                  AppIconButton(
                    isLoading: state.isScanning,
                    icon: Icons.bluetooth,
                    text: "Scan For Devices",
                    onPressed: cubit.scanDevices,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
