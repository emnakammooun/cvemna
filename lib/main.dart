import 'package:cv_23/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cv_23/pages/home.page.dart';
import 'package:provider/provider.dart';


//String language ='EN';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.getInstance().then( (instance){
    //language = instance.getString('language')!;
  
        runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>UiProvider()..init(),
      child: Consumer<UiProvider>(
          builder: (context, UiProvider notifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Dark Theme',
              //By default theme setting, you can also set system
              // when your mobile theme is dark the app also become dark

              themeMode: notifier.isDark? ThemeMode.dark : ThemeMode.light,

              //Our custom theme applied
              darkTheme: notifier.isDark? notifier.darkTheme : notifier.lightTheme,

              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const HomePage(),
            );
          }
      ),
    );
  }
}