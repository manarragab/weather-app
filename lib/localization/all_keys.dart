import 'package:weather_app/data/const/enums.dart';

class CustomTrans {
// navigation bar
  static const String home = 'home';
  static const String myOrder = 'orders';
  static const String setting = 'setting';
  static const String myProduct = 'myProducts';

  static const String login = 'login';
  static const String createANewAccount = 'createANewAccount';
  static const String phone = 'phone number';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String send = 'send';
  static const String orBy = 'OrBy';

//dialog
  static const String cancel = 'Cancel';
  static const String yourDataHasBeenSuccessfullyModified =
      'Your data has been successfully modified';
  static const String backToMain = 'back to main';
  static const String passwordChangedSuccessfully =
      'Password changed successfully';
  static const String areYouSureYouWantToLogout =
      'Are you sure you want to log out?';
  static const String signOut = 'sign out';
  static const String successOperation = "tSuccessOperation";
  static const String goMainPage = "GoMainPage";

// error api message

  static const String somethingWentWrong = 'Oops something went wrong';
  static const String internalServerError = 'Internal server error';
  static const String badRequest = 'Bad request';
  static const String requestToAPIServerWasCancelled =
      'Request to API server was cancelled';
  static const String connectionTimeoutWithAPIServer =
      'Connection timeout with API server';
  static const String connectionToAPIServerFailedDueToInternetConnection =
      'Connection to API server failed due to internet connection';
  static const String receiveTimeoutInConnectionWithAPIServer =
      'Receive timeout in connection with API server';
  static const String sendTimeoutInConnectionWithAPIServer =
      'Send timeout in connection with API server';

// otp
  static const String resendCode = 'Resend Code';
  static const String pinIsIncorrect = 'Pin is incorrect';

// validate

  static const String mustHaveValue = 'must have value';
  static const String writePassword = 'wrong password';
  static const String wrongNumber = 'wrong number';
  static const String wrongConfirmedPassword = 'wrong confirmed password';
  static const String wrongEmail = 'Wrong Email';
  static const String writeName = 'Write Name';
  static const String writePhone = 'please WritePhone';

// intro screen
  static const String welcomeLine = 'welcomeLine';

// login screen
  static const String write = 'tWrite';
  static const String choose = 'tChoose';
  static const String forgotYourPassword = 'tForgotYourPassword';
  static const String youDontHaveAnAccount = 'tYouDon\'tHaveAnAccount';
  static const String createNewAccount = 'createNewAccount';
  static const String needToSignUpFirst = 'tNeedToSignUpFirst';

  static const String goTo = 'Go To';

// register
  static const String writeDate = 'choose your Birth Date';
  static const String youMustChoose = 'need to choose';
  static const String pleaseWrite = 'please write';

//forgetPassword
  static const String forgetScreenLine = "tForgetScreenLine";

// otpScreen
  static const String codeVerification = "tCodeVerification";
  static const String otpScreenLine =
      "Enter the code that was sent to your phone number.";
  static const String editPhoneNumber = "Edit Phone Number";
  static const String resendMsg = "Resend Msg";

// crate new password screen
  static const String crateNewPasswordScreenLine =
      "Type the new password to log in";
  static const String crateNewPassword = "CrateNewPassword";
  static const String affiliateType = "AffiliateType";
  static const String next = "Next";
  static const String governorate = "Governorate";
  static const String city = "City";
  static const String productPromotionMethod = " Product Promotion Method";
  static const String dateOfBirth = "Date of Birth";
  static const String address = "Address";
  static const String yourWebsite = "Your Website";
  static const String iDontHaveAPersonalWebsite =
      "I don't have a personal website";
  static const String iAgreeToAffiliateProgram =
      "I agree to .'s Affiliate Program";
  static const String termsAndConditions = "Terms and Conditions";
  static const String name = "Name";
  static const String fullName = "Full Name";
  static const String email = "Email";

  static const String fixedCommission = 'tFixedCommission';
  static const String freeCommission = 'tFreeCommission';
  static const String web = 'tWeb';
  static const String facebook = 'tFacebook';
  static const String twitter = 'tTwitter';
  static const String instagram = 'tInstagram';
  static const String youMustChooseTheProvinceFirst =
      "YouMustChooseTheProvinceFirst";
  static const String wrongWebSite = 'WrongWebSite';

  static const String mustChoose = 'MustChoose';
  static const String mustWrite = 'MustWrite';

// home
  static const String showAll = 'ShowAll';
  static const String addToCart = 'Add To Cart';
  static const String price = 'price';
  static const String commission = 'Commission';
  static const String notification = 'Notifications';
  static const String confirm = 'Confirm';
  static const String save = 'Save';
  static String tProductForYou = ''; // ProductType.productForYou.name;
  static String tNewProducts = ''; //ProductType.newProducts.name;
  static String tBestSelling = ''; //ProductType.bestSelling.name;

// side menu
  static const String favorite = 'tFavorite';
  static const String payment = 'tpayment';

//payment types
  static const String buyWhenDeliveredCash = 'buy when delivered cash';

  static const String buyWithCreditCard = 'buy with credit card';

  static const String buyWithVodafoneCashWallet =
      'buy with vodafone cash wallet';

  static const String supportCenter = "Support Center";
  static const String availableNow = "Available Now";

  static const String language = 'language';

  static const String categories = 'categories';
  static const String marks = 'marks';
  static const String whatDoYouSearchFor = 'what do you search for ?';
  static const String chooseTheItinerary = "Choose the itinerary";
  static const String notehasUploaded = "Note has Uploaded";
  static const String writeNotes = "Write Notes";
  static const String sendingNotes = "Sending Notes";
  static const String createItinerary = "CREATE ITINERARY";
  static const String createPlan = "Create Plan";
  static const String dailyReport = "Daily Report";
  static const String weeklyReport = "Weekly Report";
  static const String monthlyReport = "Monthly Report";
  static const String annualReport = "Annual Report";
  static const String pending = "pending";
  static const String bills = "Bills";
  static const String returns = "Returns";
  static const String receiveNotifications = "Receive notifications";
  static const String chooseAddress = "Choose Address";
  static const String listClientAddress = "List Client Address";
  static const String addNewLOCATION = "ADD NEW LOCATION";
  static const String multipleLocationOptions = "Multiple location options";
  static const String confirmReceiptOfThePayment =
      "Confirm receipt of the payment";
  static const String typeOfVisit = "Type of visit";
  static const String visit = "Visit";
  static const String inventory = "inventory";
  static const String chooseTypeOfVisit = "Choose Type of Visit";
  static const String addExpenses = "ADD EXPENSES";
  static const String errorConnection = "error connection";
  static const String reason = "Reason";
  static const String chooseClientsFirst = "Choose Clients First";
  static const String numberComplete = "Number complete";
  static const String thisDayIsaVacation = "this day is a vacation";
  static const String controlBoard = "CONTROL BOARD";
  static const String expenses = "EXPENSES";
  static const String noData = "No Data";
  static const String installment = "Installment";
  static const String chooseProductsFirst = "Choose Products First";
  static const String complete = "COMPLETE";
  static const String chooseReasonFirst = "Choose Reason First";
  static const String achieved = "Achieved";
  static const String workEndSuccessfully = "Work end Successfully";
  static const String thereIsNoAchievement = "There is no achievement";
  static const String theClientIsNotAvailable = "The client is not available";
  static const String chooseReason = "Choose Reason";
  static const String areYouSureYouWantToEndTask =
      "Are you sure you want to End Task ?";
  static const String enUA = "en_UA";
  static const String arEG = 'ar_EG';
  static const String chooseDateFirst = "Choose date first";
  static const String whyDoYouWantToPostponeTheVisitNow =
      "Why do you want to postpone the visit now?";
  static const String productMarketing = "Product Marketing";
  static const String arrive = "ARRIVE";
  static const String addReturns = "Add Returns";
  static const String addOrder = "Add Order";
  static const String addOperation = "Add Operation";
  static const String doYouWantToStartTaskNow =
      "Do you want  to start task now  ?";
  static const String companyDecisions = "Company decisions";
  static const String toyourCurrentLocation = "to your current location";
  static const String doYouWantChangeClientLocation =
      "Do you want change Client location";
  static const String cancelTask = "Cancel Task";
  static const String august = "August";
  static const String july = "July";
  static const String june = "June";
  static const String may = "May";
  static const String april = "April";
  static const String march = "March";
  static const String february = "February";
  static const String january = "January";
  static const String orders = "Orders";
  static const String notes = "Notes";
  static const String inProgress = "In Progress";
  static const String completed = "Completed";
  static const String chooseGovernmentFirst = "Choose Government First";
  static const String chooseCity = "Choose City";
  static const String chooseClientType = "choose client type";
  static const String clientType = "Client Type";
  static const String writePhoneNumber = "write phone number";
  static const String foundNoData = "Found No Data";
  static const String clientName = "client name";
  static const String reTurn = "RETURN";
  static const String pleaseChooseProductsYouWantToReturnAndTheWayOfReturns =
      "Please choose products you want to return and the way of returns";
  static const String areYouSureYouWantToReturnTheseProducts =
      "Are you sure you want to return these products ?";
  static const String numberOfMonths = "Number of months";
  static const String numberOfInstallments = "Number of installments";
  static const String clientList = "Client List";
  static const String errorTryAgain = "Error try again";
  static const String chooseClientName = "choose client name";
  static const String enterNewDate = "Enter new date";
  static const String whyYouWantCancelVisitNow =
      "Why you want cancel visit now ? ";
  static const String needToChooseClientFirst = "need to choose client first";
  static const String pleaseChooseClient = "please choose client";
  static const String cashReceipt = "Cash receipt";
  static const String newReturn = "New Return";
  static const String newOrder = "New Order";
  static const String search = "Search";
  static const String startWorkFirst = "Start work first";
  static const String chooseGovernmentAndCityFirst =
      "choose government and city first";
  static const String pleaseChooseCity = "please choose city";
  static const String government = "Government";
  static const String pleaseChooseGovernment = "please choose government";
  static const String chooseGovernment = "choose government";
  static const String pleaseEnableGpsAndPermissionAlwaysToStartWork =
      "please enable gps and permission always to start work";
  static const String endWork = "end work";
  static const String productsInfo = "PRODUCTS INFO";
  static const String removeProductsFromCart = "remove products from cart";
  static const String doYouWantToRemoveThisProductFromCart =
      "do you want to remove this product from cart ?";
  static const String errorEcurePleaseTryAgain = "Error ecure please try again";
  static const String directions = "Directions";
  static const String packageSize = "Package size";
  static const String results = "Results";
  static const String ingredients = "Ingredients";
  static const String doses = "Doses";
  static const String indications = "Indications";
  static const String addClient = "Add Client";
  static const String addVisit = "Add Visit";
  static const String addInvoice = "Add Invoice";
  static const String visits = "Visits";
  static const String clients = "Clients";
  static const String store = "Store";
  static const String noNotification = "No Notification";
  static const String dismiss = "DISMISS";
  static const String checkOut = "Check out";
  static const String checkIn = "Check in";
  static const String areYouSureYouWantToCheckOut =
      "Are you sure you want to check out ?";
  static const String areYouSureYouWantToCheckIn =
      "Are you sure you want to check in ?";
  static const String createCustomVisits = "CREATE CUSTOM VISITS";
  static const String createWeekelyPlan = "CREATE WEEKLY PLAN";
  static const String managmentNotes = "MANAGMENT NOTES";
  static const String dashboard = "dashboard";
  static const String successfullyVisited = "Successfully visited";
  static const String reports = "Reports";
  static const String yes = "YES";
  static const String no = "NO";
  static const String areYouSureYouWantToSignOut =
      "? Are you sure you want to sign out  ";
  static const String end = "end";
  static const String passwordNotMatch = "password not match";
  static const String newPassword = "new password";
  static const String sendAgain = "Send again";
  static const String completeAllFields = "Complete all fields";
  static const String enter4NumbersThatHaveBeenSentToYouOnThis =
      "Enter 4 numbers that have been sent to you on this";
  static const String activationMessage = "Activation message";
  static const String passwordNeedToMixBetweenLettersAndNumbers =
      "Password need to Mix between Letters and numbers";
  static const String errorTryConnectAgain = "error try Connect again";
  static const String tContinue = "CONTINUE";
  static const String toResetYourpassword = "to reset your password";
  static const String enterYourMobileNumberAndWeWillSendYouaCode =
      "Enter your mobile number and we will send you a code";
  static const String forgetPassword = "Forget Password";
  static const String forgotPassword = "forgot password ?";
  static const String needPassword = "need password";
  static const String needPhoneNumber = "need phone number";
  static const String loginToGetStartedWithTheAppAndEnjoyAllTheFeartures =
      "login to get started with the app and enjoy all the feartures";
  static const String welcome = "Welcome";
  static const String writeYourEmail = "write your email";
  static const String writeYourName = "write your name";
  static const String needToWriteYourName = "need to write your name";
  static const String profile = "Profile";
  static const String signIn = "Sign in";
  static const String errorConnectionPleaseCheckTheInternetAndTryAgain =
      "Error Connection Please Check the internet and try again";
  static const String changePasswordSuccessfully =
      "Change Password Successfully";
  static const String thePasswordDoesNotMatch = "The password does not match";
  static const String oldPassword = "old password";
  static const String pleaseWriteYourPassword = "please write your password";
  static const String settings = "Settings";
  static const String changePassword = "Change Password";
  static const String changeLanguage = "Change Language";
  static const String installments = "installments";
  static const String enterReason = "Enter Reason";
  static const String collected = "collected";
  static const String startWork = "start work";
  static const String createABusinessPlan = "Create a Business Plan";
  static const String administrativeNotes = "Administrative Notes";
  static const String resendMessage = "Resend Message";
  static const String
      enterYourActivationCodeAndAnActivationCodeWillBeSentToTheAccount =
      "Enter your activation code and an activation code will be sent to the account";
  static const String canNotRememberPassword = "Can't Remember Password";
  static const String andYouCanLogIn = "And you can log in";
  static const String enterEmail = "enter Email";
  static const String enterName = "Enter Name";
  static const String newClientInfo = 'New Client Info';
  static const String enterClientName = 'Enter Client Name';
  static const String enterClientType = 'Enter Client Type';
  static const String tCase = 'Case';
  static const String unComplete = 'not Complete';
  static const String cash = 'Cash';
  static const String code = 'Code';
  static const String quantity = 'Quantity';
  static const String repName = 'Rep Name';
  static const String history = 'History';
  static const String deductionFromDept = 'Deduction from debt';
  static const String merchandiseBalance = 'merchandise balance';
  static const String cashBalance = 'cash balance';
  static const String paymentMethod = 'Payment Method';
  static const String total = 'Total';
  static const String paid = 'Paid';
  static const String remain = 'Remain';
  static const String totalOrders = "Total Orders";
  static const String totalReturns = 'Total Returns';
  static const String totalOrdersAfter = 'Total orders after';
  static const String lE = "LE";
  static const String imageNotFound = "image not found";
  static const String finished = 'finish';
  static const String started = 'start';
  static const String tNew = 'new';
  static const String appointments = 'appointments';
  static const String cart = 'cart';
  static const String lastOrder = 'Last Order';
  static const String lastBill = 'Last Bill';
  static const String operation = 'Operation';
  static const String visitPurpose = 'visit purpose';
  static const String visitSummary = 'visit summary';
  static const String newVisit = 'New Visit';
  static const String workStartSuccessfully = 'Work Start Successfully';
  static const String totalBills = 'Total Bills';
  static const String pay = 'Pay';
  static const String payDirectlyToTheRepresentativeByGivingHimPaperMoney =
      'Pay directly by giving him paper money';
  static const String paymentByCheck = 'Payment by check';
  static const String writeCheck = 'Write a check';
  static const String noActionPlanToday = 'No action plan today';
  static const String hide = "hide";
  static const String totalPrice = 'Total price';
  static const String soldInsurance = 'Sold - Insurance';
  static const String soldInstallment = 'Sold - Installment';
  static const String soldCash = 'Sold - cash';
  static const String createAnInvoice = "Create an invoice";
  static const String createAnOrder = "Create an order";
  static const String sections = "Sections";
  static const String enterTheQuantityYouWantToAddFromThisProduct =
      'Enter the quantity you want to add from this product';
  static const String endPurchase = 'END PURCHASE';
  static const String continueOrder = 'CONTINUE ORDER';
  static const String makeANewOrderWithTheAmountOfMoneyOfReturnedProducts =
      'Make a new Order with the amount of money of returned products';
  static const String
      writingAChequeWithTheDemandedAmountOfMoneyAndHandingItToTheRep =
      "writing a cheque with the demanded amount of money and handing it to the Rep.";
  static const String oneTimePayment = "One time payment";
  static const String recieveCashInExchangeOfReturnedProducts =
      'Recieve cash in exchange of returned products';
  static const String recieveCash = 'Recieve cash';
  static const String moneyWillBePaidInFormerDepts =
      'Money will be paid in former depts';
  static const String payFromDept = 'Pay from dept';
  static const String afterReturn = 'After Return';
  static const String status = 'status';
  static const String offers = 'Offers';
  static const String getDiscount = 'get offers';
  static const String totalOffer = 'Total Offers';
  static const String totalAfter = "Total After";
  static const String gifts = 'gifts';
  static const String thereIsNoQuantityInStock =
      'There is no quantity in stock';
  static const String endOrder = 'endOrder';
  static const String theInventory = 'Inventory';
  static const String sales = 'Sales';
  static const String addReturn = 'Add Return';
  static const String valid = 'valid';
  static const String expired = 'expired';
  static const String damaged = 'damaged';
  static const String manufacturerDefect = 'Manufacturer Defect';
  static const String enterTheQuantityYouWantToReturnFromThisProduct =
      'Enter The Quantity You Want To Return From This Product';
  static const String theRemainderIsCreditedToTheCustomer =
      'The remainder is credited to the customer';
  static const String theRepresentativePaysCashToTheCustomer =
      'The representative pays cash to the customer';
  static const String residualcalculationMethod = 'Residual Calculation Method';
  static const String needToChooseBillFirst = 'Need To Choose Bill First';
  static const String ordersPaid = 'Orders(Paid)';
  static const String ordersProduct = 'Orders(product)';
  static const String statistics = 'statistics';
  static const String accepted = 'accepted';
  static const String done = 'done';
  static const String denied = 'denied';
  static const String intinerary = 'INTINERARY';
  static const String weeklyPlan = 'WEEKLY PLAN';
  static const String dayOFF = 'day off';
  static const String noPlan = 'no plan';
  static const String train = 'train';
  static const String notificationSetting = 'Notification Settting';
  static const String rangeOFNotification = 'Range of Notification';
  static const String notifications = 'notifications';
  static const String title = "title";
  static const String fromVacation = 'fromVacation';
  static const String toVacation = 'toVacation';
  static const String vacation = 'vacation';
  static const String enterHistory = 'choose data';
  static const String cashTotal = 'cach_total';
  static const String category = 'Category';
  static const String count = 'Count';
  static const String chitCash = 'chit cash';
  static const String number = 'number';
  static const String storeMovement = 'storeMovement';
  static const String movements = 'movements';
  static const String chooseDevice = 'choose device';
  static const String printe = 'print';
  static const String remove = 'remove';
  static const String wasTheProductSamplesDeliveredToTheCustomer =
      'Was the product samples delivered to the customer?';
  static const String decision = 'decision';
  static const String add = 'Add';
  static const String printerName = 'printerName';
  static const String printerPassword = 'printer Password';
  static const String addInventory = 'addInventory';
  static const String needToPickImageFirst = 'needToPickImageFirst';
  static const String purposeOfVisit = 'purpose of visit';
  static const String editVisitPurpose = 'Edit Visit Purpose';
  static const String unKnownDevices = 'unKnownDevices';
  static const String wallet = 'wallet';
  static const String walletCredit = 'walletCredit';
  static const String amount = 'amount';
  static const String walletDeposit = 'wallet deposit';
  static const String withdrawFromWallet = 'Withdraw from wallet';
  static const String cashDeposit = 'cash deposit';
  static const String depositUsingCheck = 'Deposit using check';
  static const String cashWithdrawal = 'cash withdrawal';
  static const String checkNumber = 'checkNumber';
  static const String dueDate = 'due date';
  static const String call = 'call';
  static const String sms = 'sms';
  static const String whatsapp = 'whatsapp';
  static const String doYouWantToGoToMaps = 'Do you want to go to Maps';
  static const String theNumberMustBeGreaterThanZero =
      'The number must be greater than 0';
  static const String fastPay = 'fast pay';
  static const String fastPayExplain = 'fastPayExplain';
  static const String products = 'products';
  static const String endReturn = 'End Return';
  static const String writeNumber = 'write Number';
  static const String discountDetails = "Discount Details";
  static const String discountforClient = 'discount for Client';
  static const String offer = 'offer';
  static const String removedFromTheCart = 'remove from the cart';
  static const String addedToTheCart = 'added to the cart';
  static const String addedToOrdersSuccessfully =
      'added To Orders Successfully';
  static const String settingPrint = 'printers';
  static const String returnHasBeenAddedSuccessfully =
      'returnHasBeenAddedSuccessfully';
  static const String payTheAmountPaid = 'Pay the amount paid';
  static const String selectPaymentType = 'select payment type';
  static const String selectPaymentMethod = 'select payment method';
  static const String indebtedness = 'indebtedness';
  static const String collections = 'collections';
  static const String quarterlyReport = 'Quarterly Report';
  static const String loginSuccess = 'Login successfully';
  static const String logoutSuccess = 'Logout Successfully';
  static const String paidByWallet = 'المدفوع من المحفظة';
  static const String paidInCash = 'paid in cash';
  static const String pleaseActivateLocation =
      'please activate location needed for app';
  static const String locationPermission = 'Location Permission';
  static const String covenant = 'covenant';
  static const String instructions = 'instructions';
  static const String canceled = 'canceled';
  static const String shipmentNote = 'shipmentDescription';
  static const String chooseCancelReason = 'chooseCancelReason';
  static const String waitingToRecord = 'waiting to record';
  static const String addImage = 'add image';
  static const String policyNumber = 'Policy number';
  static const String shipmentDescription = 'shipment description';
  static const String notesOnTheShipment = 'Notes on the Shipment';
  static const String customerName = 'customer name';
  static const String supplierDetails = 'Supplier Details';
  static const String prepaid = 'prepaid';
  static const String delayedOrder = 'laterOrder';
  static const String orderDeliver = 'orderDeliever';
  static const String endWorkFirst = 'endWorkFirst';
  static const String doYouWantToContact = 'doYouWantToContact';

  static const String forgetPasswordWord = "forgetPasswordWord";
  static const String forgetPasswordLine = "forgetPasswordLine";

  static const String alreadyHaveAnAccount = "alreadyHaveAnAccount";

  static const String createPasswordLine = "createPasswordLine";

  static const String off = "off";

  static const String selectDateAndTime = "selectDateAndTime";

  static const String reOrder = "reOrder";

  static const String sellerRate = "seller rate";

  static const String rateTheProduct = "rate product";

  static const String rateRep = "rate rep";

  static const String ok = 'ok';
  static const String all_right = 'all_right';
  static const String Welcome = 'Welcome';
  static const String our_values = 'our_values';
  static const String services = 'Services';
  static const String about_us = 'about_us';
  static const String branches = 'branches';
  static const String contact_us = 'contact_us';
  static const String click_here = 'click_here';
  static const String startServiceAs = 'startServiceAs';
  static const String guest = 'guest';
  static const String employee = 'employee';
  static const String go = 'go';
  static const String CompanyAddress = 'CompanyAddress';
  static const String CustomerServices = 'CustomerServices';
  static const String Office = 'Office';
  static const String Email = 'Email';
  static const String find_us = 'find_us';
  static const String more = 'more';
  static const String website_full_version = 'website_full_version';
  static const String privacy_policy = 'privacy_policy';
  static const String terms_and_cond = 'terms_and_cond';
  static const String powered_by = 'powered_by';
  static const String create_new_ticket = 'create_new_ticket';
  static const String mobile = 'mobile';
  static const String send_verification = 'send_verification';
  static const String id = 'id';
  static const String sorry_your_id = 'sorry_your_id';
  static const String to_help_us = 'to_help_us';
  static const String please_complete = 'please_complete';
  static const String select_city = 'select_city';
  static const String select_branch = 'select_branch';
  static const String select_category = 'select_category';
  static const String details = 'details';
  static const String select_attachment = 'select_attachment';
  static const String agree_privacy_policy = 'agree_privacy_policy';
  static const String error = 'error';
  static const String required = 'required';
  static const String this_is_not_email = 'this_is_not_email';
  static const String please_enter_otp = 'please_enter_otp';
  static const String press_to_record = 'press_to_record';
  static const String stop = 'stop';
  static const String press_to_stop = 'press_to_stop';
  static const String files = 'files';
  static const String all_fields_required = 'all_fields_required';
  static const String full_name = 'full_name';
  static const String success = 'success';
  static const String sendMail = 'sendMail';
  static const String mail = 'mail';
  static const String you_should_select_city = 'you_should_select_city';
  static const String ourVission = 'ourVission';
  static const String ourMission = 'ourMission';
  static const String secondes = 'secondes';
  static const String createTicket = 'createTicket';
  static const String logout = 'logout';
  static const String signUp = 'signUp';
  static const String mobileEmail = 'mobileEmail';
  static const String mobileNumber = 'mobileNumber';
  static const String emailAddress = 'emailAddress';
  static const String selectNationality = 'selectNationality';
  static const String selectCity = 'selectCity';
  static const String selectRegion = 'selectRegion';
  static const String completeAsGuest = 'completeAsGuest';
  static const String pleaseEnter = 'pleaseEnter';

  static const String visitUsNow = 'visitUsNow';
  static const String swipeLeft = 'swipeLeft';
  static const String scanQRCode = 'scanQRCode';
  static const String showDefaultCards = 'showDefaultCards';
  static const String bookService = 'bookService';
  static const String orderTank = 'orderPetroleum';
  static const String cards = 'cards';
  static const String showBarcode = 'showBarcode';
  static const String addBalance = 'addBalance';
  static const String management = 'management';
  static const String transactions = 'transactions';
  static const String holderType = 'holderType';
  static const String holderName = 'holderName';
  static const String holderMobile = 'holderMobile';
  static const String holderEmail = 'holderEmail';
  static const String carType = 'carType';
  static const String carStatus = 'carStatus';
  static const String carModel = 'carModel';
  static const String lastUpdate = 'lastUpdate';
  static const String edit = 'edit';
  static const String cardHistory = 'cardHistory';
  static const String tank = 'tank';
  static const String myAccount = 'myAccount';
  static const String bookings = 'bookings';
  static const String bookNow = 'bookNow';
  static const String orderNow = 'orderNow';
  static const String startTrip = 'startTrip';
  static const String viewTrip = 'viewTrip';
  static const String safetyReport = 'safetyReport';
  static const String checkSafety = 'checkSafety';
  static const String redeemIt = 'redeemIt';
  static const String points = 'points';
  static const String point = 'point';
  static const String accountHistory = 'accountHistory';
  static const String carDetails = 'carDetails';
  static const String uploadCarImage = 'uploadCarImage';
  static const String itWillBeUsedFor = 'itWillBeUsedFor';
  static const String selectUserType = 'selectUserType';
  static const String serialNumber = 'vehicleModelId';
  static const String vehicleColor = 'vehicleColor';
  static const String selectCardColor = 'selectCardColor';
  static const String newCard = 'newCard';
  static const String personalDetails = 'Holder Details';
  static const String create = 'create';
  static const String full_name_should_have_space =
      'full_name_should_have_space';
  static const String mobile_number_should_be_10_digits =
      'mobile_number_should_be_10_digits';
  static const String vehicleData = "vehicleData";
  static const String assignAsDefaultCard = "assignAsDefaultCard";

  static const String km = "km";

  static const String notificationTitle =
      'The notifications that occurred during the last 30 days are displayed';

  static const String ourWebsites = 'our website';
  static const String fullVersion = 'full version';

  static const String about = "about";

  static const String menu = "menu";

  static const String delete = "Delete";

  static const String hey = 'Hey ';

  static const String saudiRiyal = "Saudi Riyal";

  static const String time = "Time";

  static const String noTimeAvailable = "no time available";

  static const String noCardSelected = "no card selected";

  static const String mySelf = 'myself';
  static const String other = 'other';

  static const String year = "year";

  static const String balance = 'balance';
  static const String packages = 'packages';

  static const String purchaseItNow = 'purchase it now';

  static const String cardNotCreatedYet = 'card not created yet';

  static const String update = 'update';

  static const String improveYourExperience = "Improve your experience";

  static const String activation = "activation";

  static const String redeemPoints = "Redeem Points";

  static const String currentPoints = "Current Points";
  static const String selectCard = "Select Card";
  static const String redeem = "Redeem";
  static const String addToTheSelectedCard = "Add to the selected card";
  static const String today = "Today";
  static const String rate = "rate";

  static const String select = "select";

  static const String service = "Service";
  static const String book = "Book";

  static const String description = "description";

  static const String bookingTime = "Booking time";

  static const String accessLine = "You don't have access to this section";

  static const String date = "Date";

  static const String branch = "branch";

  static const String mustCreateNewCard = "must create new card";

  static const String cardDetails = "card details";

  static const String pricePerLitre = "price per litre";

  static const String totalPayment = "total payment";

  static const String theNumberIsGreaterThanTheBalance =
      "theNumberIsGreaterThanTheBalance";

  static const String filter = "filter";

  static const String ownerName = "owner_name";

  static const String applySafety = "apply safety";

  static const String confirmStep = "confirm_step";
  static const String stepMessage = "are you sure you have complete this step";

  static const String needLogin = 'Please login to use this feature';
  static const String needLoginHome = 'Please Login to access all app features';
  static const String needLoginHomeButton = 'Login/Sign Up';

  static const String needUpdateProfile = "need-update-profile";
  static const String propertyTypes = "propertyTypes";
  static const String districts = "districts";
  static const String facilities = "facilities";
  static const String interfaces = "interfaces";
  static const String properties = "properties";

  static const String clearFilter = "clear_filter";

  static const String blogs = "blogs";

  static final String contactAgent = ItemInfoType.contactAgent.name;
  static final String sendLocation = ItemInfoType.sendLocation.name;

  static const String vision = "vision";

  static const String message = "message";
  static const String contractType = "contract_type";
  static const String contact = "contact";
  static const String advertiseNo = "advertise_number";

  static const String chat = "Chat";
  static const String items = "Items";
  static const String map = "map";
  static const String showInMap = "show in map";
  static const String leads = "leads";

  static const String interest = "interest";
  static const String actions = "actions";
  static const String replyToLeads = "reply To Leads";
  static const String updateInterest = "update Interest";
  static const String employees = "employees";
  static const String startSession = "start session";
  static const String employeesMenu = "Staff Screen";
  static const String change = "change";
  static const String to = "to";
  static const String auctions = "auctions";
  static const String units = "units";
  static const String type = "type";
  static const String deposit = "deposit";

  static const String verificationCode = 'verificationCode';
  static const String enterVerificationCodeLine = 'enterVerificationCodeLine';

  static const String verify = "verify";
  static const String myTeam = "my Team";
  static const String member = "member";
  static const String invitation = "invitation";
  static const String tripDetails = "trip details";
  static const String tripNumber = "trip number";
  static const String tripTime = "trip time";
  static const String tripHistory = "trip history";
  static const String tripDate = "trip date";
  static const String passengers = "Passengers";
  static const String driver = "driver";

  static const String plateNumber = "plate number";

  static const String setPassword = "Set Password";

  static const String setPasswordLine = "Set a password for your email account";

  static const String skip = "skip";

  static const String rememberMe = "rememeberMe";

  static const String invitationCode = "Invitation code (optional)";

  static const String termsAndConditionsFirstLine =
      "termsAndConditionsFirstLine";
  static const String terms = "terms";
  static const String and = "and";
  static const String conditions = "conditions";

  static const String registerLine = "register_line";

  static const String subscribe = "subscribe";
  static const String promotions = "promotions";
  static const String ads = "ads";
  static const String requiredData = "required_data";
  static const String completeData = "complete_data";
  static const String mainVerifyTitle = "main_verify_title";

  static const String completeTheBasicInformation =
      "Complete the basic information";
  static const String enterYourRequiredPersonalData =
      "Enter your required personal data";
  static const String confirmIdentity = "Confirm identity";
  static const String uploadYourIdentityDocumentsToConfirmTheAccount =
      "Upload your identity documents to confirm the account";

  static const String
      completeYourDataAndConfirmYourIdentityToFullyActivateYourAccount =
      "Complete your data and confirm your identity to fully activate your account";

  static const String completeDataVerify = 'completeDataVerify';
  static const String enjoyExtraProtection = 'enjoyExtraProtection';
  static const String getAccessToAllFeatures = 'getAccessToAllFeatures';
  static const String trackYourEarnings = 'trackYourEarnings';
  static const String enhanceTrust = 'enhanceTrust';

  static const String pleaseEnterBasicInfo =
      'pleaseEnterBasicInfo'; // يرجى إدخال البيانات الأساسية لضمان تجربة استخدام أفضل وخدمات مخصصة لحسابك
  static const String step1 = 'step1'; // الخطوة الأولى
  static const String step2 = 'step2'; // الخطوة الثانية
  static const String step3 = 'step3'; // الخطوة الثالثة
  static const String firstName = 'firstName'; // الاسم الأول
  static const String lastName = 'lastName'; // الاسم الأخير
  static const String gender = 'gender'; // الجنس
  static const String country = 'country'; // الدولة

  static const String basicData = 'basicData';
  static const String contactInformation = 'contactInformation';
  static const String identityVerification = 'identityVerification';
  static const String reviewAndConfirmData = 'reviewAndConfirmData';

  // New translations for the identity verification screen
  static const String identityVerificationTitle = 'Identity Verification';
  static const String improveAccountSecurity =
      'To improve your account security and provide a better experience, we need to verify your identity. Please follow the following steps:';
  static const String identityStep = 'Identity Step';
  static const String verificationStep = 'Verification Step';
  static const String confirmationStep = 'Confirmation Step';
  static const String captureIDPhoto = 'Capture ID Photo';
  static const String ensureIDVisibility =
      'Ensure that the entire ID card or passport is visible in the photo.';
  static const String avoidShadowsAndReflections =
      'Avoid shadows or reflections that may obscure the text.';
  static const String takeFlatPhoto =
      'Take a photo of the card flat (horizontal or vertical) without tilting it.';
  static const String clearPhoto =
      'The photo should be clear and free of any blur or obstructions.';
  static const String idCard = 'idCard';
  static const String passport = 'passport';
  static const String driversLicense = 'driversLicense';
  static const String uploadIDInstructions = 'uploadIDInstructions';

  static const String idPhotoUploadInstructions = 'idPhotoUploadInstructions';
  static const String officialGovernmentID = 'officialGovernmentID';
  static const String recentAndClearPhoto = 'recentAndClearPhoto';
  static const String noFiltersOrEdits = 'noFiltersOrEdits';
  static const String fullFaceVisibility = 'fullFaceVisibility';
  static const String dataSubmittedSuccessfully = 'dataSubmittedSuccessfully';

  static const String yourFamilyHealthInYourHands =
      'yourFamilyHealthInYourHands';
  static const String keepTrackOfYourHealth = 'keepTrackOfYourHealth';
  static const String symptomCheckersAndLibrary = 'symptomCheckersAndLibrary';
  static const String toExploreOurAllTheFeatures = 'toExploreOurAllTheFeatures';
  static const String signInNow = 'signInNow';
  static const String ifYouDontHaveAnyAccount = 'ifYouDontHaveAnyAccount';
  static const String createANewOne = 'createANewOne';
  static const String toCreateNewPasswordPlease = 'toCreateNewPasswordPlease';
  static const String followTheInstruction = 'followTheInstruction';
  static const String emailOrPhone = 'emailOrPhone';
  static const String show = 'show';
  static const String getCode = 'getCode';
  static const String or = 'or';
  static const String agreeToTermAndConditions = 'agreeToTermAndConditions';
  static const String signInWithGoogle = 'signInWithGoogle';
  static const String subscribeOurNewsletter = 'subscribeOurNewsletter';
  static const String iDontHaveAnAccountSignUp = 'iDontHaveAnAccountSignUp';
  static const String iAlreadyHaveAnAccountLogin = 'iAlreadyHaveAnAccountLogin';
  static const String varification = 'varification';
  static const String pleaseEnterTheVerificationCodeAndExploreTheWorld =
      'pleaseEnterTheVerificationCodeAndExploreTheWorld';
  static const String resendTheCode = 'resendTheCode';
  static const String thePasswordWasChangedSuccessfully =
      'thePasswordWasChangedSuccessfully';
  static const String backToHome = 'backToHome';

  static const String resetPassword = 'resetPassword';
  static const String enterTheNewPassword = 'enterTheNewPassword';

  static const String myGroup = "My Group";

//todo need to translate

//Alarm 
  static const String myAlarm = "My Alarm";
  static const String newAlarm = "New Alarm";
  static const String addAlarm = "Add Alarm";
  static const String BacktoHome = "Back to Home";

//calculation
  static const String medicalCalc = "Medical calculations";
  static const String dueDateCalc = "Medical calculations";
  static const String calculate = "Calculate";
  static const String next2 = "Next";
  static const String calculating = "Calculating";
  static const String back = "Back";

    static const String myFamily = "My Family";
    static const String family = "Family";
  static const String Pils="Pils";
  
    static const String Profile = "profile";
    static const String logOut = "Log Out";
    static const String followUp = "Follow Up";
    static const String record = "Record";
    static const String progressTracker = "Progress Tracker";
    static const String photoTracker = "Photo Tracker";
static const String AddHabitTracking="Add habit tracking";
    static const String habitTracker = "Habit Tracking";
        static const String AddHabitBreaker = "Add Habit Breaker";

    static const String habitBreaker = "Habit Breaker";

  static const String needToAccept = "need to accept";

  static const String Areyousureyouwanttodeletehabittracking=  "Are you sure you want to delete habit tracking?";

  static const String arabic = "Arabic";
  static const String englisg = "English";
    static const String location = "Location";
   static const String precipitation = "Precipitation";
   static const String humidity = "Humidity";
   static const String windSpeed = "Wind Speed";
   static const String dayForecast = "3 Day Forecast";


  
  

}
