import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatelessWidget {
  static const String routeName = "/hadeth-content";

  late Hadeth args;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/${settingsProvider.backgroundImageName}.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(args.tilte)),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.07,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            color: settingsProvider.isDark ? AppTheme.black : AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.builder(
            itemBuilder:
                (context, index) => Text(
                  args.content[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
            itemCount: args.content.length,
          ),
        ),
      ),
    );
  }
}
