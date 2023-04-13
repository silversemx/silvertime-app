import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http_request_utils/models/http_exception.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/user/auth.dart';
import 'package:silvertime/providers/auth.dart';
import 'package:silvertime/version.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthInfo _authInfo = AuthInfo.empty();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _loading = false;
  bool _success = false;
  bool _visiblePassword = true;

  void _login () async {
    unfocus(context);
    if (_formKey.currentState!.validate()) {
        setState(() {
        _loading = true;
      });
      try { 
        await Provider.of<Auth> (context, listen: false).login (_authInfo);
        setState(() {
          _success = true;
        });
        await Future.delayed(
          const Duration (seconds: 3),
          () {
            Navigator.of(context).pushReplacementNamed("/home");
          }
        );
      } on HttpException catch (error) {
        showErrorDialog(context, exception: error);
      } finally { 
        if (mounted) {
          setState(() {
            _loading = false;
          });
        }
      }
    }
  }

  Widget _form () {
    return Form (
      key: _formKey,
      child: Column (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomInputField(
            label: S.of(context).email, 
            type: TextInputType.emailAddress, 
            onChanged: (val) {
              _authInfo.email = val;
            },
            action: TextInputAction.next,
          ),
          CustomInputField(
            label: S.of(context).password, 
            type: TextInputType.visiblePassword,
            hideInput: _visiblePassword,
            autoUpdate: false,
            suffixButton: IconButton (
              padding: EdgeInsets.zero,
              icon: _visiblePassword
              ? const Icon( Icons.visibility)
              : const Icon (Icons.visibility_off),
              onPressed: (){
                setState(() {
                  _visiblePassword = !_visiblePassword;
                });
              },
            ),
            onChanged: (val) {
              _authInfo.password = val;
            },
            onCompleted: (_) {
              _login ();
            },
            action: TextInputAction.done,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: GestureDetector(
        onTap: () => unfocus(context),
        child: Container (
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero (
                tag: "logo",
                child: Image.asset (
                  "assets/logos/silvertime.png",
                  width: 48,
                  height: 48,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text (
                S.of(context).welcomeBackNoName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 48),
              _form (),
              ElevatedButton(
                onPressed: _login, 
                child: Container (
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: _success
                  ? SizedBox.square(
                    dimension: 48,
                    child: LottieBuilder.asset (
                      "assets/animations/success.json",
                      fit: BoxFit.contain,
                      repeat: false,
                    ),
                  )
                  : _loading 
                    ? const SizedBox.square(
                      dimension: 32,
                      child: SpinKitWave (
                        color: UIColors.white,
                        size: 24,
                      )
                    )
                    : Text (
                      S.of(context).login,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: UIColors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                )
              ),
              const SizedBox(height: 16),
              Text (
                "$versionName - $versionDate",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}