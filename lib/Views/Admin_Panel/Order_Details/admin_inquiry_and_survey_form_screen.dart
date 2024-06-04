import 'package:vendor_app/Views/Admin_Panel/Order_Details/component/Admin_Inquiry_View/admin_inquiry_view_screen.dart';
import 'package:vendor_app/Views/Admin_Panel/Order_Details/component/Admin_Survey_Form/admin_survey_form_screen.dart';

import '../../../Utils/Exports/all_exports.dart';
import 'Order_Details/admin_order_details_model.dart';

class AdminInquiryAndSurveyFormScreen extends StatefulWidget {
  final AdminOrderDetailsModel modelData;
  int modelIndex;
  AdminInquiryAndSurveyFormScreen(
      {Key? key, required this.modelData, required this.modelIndex})
      : super(key: key);

  @override
  State<AdminInquiryAndSurveyFormScreen> createState() =>
      _AdminInquiryAndSurveyFormScreenState();
}

class _AdminInquiryAndSurveyFormScreenState
    extends State<AdminInquiryAndSurveyFormScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0XffF5F5F5),
        appBar: AppBar(
          backgroundColor: AppColors.kGreenColor,
          title: Text('Admin Inquiry and Survey'),
          bottom: TabBar(
            labelColor: AppColors.kWhiteColor,
            unselectedLabelColor: AppColors.kDArkBlackColor,
            tabs: [
              Tab(text: 'Inquiry'),
              Tab(text: 'Survey'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AdminInquiryViewScreen(
              modelIndex: widget.modelIndex,
              modelData: widget.modelData,
            ),
            AdminSurveyFormScreen(
              modelIndex: widget.modelIndex,
              modelData: widget.modelData,
            ),
          ],
        ),
      ),
    );
  }
}
