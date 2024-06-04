import 'package:provider/provider.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Admin_Panel/Order_Details/Order_Details/admin_order_details_screen.dart';

import 'admin_login_service.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AdminLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
                      "Hello!\n WELCOME  TO ADMIN LOGIN",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: AppColors.kGreenColor),
                      ),
                      hintText: AppConstants.PHONE_TEXT,
                      labelText: AppConstants.PHONE,
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Phone Number';
                      }
                      if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                        return 'Please Enter a Valid Phone Number';
                      }
                      return null;
                    },
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  TextFormField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: AppColors.kGreenColor),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: AppConstants.PASSWORD_TEXT,
                      labelText: AppConstants.PASSWORD,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
                  Consumer<AdminAuthService>(
                    builder: (context, adminAuthService, child) {
                      return TextBottun(
                        text: "Admin Login",
                        clickCallback: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.kGreenColor,
                                  ),
                                );
                              },
                              barrierDismissible: false,
                            );

                            adminAuthService
                                .postAdminLoginFormData(
                                    phone:
                                        _phoneController.text.toString().trim(),
                                    password: _passwordController.text
                                        .toString()
                                        .trim(),
                                    context: context)
                                .then((value) {
                              Get.offAll(AdminOrderDetailsScreen());
                            });
                          }
                        },
                      );
                    },
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
