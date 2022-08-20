import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static String fNameKey = "FULLNAMEKEY";
  static String emailKey = "EMAILKEY";
  static String genderKey = "GENDERKEY";
  static String ageKey = "AGEKEY";                      //All key here
  static String heightKey = "HEIGHTKEY";
  static String weightKey = "WEIGHTKEY";
  static String loginKey = "LOGINKEY";
  static String waterKey = "WATERKEY";
  static String pBarKey = "PBARKEY";
  static String foodKey = "FOODKEY";
  static String pBarKey2 = "PBARKEY2";

//Local storage for saving data in device as cache

  static Future<bool?> saveFullName(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(fNameKey, name);
  }

  static Future<bool?> saveEmail(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(emailKey, email);
  }

  static Future<bool?> saveGender(String gender) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(genderKey, gender);
  }

  static Future<bool?> saveAge(int age) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setInt(ageKey, age);
  }

  static Future<bool?> saveHeight(double height) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setDouble(heightKey, height);
  }

  static Future<bool?> saveWeight(double weight) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setDouble(weightKey, weight);
  }

  static Future<bool?> saveLoginData(bool logdata) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(loginKey, logdata);
  }

  static Future<bool?> saveWater(int water) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setInt(waterKey, water);
  }

  static Future<bool?> savePBar(double pbar) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setDouble(pBarKey, pbar);
  }

  static Future<bool?> saveFood(int food) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setInt(foodKey, food);
  }

  static Future<bool?> savePBar2(double pbar2) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setDouble(pBarKey2, pbar2);
  }
                                                                                               //Sharedpreference works with set and get variable
  static Future<int?> getWater() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(waterKey);
  }

  static Future<double?> getPbar() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(pBarKey);
  }

  static Future<int?> getFood() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(foodKey);
  }

  static Future<double?> getPbar2() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(pBarKey2);
  }

  static Future<String?> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(fNameKey);
  }

  static Future<String?> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(emailKey);
  }

  static Future<String?> getGender() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(genderKey);
  }

  static Future<int?> getAge() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(ageKey);
  }

  static Future<double?> getHeight() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(heightKey);
  }

  static Future<double?> getWeight() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(weightKey);
  }

  static Future<bool?> getLoginData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(loginKey);
  }
}
