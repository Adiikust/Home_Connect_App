import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Auth/NewPassword/newpasswordManager.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NewPasswordFormManager newPasswordFormManager =
        Provider.of(context).fetch(NewPasswordFormManager);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              const Text(
                "New Password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
              const Text('Please enter your new password'),
              BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
              StreamBuilder<String>(
                  stream: newPasswordFormManager.newPassword$,
                  builder: (context, snapshot) {
                    return Obx(
                      () => (TextFormField(
                        obscureText: authController.isObscureNewPassword.value,
                        controller: _newPasswordController,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          newPasswordFormManager.inNewPassword.add(value);
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
                                    authController.isObscureNewPassword.value ==
                                            false
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                onPressed: () {
                                  authController.isObscureNewPassword();
                                })),
                      )),
                    );
                  }),
              BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<Object>(
                    stream: newPasswordFormManager.isNewPasswordFormValid$,
                    builder: (context, snapshot) {
                      return TextBottun(
                          text: "Submit",
                          clickCallback: () {
                            if (snapshot.hasData) {
                              Get.offAll(() => const LoginScreen());
                            } else {
                              Get.snackbar(
                                "Error",
                                backgroundColor: AppColors.kDArkBlackColor,
                                "${snapshot.error}",
                                icon: const Icon(Icons.error_outline,
                                    color: Colors.white),
                                snackPosition: SnackPosition.TOP,
                              );
                            }
                          });
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
