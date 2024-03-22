import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/authentication/authentication_export.dart';
import '../homepage/models/response_models/get_all_posting_response_body.dart';
import '../homepage/models/response_models/get_posting_by_categories.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        // Add more providers if needed
      ],
      child: const SignInScreen(),
    );
  }
}

// ignore_for_file: must_be_immutable
class SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildScaffold(
        context: context,
        appbarTitle: "lbl_sign_in",
        formKey: _formKey,
        children: [
          buildIconWidget('assets/images/img_trenda_logo_up_1.png',
              size: 74.fSize, color: appThemeColors.greenA700),
          buildWidgetSpace(height: 30.h),
          Form(
            child: Column(
              children: [
                buildEmail(context),
                buildWidgetSpace(),
                buildPassword(context, validate: false),
              ],
            ),
          ),
          buildWidgetSpace(),
          buildRememberMeWithForgotPassword(context, () {
            buildNavTo(AppRoutes.forgotPasswordScreen);
          }),
          buildWidgetSpace(),
          _buildSignIn(context),
          buildWidgetSpace(),
          buildSignInWithGoogle(context),
          buildWidgetSpace(height: 80.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'msg_don_t_have_an_account'.tr,
                style: CustomTextStyles.footerTextStyle,
                textAlign: TextAlign.center,
              ),
              TextButton(
                style: CustomButtonStyles.textButtonStyle,
                onPressed: () {
                  buildNavTo(AppRoutes.signUpScreen);
                },
                child: const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void buildNavTo(String string) {
    NavigatorService.pushNamed(string);
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return Material(
      child: Consumer2<AuthenticationProvider, HomePageProvider>(
        builder: (context, provider, homeProvider, child) {
          return CustomOutlinedButton(
            text: "lbl_sign_in".tr,
            onPressed: () async {
              final email = provider.emailController.text;
              final password = provider.passwordController.text;
              AuthenticationRequestBody loginUser = AuthenticationRequestBody(
                email: email,
                password: password,
              );
              if (_validateFields(password, email)) {
                try {
                  // Execute login and data fetching synchronously
                  final results = await Future.wait([
                    provider.authenticateUser(
                        endpoints: login, authRequestBody: loginUser),
                    homeProvider.getPostingsByATTL(endpoints: getAllPosting),
                    homeProvider.getPostingByCategories()
                  ]);

                  // Extract login response and data response
                  final loginResponse =
                      results[0] as AuthenticationResponseBody;
                  final dataResponse = results[1] as GetAllPostingResponseBody;
                  final categoriesResponse =
                      results[2] as GetPostingByCategoriesResponseBody;

                  // Process login response
                  if (loginResponse.success == true) {
                    // Save access token
                    PrefUtils.saveAccessToken(loginResponse.token!);
                    // Process data response
                    NavigatorService.pushNamed(AppRoutes.homepageContainer,
                        arguments: {
                          'dataResponse': dataResponse,
                          'categoriesResponse': categoriesResponse,
                        });
                  } else {
                    debugPrint("Error: Login unsuccessful");
                    showMessage(loginResponse.error);
                  }
                } catch (e) {
                  debugPrint("Error while signing in: $e");
                  showMessage("Something went wrong");
                }
              }
            },
          );
        },
      ),
    );
  }

  bool _validateFields(String password, String email) {
    if (password.isNotEmpty && email.isNotEmpty) {
      return true;
    } else {
      showCustomSnackBar(context, 'field(s) can not be empty',
          changeBgColor: false);
      return false;
    }
  }

  void showMessage(String? message) {
    showCustomSnackBar(context, message ?? "Login unsuccessful",
        changeBgColor: false, onRetry: () {});
  }
}
