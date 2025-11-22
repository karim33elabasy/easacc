import 'package:easacc/core/widgets/app_scaffold.dart';
import 'package:easacc/core/widgets/side_menu.dart';
import 'package:easacc/features/home/presentation/widgets/app_web_view.dart';
import 'package:easacc/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc/features/home/presentation/controllers/settings_cubit.dart';
import 'package:easacc/features/home/presentation/controllers/settings_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().loadUrl();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final url = state.url.isNotEmpty == true
            ? state.url
            : "https://www.google.com";
        return AppScaffold(
          drawer: SideMenu(),
          appBar: HomeAppBar(),
          body: state.isLoadingUrl
              ? const Center(child: CircularProgressIndicator())
              : AppWebView(url: url),
        );
      },
    );
  }
}
