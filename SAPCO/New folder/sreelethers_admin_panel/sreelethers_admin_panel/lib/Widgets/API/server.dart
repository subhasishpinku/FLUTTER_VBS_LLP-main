import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sreelethers_admin/Widgets/API/api_constants.dart';

class Server {
  // ---------------------------------------- creator id
  static var creatorId = 0;

  static login(email, password) async {
    var url = Uri.parse(APIConstants.login);

    try {
      var response =
          await http.post(url, body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        return {
          json.decode(response.body),

// ------------------------------------ added creator Id
          creatorId = json.decode(response.body)['details']['id']
        };
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static sentEmail(email) async {
    var url = Uri.parse(APIConstants.sentEmail);

    try {
      var response = await http.post(url, body: {
        'email': email,
      });

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static submitOtp(otp, id) async {
    print(otp);

    var url = Uri.parse(APIConstants.otp);

    try {
      var response =
          await http.post(url, body: {'otp': otp.toString(), "admin_id": "1"});

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static passwordReset(password, confirmPassword, id) async {
    var url = Uri.parse(APIConstants.passwordReset);

    try {
      var response = await http.post(url, body: {
        "password": password,
        "confirm_password": confirmPassword,
        "admin_id": "1"
      });

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static supportTicketList() async {
    var url = Uri.parse(APIConstants.supportTicktList);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static ticketDetails(id) async {
    var url = Uri.parse(APIConstants.ticketDetails + id.toString());

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
