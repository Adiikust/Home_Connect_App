import 'package:vendor_app/Utils/Exports/all_exports.dart';

import 'forgotManager.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ForgotFormManager forgotFormManager =
        Provider.of(context).fetch(ForgotFormManager);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.LOGO,
                    fit: BoxFit.cover,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  const SizedBox(
                    child: Text(
                      "WELCOME",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          StreamBuilder<String>(
                              stream: forgotFormManager.email$,
                              builder: (context, snapshot) {
                                return TextFormField(
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    forgotFormManager.inEmail.add(value);
                                  },
                                  decoration: InputDecoration(
                                    errorText: snapshot.error == null
                                        ? ""
                                        : snapshot.error.toString(),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: AppColors.kGreenColor),
                                    ),
                                    hintText: AppConstants.EMAIL_TEXT,
                                    labelText: AppConstants.EMAIL,
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                );
                              }),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                          StreamBuilder<Object>(
                              stream: forgotFormManager.isForgotFormValid$,
                              builder: (context, snapshot) {
                                return TextBottun(
                                  text: AppConstants.FORGOT_PASSWORD,
                                  clickCallback: () {
                                    if (snapshot.hasData) {
                                      Get.to(() => const OTPPage());
                                    } else {
                                      Get.snackbar(
                                        "Error",
                                        backgroundColor:
                                            AppColors.kDArkBlackColor,
                                        "${snapshot.error}",
                                        icon: const Icon(Icons.error_outline,
                                            color: Colors.white),
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    }
                                  },
                                );
                              }),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                          InkWell(
                            onTap: () {
                              Get.off(() => const SignupScreen());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Don't have an Account? ",
                                ),
                                Text(
                                  AppConstants.SIGN_UP,
                                  style:
                                      TextStyle(color: AppColors.kBlackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
