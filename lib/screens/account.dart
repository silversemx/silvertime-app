import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/user/user.dart';
import 'package:silvertime/providers/auth.dart';
import 'package:silvertime/providers/users.dart';
import 'package:silvertime/widgets/common/bottom_bar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  static const String routeName = "/account";

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  Widget _keyValue (String key, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16
      ),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text (
            key,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text (
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }

  Widget _buttons () {
    return Column (
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Provider.of<Auth> (context, listen: false).logout();
            Navigator.of (context).pushReplacementNamed("/login");
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text (
                S.of (context).logout,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: UIColors.white
                ),
              ),
            ),
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold (
        bottomNavigationBar: const BottomBar(),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container (
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FutureBuilder<User?>(
                future: Provider.of<Users> (context, listen: false).
                getUser(
                  Provider.of<Auth> (context, listen: false).userValues!.id
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text (
                              S.of (context).noInformation,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            _buttons (),
                          ],
                        ),
                      ),
                    );
                  }
                  return Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text (
                        S.of (context).yourAccount,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1
                        ),
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _keyValue(S.of (context).name, snapshot.data!.firstName),
                            const Divider (),
                            _keyValue(
                              S.of (context).lastname, 
                              snapshot.data!.lastName
                            ),
                            const Divider (),
                            _keyValue(
                              S.of (context).email, 
                              snapshot.data!.email
                            ),
                            const Divider (),
                            _keyValue(
                              S.of (context).username, 
                              snapshot.data!.username
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buttons (),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}