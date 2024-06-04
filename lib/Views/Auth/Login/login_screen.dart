import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Admin_Panel/Auth/admin_login_screen.dart';
import 'package:vendor_app/Views/Auth/Forgot/forgot_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'loginManager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    Overseer.statusCode = '';
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginFormManager loginFormManager =
        Provider.of(context).fetch(LoginFormManager);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  Image.asset(
                    AppImages.LOGO,
                    fit: BoxFit.cover,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  const SizedBox(
                    child: Text(
                      "Hello!\n WELCOME BACK",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  StreamBuilder<String>(
                      stream: loginFormManager.phone$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            loginFormManager.inPhone.add(value);
                          },
                          decoration: InputDecoration(
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: AppColors.kGreenColor),
                            ),
                            hintText: AppConstants.PHONE_TEXT,
                            labelText: AppConstants.PHONE,
                            prefixIcon: const Icon(Icons.phone),
                          ),
                        );
                      }),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  StreamBuilder<String>(
                      stream: loginFormManager.password$,
                      builder: (context, snapshot) {
                        return (TextFormField(
                          // obscureText: authController.isObscurePass.value,
                          controller: _passwordController,
                          onChanged: (value) {
                            loginFormManager.inPassword.add(value);
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: AppColors.kGreenColor),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: AppConstants.PASSWORD_TEXT,
                            labelText: AppConstants.PASSWORD,
                          ),
                        ));
                      }),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  StreamBuilder<Object>(
                      stream: loginFormManager.isLoginFormValid$,
                      builder: (context, snapshot) {
                        return TextBottun(
                          text: AppConstants.LOGIN,
                          clickCallback: () {
                            if (snapshot.data == true) {
                              OverlayLoader.instance.show(context);
                              {
                                loginFormManager.isLoginFormSubmit$
                                    .listen((event) {})
                                    .onDone(() {
                                  OverlayLoader.instance.hide();
                                  if (Overseer.statusCode == '200') {
                                    Get.offAll(() => const WelcomeScreen());
                                  }
                                });
                              }
                            } else {
                              if (snapshot.error == null) {
                                CustomToaster.ToasterTopError(
                                    title: "Fill the Form Properly");
                              } else {
                                CustomToaster.ToasterTopError(
                                    title: "${snapshot.error}");
                              }
                            }
                          },
                        );
                      }),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  InkWell(
                      onTap: () => Get.to(() => const ForgotScreen()),
                      child: BuildText(
                        text: AppConstants.FORGOT_PASSWORD,
                        color: AppColors.kBlackColor,
                      )),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  InkWell(
                    onTap: () => Get.to(() => const SignupScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildText(text: "Don't have an Account? "),
                        BuildText(
                          text: AppConstants.SIGN_UP,
                          color: AppColors.kBlackColor,
                        )
                      ],
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  InkWell(
                    onTap: () => Get.to(() => const AdminLoginScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildText(
                          text: "Login as a Admin",
                          color: AppColors.kGreenColor,
                          size: 18,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
