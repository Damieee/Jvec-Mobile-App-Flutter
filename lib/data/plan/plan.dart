// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'plan.g.dart';

typedef Plans = List<Plan>;

@JsonSerializable()
class Plan {
  double price;
  String description;
  String tags;
  String data_unit;
  bool renewable;
  int days_to_use;
  String title;
  int data_value;
  int profile_id;
  int id;

  Plan(
    this.price,
    this.description,
    this.tags,
    this.data_unit,
    this.renewable,
    this.days_to_use,
    this.title,
    this.data_value,
    this.profile_id,
    this.id,
  );

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
  Map<String, dynamic> toJson() => _$PlanToJson(this);
}

typedef PlanCategories = List<PlanCategory>;

class PlanCategory {
  String title;
  List<String> tips;
  List<String> tags;
  String image;
  Plans plans;

  PlanCategory({
    required this.title,
    required this.image,
    required this.tips,
    required this.tags,
    required this.plans,
  });

  static PlanCategories sortPlans(Plans plans) {
    // Wanted Categories

    PlanCategory high_speed = PlanCategory(
      title: 'High Speed Plans',
      image: 'assets/images/high_speed.png',
      tips: [
        'Up to 4 MB/S',
        '10 Simultaneous connections',
        'Pocket Friendly',
      ],
      tags: ['high'],
      plans: [],
    );

    PlanCategory super_speed = PlanCategory(
      title: 'Super Speed Plans 🔥',
      image: 'assets/images/super_speed.png',
      tips: [
        'Over 30 MB/S',
        'Up to 10 Simultaneous connections',
        'Unimited Possibilities'
      ],
      tags: ['super'],
      plans: [],
    );

    for (Plan plan in plans) {
      if (plan.tags.contains(high_speed.tags[0])) {
        high_speed.plans.add(plan);
      } else if (plan.tags.contains(super_speed.tags[0])) {
        super_speed.plans.add(plan);
      }
    }

    return [high_speed, super_speed];
  }
}
