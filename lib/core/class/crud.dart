import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
 

  Future<Either<StatusRequest, Map>> postRequest(String link, Map data) async {
    try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(link), body: data , headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> postRequestwithImage(
      String link, Map data, File file) async {
    try {
      if (await checkinternet()) {
        var request = await http.MultipartRequest("POST", Uri.parse(link));
        var filelength = await file.length();
        var stream = http.ByteStream(file.openRead());
        var requestFile = await http.MultipartFile(
            "userimage", stream, filelength,
            filename: basename(file.path));
            request.headers.addAll(myheaders) ; 
        request.files.add(requestFile);
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var sendrequest = await request.send();
        var response = await http.Response.fromStream(sendrequest);
        //var response = await http.post(Uri.parse(link), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
