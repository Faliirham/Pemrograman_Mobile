import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final plansNotifier = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          final currentPlan = plans.firstWhere(
            (p) => p.name == plan.name,
            orElse: () => plan,
          );
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final maxWidth = constraints.maxWidth;
                final horizontal = maxWidth > 600 ? (maxWidth - 600) / 2 : 16.0;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  child: Column(
                    children: [
                      Expanded(child: _buildList(currentPlan)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(currentPlan.completenessMessage),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    final planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final currentPlan = plan;
        final plans = planNotifier.value;
        int planIndex = plans.indexWhere((p) => p.name == currentPlan.name);
        // Selalu gunakan versi terbaru dari provider jika ada
        final basePlan = planIndex == -1 ? currentPlan : plans[planIndex];
        final updatedTasks = List<Task>.from(basePlan.tasks)..add(const Task());

        if (planIndex == -1) {
          planNotifier.value = List<Plan>.from(plans)
            ..add(Plan(name: basePlan.name, tasks: updatedTasks));
        } else {
          planNotifier.value = List<Plan>.from(plans)
            ..[planIndex] = Plan(
              name: basePlan.name,
              tasks: updatedTasks,
            );
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    final bottomSafe = MediaQuery.of(context).viewPadding.bottom;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: bottomSafe + 96.0),
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform ==
              TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan, plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Plan currentPlan, Task task, int index, BuildContext context) {
    final planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            final plans = planNotifier.value;
            int planIndex = plans.indexWhere((p) => p.name == currentPlan.name);
            final basePlan = planIndex == -1 ? currentPlan : plans[planIndex];
            final updatedPlan = Plan(
              name: basePlan.name,
              tasks: List<Task>.from(basePlan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );

            if (planIndex == -1) {
              planNotifier.value = List<Plan>.from(plans)..add(updatedPlan);
            } else {
              planNotifier.value = List<Plan>.from(plans)
                ..[planIndex] = updatedPlan;
            }
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final plans = planNotifier.value;
          int planIndex = plans.indexWhere((p) => p.name == currentPlan.name);
          final basePlan = planIndex == -1 ? currentPlan : plans[planIndex];
          final updatedPlan = Plan(
            name: basePlan.name,
            tasks: List<Task>.from(basePlan.tasks)
              ..[index] = Task(
                description: text,
                complete: task.complete,
              ),
          );

          if (planIndex == -1) {
            planNotifier.value = List<Plan>.from(plans)..add(updatedPlan);
          } else {
            planNotifier.value = List<Plan>.from(plans)
              ..[planIndex] = updatedPlan;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}