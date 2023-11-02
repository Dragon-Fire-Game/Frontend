import 'dart:convert';
import 'package:frontend/models/ranking_models/my_ranking_model.dart';
import 'package:frontend/utils/token_control.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/models/ranking_models/total_ranking_model.dart';

class RankingApiServices {
  static const String baseUrl = 'https://k9a209.p.ssafy.io/api';

  // 현재 주차 전체 랭킹, token 불필요
  static Future<List<TotalRankingModel>?> getCurrentSeasonTotalRanking() async {
    try {
      List<TotalRankingModel> totalRankingInstances = [];
      final url = Uri.parse('$baseUrl/rank');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonString = utf8.decode(response.bodyBytes);
        final totalRankings = jsonDecode(jsonString);
        for (int i = 0; i < 100 && i < totalRankings.length; i++) {
          totalRankingInstances
              .add(TotalRankingModel.fromJson(totalRankings[i]));
        }
        return totalRankingInstances;
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  // 내 랭킹 정보 가져오기
  static Future<MyRankingModel?> getMyRanking() async {
    Map<String, String> token = await TokenControl.readToken();
    try {
      final url = Uri.parse('$baseUrl/rank/my');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token['Authorization']}',
      });
      if (response.statusCode == 200 && response.contentLength != 0) {
        var jsonString = utf8.decode(response.bodyBytes);
        final myRanking = jsonDecode(jsonString);
        return MyRankingModel.fromJson(myRanking);
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
