// ignore_for_file: prefer_const_constructors

import 'package:bluecollar/view/screens/About_Page/AboutusPage.dart';
import 'package:bluecollar/view/screens/Active_past_Workers/ActivePastWorkers.dart';
import 'package:bluecollar/view/screens/Add_Loan/AddLoan.dart';
import 'package:bluecollar/view/screens/Add_Review/AddReview.dart';
import 'package:bluecollar/view/screens/Adhoc_Loan_Details/AdhocLoanDetails.dart';
import 'package:bluecollar/view/screens/Attendance1/Attendance1.dart';
import 'package:bluecollar/view/screens/Attendance_Type_Popup/AttendanceTypePopup.dart';
import 'package:bluecollar/view/screens/Consolidate_Receipt/ConsolidateReceipt.dart';
import 'package:bluecollar/view/screens/Consolidated_Wage_Receipt/ConsolidatedWageReceipt.dart';
import 'package:bluecollar/view/screens/Customer_Reviews/CustomerReviews.dart';
import 'package:bluecollar/view/screens/Delete_Worker_Popup/DeleteWorkerPopup.dart';
import 'package:bluecollar/view/screens/Delete_Worker_Reason_For_Removal/DeleteWorkerResonForRemoval.dart';
import 'package:bluecollar/view/screens/Delete_Worker_Screen1/DeleteWorkerScreen.dart';
import 'package:bluecollar/view/screens/Edit_Payment_Mode_Screen_1/EditPaymentModeScreen.dart';
import 'package:bluecollar/view/screens/Edit_Payment_Mode_Screen_2/EditPaymentModeScreen2.dart';
import 'package:bluecollar/view/screens/Emi_Loan_Details/EmiLoanDetails.dart';
import 'package:bluecollar/view/screens/Employee_Wage_Receipt/EmployeeWageReceipt.dart';
import 'package:bluecollar/view/screens/Employer_Create_Account/EmployerCreateAccount.dart';
import 'package:bluecollar/view/screens/Employer_Create_New_Password/EmployerCreateNewPassword.dart';
import 'package:bluecollar/view/screens/Employer_Create_New_Password_pin/EmployerCreateNewPasswordPin.dart';
import 'package:bluecollar/view/screens/Employer_Forget_password/EmployerForgetpassword.dart';
import 'package:bluecollar/view/screens/Employer_Login/EmployerLogin.dart';
import 'package:bluecollar/view/screens/Employer_Wage_Receipt/EmployerWageReceipt.dart';
import 'package:bluecollar/view/screens/Faq_Page/FaqPage.dart';
import 'package:bluecollar/view/screens/HelpFeedback/HelpFeedback.dart';
import 'package:bluecollar/view/screens/Leave_Approved_Successfully/LeaveApprovedSuccessfully.dart';
import 'package:bluecollar/view/screens/Loans_Taken/LoansTaken.dart';
import 'package:bluecollar/view/screens/Logout_Pop_Up/LogoutPopup.dart';
import 'package:bluecollar/view/screens/My_Past_Workers/MyPastWorkers.dart';
import 'package:bluecollar/view/screens/Payment_Updated_Successfully/PaymentUpdateSuccessfully.dart';
import 'package:bluecollar/view/screens/Popup_Loan_Added_Successfuly/Popup_Loan_Added_Successfuly.dart';
import 'package:bluecollar/view/screens/Potential_Worker_Details/PotentialWorkerDetails.dart';
import 'package:bluecollar/view/screens/Privacy_Policy/PrivacyPolicy.dart';
import 'package:bluecollar/view/screens/Privacy_Policy2/PrivacyPolicy2.dart';
import 'package:bluecollar/view/screens/Registration2_Worker/Registration2Worker.dart';
import 'package:bluecollar/view/screens/Registration_1_Worker/Registration1_Worker.dart';
import 'package:bluecollar/view/screens/Registration_3_Worker/Registration3Worker.dart';
import 'package:bluecollar/view/screens/Registration_4_Worker/Registration4Worker.dart';
import 'package:bluecollar/view/screens/Review_Added_Successfuly/ReviewAddedSuccessfuly.dart';
import 'package:bluecollar/view/screens/Search_Page/SearchPage.dart';
import 'package:bluecollar/view/screens/Splash_Screen/SplashScreen.dart';
import 'package:bluecollar/view/screens/Terms_Of_Services/TermsofServices.dart';
import 'package:bluecollar/view/screens/Terms_of_Services2/TermsofServices2.dart';
import 'package:bluecollar/view/screens/View_Personal_Review_Rating/ViewPersonalReviewRating.dart';
import 'package:bluecollar/view/screens/Wage_Details/Wage_Details.dart';
import 'package:bluecollar/view/screens/Wage_Receipt_Confirmation/WageReceiptConfirmation.dart';
import 'package:bluecollar/view/screens/Woker_Login_Screen/WorkerLoginScreen.dart';
import 'package:bluecollar/view/screens/Worker_Added_Successfuly/WorkerAddedSuccessfuly.dart';
import 'package:bluecollar/view/screens/Worker_CreateNew_Password/WorkerCreateNewPassword.dart';
import 'package:bluecollar/view/screens/Worker_Employer_Profile/WorkerEmployerProfile.dart';
import 'package:bluecollar/view/screens/Worker_Forget_Password/WorkerForgetPassword.dart';
import 'package:bluecollar/view/screens/Worker_Home_Page/WorkerHomePage.dart';
import 'package:bluecollar/view/screens/Worker_Leave_Attendence/WorkerLeaveAttendence.dart';
import 'package:bluecollar/view/screens/Worker_Registered_Successfuly/WorkerRegisteredSuccessfuly.dart';
import 'package:bluecollar/view/screens/Worker_Wage_Details/WorkerWageDetails.dart';
import 'package:bluecollar/view/screens/Workers_Details_Variation2/WorkersDetailsVariation2.dart';
import 'package:bluecollar/view/screens/Workers_Detalis/WorkersDetalis.dart';
import 'package:bluecollar/view/screens/Workers_General_Details/WorkersGeneralDetails.dart';
import 'package:bluecollar/view/screens/Workers_Personal_Details/WokersPersonalDetails.dart';
import 'package:bluecollar/view/screens/profile/profile.dart';
import 'package:bluecollar/view/screens/tab_controller_page/tab_controller_page.dart';
import 'package:bluecollar/view/screens/worker_tab_controller_page/WorkerTabControllerPage.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(name: "/SPLASH_SCREEN", page: () => SplashScreen()),
  GetPage(name: "/EMPLOYER_LOGIN", page: () => EmployerLogin()),
  GetPage(name: "/SIGNUP", page: () => EmployerCreateAccount()),
  GetPage(name: "/FORGOT_PASSWORD", page: () => EmployerForgetpassword()),
  GetPage(name: "/NEW_PASSWORD", page: () => EmployerCreateNewPassword()),
  GetPage(
      name: "/NEW_PASSWORD_PIN", page: () => EmployerCreateNewPasswordPin()),
  GetPage(name: "/TAB_CONTROLLER_PAGE", page: () => TabControllerPage()),
  GetPage(
      name: "/WORKER_TAB_CONTROLLER", page: () => WorkerTabControllerPage()),
  GetPage(name: "/WORKERSDETALIS", page: () => WorkersDetalis()),
  GetPage(
      name: "/WORKERS_DETAILS_VARIATION2",
      page: () => WorkersDetailsVariation2()),
  GetPage(name: "/WAGE_DETAILS", page: () => WageDetails()),
  GetPage(name: "/EMPLOYER_WAGE_RECEIPT", page: () => EmployerWageReceipt()),
  GetPage(name: "/ABOUT_US", page: () => AboutUsPage()),
  GetPage(name: "/FAQ_PAGE", page: () => FaqPage()),
  GetPage(name: "/CUSTOMER_REVIEWS", page: () => CustomerReviews()),
  GetPage(name: "/ADD_REVIEWS", page: () => AddReview()),
  GetPage(name: "/ADD_LOAN", page: () => AddLoan()),
  GetPage(name: "/LOAN_TAKEN", page: () => LoansTaken()),
  GetPage(name: "/SEARCH_PAGE", page: () => SearchPage()),
  GetPage(name: "/TERMS_OF_SERVICES", page: () => TermsofServices()),
  GetPage(name: "/PRIVACY_POLICY", page: () => PrivacyPolicy()),
  GetPage(name: "/LOGOUT_POPUP", page: () => LogoutPopup()),
  GetPage(name: "/EDITPAYMENTMODE_SCREEN", page: () => EditPaymentModeScreen()),
  GetPage(
      name: "/EDITPAYMENTMODE_SCREEN2", page: () => EditPaymentModeScreen2()),
  GetPage(
      name: "/POPUP_LOANADDED_SUCCESSFULY",
      page: () => PopupLoanAddedSuccessfuly()),
  GetPage(name: "/ATTENDANCE", page: () => AttendancePage()),
  GetPage(name: "/ACTIVE_PAST_WORKERS", page: () => ActivePastWorkersPage()),
  GetPage(name: "/DELETE_WORKER_SCREEN", page: () => DeleteWorkerScreenPage()),
  GetPage(
      name: "/DELETE_WORKER_RESONFOR_REMOVAL",
      page: () => DeleteWorkerResonForRemovalPage()),
  GetPage(name: "/DELETE_WORKER_POPUP", page: () => DeleteWorkerPopupPage()),
  GetPage(
      name: "/ATTENDANCE_TYPE_POPUP", page: () => AttendanceTypePopupPage()),
  GetPage(name: "/ADHOC_LOAN_DETAILS", page: () => AdhocLoanDetailsPage()),
  GetPage(name: "/EMILOAN_DETAILS", page: () => EmiLoanDetailsPage()),
  GetPage(name: "/MY_PAST_WORKER", page: () => MyPastWorkerPage()),
  GetPage(
      name: "/POTENTIAL_WORKER_DETAILS",
      page: () => PotentialWorkerDetailsPage()),
  GetPage(
      name: "/WAGE_RECEIPT_CONFIRMATION",
      page: () => WageReceiptConfirmation()),
  GetPage(
      name: "/WORKER_ADDED_SUCCESSFULY",
      page: () => WorkerAddedSuccessfulyPage()),
  GetPage(
      name: "/WORK_REGISTERED_SUCCESSFULY",
      page: () => WorkRegisteredSuccessfulyPage()),
  GetPage(
      name: "/REVIEW_ADDED_SUCCESSFULY",
      page: () => ReviewAddedSuccessfulyPage()),
  GetPage(name: "/HELP_FEED_BACK", page: () => HelpFeedbackPage()),
  GetPage(
      name: "/PAYMENT_UPDATE_SUCCESSFULLY",
      page: () => PaymentUpdateSuccessfullyPage()),
  GetPage(
      name: "/LEAVE_APPROVED_SUCCESSFULLY",
      page: () => LeaveApprovedSuccessfullyPage()),
  GetPage(name: "/REGISTRATION1_WORKER", page: () => Registration1WorkerPage()),
  GetPage(name: "/REGISTRATION2_WORKER", page: () => Registration2WorkerPage()),
  GetPage(name: "/REGISTRATION3_WORKER", page: () => Registration3WorkerPage()),
  GetPage(name: "/REGISTRATION4_WORKER", page: () => Registration4WorkerPage()),
  GetPage(name: "/WORKER_FORGET_PASSWORD", page: () => WorkerForgetPassword()),
  GetPage(
      name: "/WORKER_CREATENEW_PASSWORD",
      page: () => WorkerCreateNewPassword()),
  GetPage(name: "/WORKER_LOGIN_SCREEN", page: () => WorkerLoginScreen()),
  GetPage(
      name: "/CONSOLIDATED_WAGE_RECEIPT",
      page: () => ConsolidatedWageReceipt()),
  GetPage(
      name: "/WORKER_EMPLOYER_PROFILE", page: () => WorkerEmployerProfile()),
  GetPage(
      name: "/WORKER_LEAVE_ATTENDANCE", page: () => WorkerLeaveAttendance()),
  GetPage(name: "/WORKER_WAGE_DETAILS", page: () => WorkerWageDetails()),
  GetPage(
      name: "/VIEW_PERSONAL_REVIEW_RATING",
      page: () => ViewPersonalReviewRating()),
  GetPage(
      name: "/WORKER_PERSONAL_DETAILS", page: () => WorkerPersonalDetails()),
  GetPage(name: "/WORKER_GENERAL_DETAILS", page: () => WorkersGeneralDetails()),
  GetPage(name: "/TERMS_OF_SERVICES2", page: () => TermsofServices2()),
  GetPage(name: "/PRIVACY_POLICY2", page: () => PrivacyPolicy2()),
  GetPage(name: "/EMLOYEE_WAGE_RECEIPT", page: () => EmployeeWageReceipt()),
  GetPage(name: "/CONSOLI_DATE_RECEIPT", page: () => ConsolidateReceipt()),
];
