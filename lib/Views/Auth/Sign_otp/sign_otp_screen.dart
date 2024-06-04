import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Auth/NewPassword/newpasswordManager.dart';
import 'package:vendor_app/Views/Auth/Sign_otp/signOtpManager.dart';

class SignOtpScreen extends StatefulWidget {
  const SignOtpScreen({super.key});

  @override
  State<SignOtpScreen> createState() => _SignOtpScreenState();
}

class _SignOtpScreenState extends State<SignOtpScreen> {
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignOtpFormManager signOtpFormManager =
        Provider.of(context).fetch(SignOtpFormManager);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              const Text(
                "OTP",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
              // const Text('Please enter your new password'),
              BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),

              StreamBuilder<String>(
                  stream: signOtpFormManager.phone$,
                  builder: (context, snapshot) {
                    return IntlPhoneField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        errorText: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        labelText: 'Phone Number',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: AppColors.kGreenColor),
                        ),
                      ),
                      initialCountryCode: 'pak',
                      onChanged: (value) {
                        signOtpFormManager.inphone.add;
                      },
                    );
                  }),
              StreamBuilder<String>(
                  stream: signOtpFormManager.otp$,
                  builder: (context, snapshot) {
                    return TextFormField(
                        controller: _otpController,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          signOtpFormManager.inOtp.add(value);
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
                          prefixIcon: const Icon(Icons.code),
                          hintText: AppConstants.OTP,
                          labelText: AppConstants.OTP_LABEL,
                        ));
                  }),
              BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<Object>(
                    stream: signOtpFormManager.isSignOtpFormValid$,
                    builder: (context, snapshot) {
                      return TextBottun(
                          text: "Submit",
                          clickCallback: () {
                            if (snapshot.hasData) {
                              //  Get.offAll(() => const LoginScreen());
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
