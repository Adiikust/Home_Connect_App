import 'package:code_fields/code_fields.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';

import 'otpManager.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final int codeLength = 4;
  final _formKey = GlobalKey<FormState>();
  final CodeFieldsController _otpController = CodeFieldsController();
  @override
  Widget build(BuildContext context) {
    OTPFormManager oTPFormManager = Provider.of(context).fetch(OTPFormManager);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "We have sent an OTP to \nyour Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                const Text('Please check your email'),
                const Text('continue to reset your password'),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
                StreamBuilder<String>(
                    stream: oTPFormManager.otp$,
                    builder: (context, snapshot) {
                      return CodeFields(
                        controller: _otpController,
                        length: codeLength,
                        onChanged: (value) {
                          oTPFormManager.inOtp.add(value);
                        },
                        inputDecoration: InputDecoration(
                          errorText: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    }),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<Object>(
                      stream: oTPFormManager.isOtpFormValid$,
                      builder: (context, snapshot) {
                        return TextBottun(
                            text: "Next",
                            clickCallback: () {
                              Get.off(() => const NewPassword());
                              // if (snapshot.hasData) {
                              //   Get.off(() => const NewPassword());
                              // } else {
                              //   Get.snackbar(
                              //     "Error",
                              //     backgroundColor: AppColors.kDArkBlackColor,
                              //     "${snapshot.error}",
                              //     icon: const Icon(Icons.error_outline,
                              //         color: Colors.white),
                              //     snackPosition: SnackPosition.TOP,
                              //   );
                              // }
                            });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
