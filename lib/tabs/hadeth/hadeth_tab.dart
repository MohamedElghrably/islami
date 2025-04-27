import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHatethFile();
    }
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_logo.png",
          height: MediaQuery.sizeOf(context).height * .25,
        ),
        Expanded(
          child:
              ahadeth.isEmpty
                  ? LoadingIndicator()
                  : ListView.separated(
                    padding: EdgeInsets.only(top: 20),
                    itemBuilder:
                        (context, index) => InkWell(
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                HadethContentScreen.routeName,
                                arguments: ahadeth[index],
                              ),

                          child: Text(
                            ahadeth[index]
                                .tilte, // because sura txt files start from 1
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                    itemCount: ahadeth.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                  ),
        ),
      ],
    );
  }

  Future<void> loadHatethFile() async {
    await Future.delayed(Duration(seconds: 1));
    String ahadethFileContent = await rootBundle.loadString(
      "assets/text/ahadeth.txt",
    );
    List<String> ahadethStrings = ahadethFileContent.split("#");
    ahadeth =
        ahadethStrings.map((hadethstring) {
          List<String> hadethLines = hadethstring.trim().split("\n");
          String title = hadethLines[0];
          hadethLines.removeAt(0);
          List<String> content = hadethLines;
          return Hadeth(tilte: title, content: content);
        }).toList();
    setState(() {});
  }
}
