import 'package:bhs/constants.dart';
import 'package:bhs/providers/acte_provider.dart';
import 'package:bhs/providers/auth_providers.dart';
import 'package:bhs/providers/role_provider.dart';
import 'package:bhs/providers/user_provider.dart';
import 'package:bhs/views/acte/list_acte_view.dart';
import 'package:bhs/views/admin/dashbord_view.dart';
import 'package:bhs/views/admin/deamnde_encours_admin_view.dart';
import 'package:bhs/views/admin/details_demande_encours_admin.dart';
import 'package:bhs/views/admin/list_user.dart';
import 'package:bhs/views/auth/forgot_password.dart';
import 'package:bhs/views/auth/login_view_screen.dart';
import 'package:bhs/views/auth/register_view.dart';
import 'package:bhs/views/home_view.dart';
import 'package:bhs/views/not_found.dart';
import 'package:bhs/views/splash_view.dart';
import 'package:bhs/views/user/accueil_view.dart';
import 'package:bhs/views/user/demande_encour_view.dart';
import 'package:bhs/views/user/demande_traite_view.dart';
import 'package:bhs/views/user/demande_view.dart';
import 'package:bhs/views/user/detail_demande_encours.dart';
import 'package:bhs/views/user/details_demande_traite.dart';
import 'package:bhs/views/user/form_demande.dart';
import 'package:bhs/views/user/profil_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(OgiiApp());
}

class OgiiApp extends StatefulWidget {
  @override
  _OgiiState createState() => _OgiiState();
}

class _OgiiState extends State<OgiiApp> {
  final AuthProvider authProvider = AuthProvider();
  final ActeApiProvider acteApiProvider = ActeApiProvider();
  final UserProvider userProvider = UserProvider();
  @override
  void initState() {
    initauthAsync().then((value) => {});
    super.initState();
  }

  Future<void> initauthAsync() async {
    await authProvider.initAuth();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: authProvider,
        ),
        ChangeNotifierProxyProvider<AuthProvider, ActeApiProvider>(
            create: (_) => ActeApiProvider(),
            update: (_, authProvider, oldActeProvider) {
              oldActeProvider.update(authProvider);
              return oldActeProvider;
            }),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
            create: (_) => UserProvider(),
            update: (_, authProvider, oldUserProvider) {
              oldUserProvider.update(authProvider);
              return oldUserProvider;
            }),
        ChangeNotifierProxyProvider<AuthProvider, RoleApiProvider>(
            create: (_) => RoleApiProvider(),
            update: (_, authProvider, oldRoleProvider) {
              oldRoleProvider.update(authProvider);
              return oldRoleProvider;
            }),
      ],
      child: MaterialApp(
        title: 'OGII Mairie',
        debugShowCheckedModeBanner: false,
        home: SplashView(),
        onGenerateRoute: (settings) {
          if (settings.name == LoginPage.rootName) {
            return MaterialPageRoute(builder: (_) => LoginPage());
          } else if (settings.name == HomeViewScreen.rootName) {
            return MaterialPageRoute(builder: (_) => HomeViewScreen());
          } else if (settings.name == ListActeView.rootName) {
            return MaterialPageRoute(builder: (_) => ListActeView());
          } else if (settings.name == Accueil.rootName) {
            return MaterialPageRoute(builder: (_) => Accueil());
          } else if (settings.name == Demande.rootName) {
            return MaterialPageRoute(builder: (_) => Demande());
          } else if (settings.name == Profil.rootName) {
            return MaterialPageRoute(builder: (_) => Profil());
          } else if (settings.name == FormDemande.rootName) {
            return MaterialPageRoute(builder: (_) => FormDemande());
          } else if (settings.name == ForgetPassword.rootName) {
            return MaterialPageRoute(builder: (_) => ForgetPassword());
          } else if (settings.name == RegisterPage.rootName) {
            return MaterialPageRoute(builder: (_) => RegisterPage());
          } else if (settings.name == DemandeEnCours.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeEnCours());
          } else if (settings.name == DemandeTraite.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeTraite());
          } else if (settings.name == DetailDemandeEncours.rootName) {
            return MaterialPageRoute(builder: (_) => DetailDemandeEncours());
          } else if (settings.name == DetailDemandeTraites.rootName) {
            return MaterialPageRoute(builder: (_) => DetailDemandeTraites());
          } else if (settings.name == DashboardAdmin.rootName) {
            return MaterialPageRoute(builder: (_) => DashboardAdmin());
          } else if (settings.name == DemandeEncoursAdmin.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeEncoursAdmin());
          } else if (settings.name == ListUserView.rootName) {
            return MaterialPageRoute(builder: (_) => ListUserView());
          } else if (settings.name == DetailDemandeEncoursAdmin.rootName) {
            return MaterialPageRoute(
                builder: (_) => DetailDemandeEncoursAdmin());
          }

          return null;
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => NotFoundView(),
        ),
      ),
    );
  }
}
