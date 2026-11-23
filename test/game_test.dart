import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_duellosu/oyun_kelime_duellosu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(duelloConfig.title.length, 33);
    expect(duelloConfig.tagline.length, 33);
    for (final s in duelloConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(duelloConfig.gameId, duelloId);
    expect(duelloRules.gameId, duelloId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(duelloRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: duelloId, optionalMechanics: duelloRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      duelloRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(duelloRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
