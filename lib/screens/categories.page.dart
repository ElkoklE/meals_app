import 'package:flutter/material.dart';
import 'package:meals_app_v2/components/category_grid_item.component.dart';

import 'package:meals_app_v2/data/data.dart';
import 'package:meals_app_v2/models/category.model.dart';
import 'package:meals_app_v2/models/meal.model.dart';
import 'package:meals_app_v2/screens/meals.page.dart';

class CategoriesPage extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoriesPage({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsPage(
          meals: filteredMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => SlideTransition(
        // position: _animationController.drive(
        //   Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0),),
        // ),
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
      child: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              onSelectCategory: () {
                _selectCategory(context, category);
              },
              category: category,
            )
        ],
      ),
    );
  }
}
