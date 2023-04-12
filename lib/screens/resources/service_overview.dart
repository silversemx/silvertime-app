import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/overview/overview.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/models/resources/service/service_instance.dart';
import 'package:silvertime/models/status/interruption/interruption.dart';
import 'package:silvertime/models/status/maintenance/maintenance.dart';
import 'package:silvertime/models/user/user.dart';
import 'package:silvertime/providers/status/interruptions.dart';
import 'package:silvertime/providers/status/maintenances.dart';
import 'package:silvertime/providers/users.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/in_app_messages/status_update_dialog.dart';
import 'package:silvertime/widgets/quill/quill_reader.dart';

class ServiceOverviewScreen extends StatefulWidget {
  final OverviewData data;
  final Service service;
  final List<ServiceInstance> instances;
  const ServiceOverviewScreen({
    super.key, 
    required this.service,
    required this.instances,
    required this.data
  });
  static const String routeName = "/service/overview";

  @override
  State<ServiceOverviewScreen> createState() => _ServiceOverviewScreenState();
}

class _ServiceOverviewScreenState extends State<ServiceOverviewScreen> {
  late Service service = widget.service;
  InterruptionStatus interruptionFilter = InterruptionStatus.none;
  InterruptionStatus instancesFilter = InterruptionStatus.none;
  MaintenanceStatus maintenanceFilter = MaintenanceStatus.none;

  Widget _serviceData () {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text (
            "${S.of (context).alias}: ${service.alias}",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text (
            "${S.of (context).type}: ${service.type.name (context)}",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Container(
            decoration: containerDecoration,
            padding: const EdgeInsets.all(16),
            child: QuillReaderWidget(
              value: service.description
            ),
          )
        ],
      ),
    );
  }
  
  Widget _interruptionRange (Interruption interruption) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text (
            interruption.start.hourString,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Expanded (
            child: Divider (
              indent: 16,
              endIndent: 16,
            ),
          ),
          Visibility (
            visible: interruption.status.index 
              >= InterruptionStatus.solved.index,
            child: Text (
              interruption.end?.hourString ?? "N/A",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }

  Widget _richValue (String key, String value) {
    return RichText (
      text: TextSpan (
        text: key,
        style: Theme.of(context).textTheme.displaySmall,
        children: [
          const TextSpan (
            text: ": "
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyLarge
          )
        ]
      ),
    );
  }

  Widget _interruptionTypes (Interruption interruption) {
    return Container (
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: containerDecoration.copyWith(
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      width: double.infinity,
      child: Wrap (
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: [
          _richValue(
            S.of(context).execution, 
            interruption.execution.name(context)
          ),
          _richValue(
            S.of(context).exit, 
            interruption.exit.name(context)
          ),
          _richValue(
            S.of(context).scope, 
            interruption.scope.name(context)
          ),
          
        ],
      ),
    );
  }

  Widget _instanceData (ServiceInstance instance) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text (
          "${S.of(context).instance}: ${instance.name}",
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }

  Widget _interruption (Interruption interruption, [ServiceInstance? instance]) {
    return Column (
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        instance != null
        ? _instanceData (instance)
        : Container (),
        const SizedBox(height: 16),
        _interruptionRange (interruption),
        const SizedBox(height: 16),
        InkWell(
          onTap: () {
            showDialog (
              context: context,
              builder: (ctx) => StatusUpdateDialog<InterruptionStatus>(
                values: InterruptionStatus.values, 
                getWidget: (val) => val.widget(context), 
                getHistory: () => Provider.of<Interruptions>  (
                  context, listen: false
                ).getInterruptionStatusHistory (interruption.id),
                text: true,
              )
            );
          },
          child: Center(
            child: interruption.status.widget(context)
          ),
        ),
        const SizedBox(height: 16),
        Text (
          interruption.title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        _interruptionTypes(interruption),
        Text (
          S.of (context).description,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 4),
        interruption.description.isNotEmpty
        ? Container(
          padding: const EdgeInsets.all(16),
          decoration: containerDecoration.copyWith(
            color: UIColors.hint.withOpacity(0.05)
          ),
          child: QuillReaderWidget (
            value: interruption.description
          ),
        )
        : Text (
          S.of(context).noInformation,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text (
          S.of (context).solution,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 4),
        (interruption.solution?.isNotEmpty ?? false)
        ? Container(
          padding: const EdgeInsets.all(16),
          decoration: containerDecoration.copyWith(
            color: UIColors.inputSuccess.withOpacity(0.2),
          ),
          child: QuillReaderWidget (
              value: interruption.solution
            ),
        )
        : Text (
          S.of(context).noInformation,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16)
      ],
    );
  }

  Widget _interruptionsTitle () {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16
        ),
        decoration: BoxDecoration (
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only (
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)
          )
        ),
        child: ExpansionTile (
          title: Text (
            S.of (context).majorInterruptions,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          childrenPadding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 16),
            CustomDropdownFormField<InterruptionStatus> (
              value: interruptionFilter,
              items: InterruptionStatus.values,
              label: S.of (context).filter,
              name: (val) => "${val.name(context)} ${val.emoji}",
              onChanged: (val) {
                setState(() {
                  interruptionFilter = val!;
                });
              },
              validation: false,
            )
          ],
        )
      ),
    );
  }

  Widget _majorInterruptions () {
    return SliverStickyHeader(
      header: _interruptionsTitle(),
      overlapsContent: false,
      sticky: true,
      sliver: SliverToBoxAdapter (
        child: Container (
          padding: const EdgeInsets.all(16),
          decoration: containerDecoration,
          child: Column (
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text (
                widget.data.date.dateString,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              Builder(
                builder: (context) {
                  List<Interruption> interruptions = widget.data.interruptions
                  .where (
                    (interruption) => interruptionFilter == InterruptionStatus.none 
                      || interruption.status == interruptionFilter
                  )
                  .toList ();
                  if (interruptions.isEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text (
                            S.of(context).noInformation,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 16),
                          Visibility(
                            visible: widget.data.interruptions.isEmpty,
                            child: Text (
                              "🎉", 
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return ListView.builder (
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics (),
                    itemCount: interruptions.length + 1,
                    itemBuilder: (ctx, i) {
                      if (i == interruptions.length) {
                        return const SizedBox (
                          height: 16,
                        );
                      }
                      Interruption interruption = interruptions [i];
                      return _interruption(interruption);
                    },
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _instancesTitle () {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16
        ),
        decoration: BoxDecoration (
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only (
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)
          )
        ),
        child: ExpansionTile (
          title: Text (
            S.of (context).instanceInterruptions,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          childrenPadding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 16),
            CustomDropdownFormField<InterruptionStatus> (
              value: instancesFilter,
              items: InterruptionStatus.values,
              label: S.of (context).filter,
              name: (val) => "${val.name(context)} ${val.emoji}",
              onChanged: (val) {
                setState(() {
                  instancesFilter = val!;
                });
              },
              validation: false,
            )
          ],
        )
      ),
    );
  }

  Widget _instanceInterruptions () {
    return SliverStickyHeader(
      header: _instancesTitle(),
      overlapsContent: false,
      sticky: true,
      sliver: SliverToBoxAdapter (
        child: Container (
          padding: const EdgeInsets.all(16),
          decoration: containerDecoration,
          child: Column (
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text (
                widget.data.date.dateString,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              Builder(
                builder: (context) {
                  List<Interruption> instances = widget.data.instances
                  .where (
                    (interruption) => instancesFilter == InterruptionStatus.none 
                      || interruption.status == instancesFilter
                  )
                  .toList ();

                  if (instances.isEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text (
                            S.of(context).noInformation,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 16),
                          Visibility (
                            visible: 
                              widget.data.instances.isEmpty,
                            child: Text (
                              "🎉", 
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  

                  return ListView.builder (
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics (),
                    itemCount: instances.length + 1,
                    itemBuilder: (ctx, i) {
                      if (i == instances.length) {
                        return const SizedBox (
                          height: 16,
                        );
                      }
                      Interruption interruption = instances [i];
                      return _interruption(
                        interruption, widget.instances.firstWhereOrNull(
                          (instance) => instance.id == interruption.instance
                        )
                      );
                    },
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _maintenanceRange (Maintenance maintenance) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text (
            maintenance.start.hourString,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Expanded (
            child: Divider (
              indent: 16,
              endIndent: 16,
            ),
          ),
          Text (
            maintenance.time.name(context),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: UIColors.hint
            ),
          ),
          const Expanded (
            child: Divider (
              indent: 16,
              endIndent: 16,
            ),
          ),
          // Visibility (
          //   visible: interruption.status.index 
          //     >= InterruptionStatus.solved.index,
          //   child: Text (
          //     interruption.end?.hourString ?? "N/A",
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _maintenanceTypes (Maintenance maintenance) {
    return Container (
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: containerDecoration.copyWith(
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      width: double.infinity,
      child: Wrap (
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: [
          _richValue(
            S.of(context).scope, 
            maintenance.scope.name(context)
          ),
        ],
      ),
    );
  }

  Widget _maintenanceUser (String? user) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text (
          S.of(context).programmedBy,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        FutureBuilder<User?>(
          future: Provider.of<Users> (context, listen: false).getUser(user),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return Text (
                snapshot.data!.firstName,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            } else {
              return Text (
                S.of(context).noInformation,
                style: Theme.of(context).textTheme.bodyMedium,
              );
            }
          }
        )
      ],
    );
  }

  Widget _maintenance (Maintenance maintenance) {
    return Column (
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _maintenanceRange(maintenance),
        const SizedBox(height: 16),
        InkWell(
          onTap: () {
            showDialog (
              context: context,
              builder: (ctx) => StatusUpdateDialog<MaintenanceStatus>(
                values: MaintenanceStatus.values, 
                getWidget: (val) => val.widget(context), 
                getHistory: () => Provider.of<Maintenances>  (
                  context, listen: false
                ).getMaintenanceStatusHistory (maintenance.id),
                text: true,
              )
            );
          },
          child: Center(
            child: maintenance.status.widget(context)
          ),
        ),
        const SizedBox(height: 16),
        Text (
          maintenance.title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        _maintenanceTypes (maintenance),
        Text (
          S.of (context).description,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 4),
        maintenance.text.isNotEmpty
        ? Container(
          padding: const EdgeInsets.all(16),
          decoration: containerDecoration.copyWith(
            color: UIColors.hint.withOpacity(0.05)
          ),
          child: QuillReaderWidget (
            value: maintenance.text
          ),
        )
        : Text (
          S.of(context).noInformation,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        _maintenanceUser (maintenance.user),
        const SizedBox(height: 16)
      ],
    );
  }

  Widget _maintenancesTitle () {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16
        ),
        decoration: BoxDecoration (
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only (
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)
          )
        ),
        child: ExpansionTile (
          title: Text (
            S.of (context).maintenances,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          childrenPadding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 16),
            CustomDropdownFormField<MaintenanceStatus> (
              value: maintenanceFilter,
              items: MaintenanceStatus.values,
              label: S.of (context).filter,
              name: (val) => "${val.name(context)} ${val.emoji}",
              onChanged: (val) {
                setState(() {
                  maintenanceFilter = val!;
                });
              },
              validation: false,
            )
          ],
        )
      ),
    );
  }

  Widget _maintenances () {
    return SliverStickyHeader(
      header: _maintenancesTitle(),
      overlapsContent: false,
      sticky: true,
      sliver: SliverToBoxAdapter (
        child: Container (
          padding: const EdgeInsets.all(16),
          decoration: containerDecoration,
          child: Column (
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text (
                widget.data.date.dateString,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              Builder(
                builder: (context) {
                  List<Maintenance> maintenances = widget.data.maintenances
                  .where (
                    (maintenance) => maintenanceFilter == MaintenanceStatus.none
                    || maintenance.status == maintenanceFilter
                  )
                  .toList ();
                  if (maintenances.isEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text (
                            S.of(context).noInformation,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 16),
                          Visibility(
                            visible: widget.data.maintenances.isEmpty,
                            child: Text (
                              "🎉", 
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return ListView.builder (
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics (),
                    itemCount: maintenances.length + 1,
                    itemBuilder: (ctx, i) {
                      if (i == maintenances.length) {
                        return const SizedBox (
                          height: 16,
                        );
                      }
                      Maintenance maintenance = maintenances [i];
                      return _maintenance(maintenance);
                    },
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text (
          service.name,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16
        ),
        child: CustomScrollView (
          slivers: [
            const SliverToBoxAdapter (
              child: SizedBox(height: 16),
            ),
            SliverToBoxAdapter(
              child: _serviceData(),
            ),
            _majorInterruptions(),
            _instanceInterruptions(),
            _maintenances (),
            const SliverToBoxAdapter (
              child: SizedBox(height: 32),
            ),
          ],
        )
      ),
    );
  }
}