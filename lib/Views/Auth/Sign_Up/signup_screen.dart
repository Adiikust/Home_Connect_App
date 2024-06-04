import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Auth/Sign_Up/signupManager.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignUpFormManager signUpFormManager =
        Provider.of(context).fetch(SignUpFormManager);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.LOGO,
                    fit: BoxFit.cover,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  const SizedBox(
                    child: Text(
                      "WELCOME",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  StreamBuilder<String>(
                      stream: signUpFormManager.name$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            signUpFormManager.inName.add(value);
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
                            hintText: AppConstants.USER_NAME,
                            labelText: AppConstants.NAME,
                            prefixIcon: const Icon(Icons.person),
                          ),
                        );
                      }),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  StreamBuilder<String>(
                      stream: signUpFormManager.email$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            signUpFormManager.inEmail.add(value);
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
                            hintText: AppConstants.EMAIL_TEXT,
                            labelText: AppConstants.EMAIL,
                            prefixIcon: const Icon(Icons.person),
                          ),
                        );
                      }),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  StreamBuilder<String>(
                      stream: signUpFormManager.phoneNumber$,
                      builder: (context, snapshot) {
                        return TextFormField(
                            controller: _phoneController,
                            onChanged: (value) {
                              signUpFormManager.inPhoneNumber.add(value);
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
                              prefixIcon: const Icon(Icons.phone),
                              hintText: AppConstants.PHONE_TEXT,
                              labelText: AppConstants.PHONE,
                            ));
                      }),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  StreamBuilder<String>(
                      stream: signUpFormManager.password$,
                      builder: (context, snapshot) {
                        return Obx(
                          () => (TextFormField(
                            obscureText: authController.isObscureConPass.value,
                            controller: _passwordController,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              signUpFormManager.inPassword.add(value);
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
                                prefixIcon: const Icon(Icons.lock),
                                hintText: AppConstants.PASSWORD_TEXT,
                                labelText: AppConstants.PASSWORD,
                                suffixIcon: IconButton(
                                    icon: Icon(
                                        authController.isObscureConPass.value ==
                                                false
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                    onPressed: () {
                                      authController.obscureConformPassword();
                                    })),
                          )),
                        );
                      }),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  //ToDO:button press validation
                  StreamBuilder<Object>(
                      stream: signUpFormManager.isSignUpFormValid$,
                      builder: (context, snapshot) {
                        return TextBottun(
                          text: AppConstants.SIGN_UP,
                          clickCallback: () {
                            if (snapshot.data == true) {
                              OverlayLoader.instance.show(context);
                              {
                                signUpFormManager.isSignUpFormSubmit$
                                    .listen((event) {})
                                    .onDone(() {
                                  OverlayLoader.instance.hide();
                                  if (Overseer.statusCode == '200') {
                                    Get.offAll(() => const LoginScreen());
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
                    onTap: () => Get.offAll(() => const LoginScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Already have account? "),
                        Text(
                          AppConstants.LOGIN,
                          style: TextStyle(color: AppColors.kGreenColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
