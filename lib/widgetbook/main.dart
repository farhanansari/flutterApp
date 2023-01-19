import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/Services/Services.story.dart';
import 'package:widgetbook/widgetbook.dart';
import 'atoms/index.dart';
import 'molecules/index.dart';
import 'organisms/index.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(name: 'atoms', widgets: [
          SwitchButtonStory(),
          TimeSelectorStory(),
          DropDownStory()
        ]),
        WidgetbookCategory(name: 'molecules', widgets: [
          SignupStory(),
          SigninStory(),
          HeaderBarStory(),
          AddressStory(),
          ServiceHoursStory(),
          TaskLineItemStory(),
          ServiceItemStory(),
          ServicesStory(),
          ProfileImageStory(),
          AlbumStory()
        ]),
        WidgetbookCategory(
            name: 'organisms',
            widgets: [SetupHomeStory(), SignupSigninStory(), SetupStory()]),
        WidgetbookCategory(name: 'Screens', widgets: [])
      ],
      appInfo: AppInfo(name: 'Receipe App'),
      themes: [WidgetbookTheme(name: 'Dark', data: ThemeData.dark())],
    );
  }
}

void main() async {
  //print("+++++++++++ INITIALIZING...");
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const WidgetbookHotReload());
}
