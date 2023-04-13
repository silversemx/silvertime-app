import 'package:http_request_utils/models/http_exception.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/overview/overview_types.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/models/resources/service/service_tag.dart';
import 'package:silvertime/providers/overview.dart';
import 'package:silvertime/providers/resources/services/services.dart';
import 'package:silvertime/providers/resources/services/tags.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/in_app_messages/date_range_picker_dialog.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:silvertime/widgets/resources/services/status_box.dart';
import 'package:skeletons/skeletons.dart';

class ServicesScreen extends StatefulWidget {
  final Stream<int> currentPageStream;
  final Stream<void> refreshStream;
  final Sink<int> pagesSink;
  const ServicesScreen({
    super.key, 
    required this.refreshStream,
    required this.currentPageStream,
    required this.pagesSink
  });

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool _loading = true;
  int _currentPage = 0;
  int _limit = 5;
  OverviewFilter filter = OverviewFilter.none;
  int tagsMask = 0;
  

  int get limit => _limit;

  set limit (int newLimit) {
    locator<SharedPreferences> ().setInt ("service_limit", newLimit);
    setState(() {
      _limit = newLimit;
    });

    _fetchInfo ();
  }
  
  set currentPage (int newPage) {
    _currentPage = newPage;
    _fetchInfo ();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _limit = locator<SharedPreferences> ().getInt("service_limit") ?? 5;
    });
    Future.microtask(() => _fetchInfo ());
    _listeners();
  }
  
  @override
  void reassemble() {
    Future.microtask(() => _fetchInfo ());
    super.reassemble();
    _listeners();
  }

  void _listeners () {
    widget.currentPageStream.listen((event) {
      currentPage = event;
    });

    widget.refreshStream.listen((event) {
        _fetchInfo();
    });
  }

  void _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      await _fetchServices(showError: false);
      await Provider.of<ServiceTags> (context, listen: false).getServiceTags(
        limit: 0
      );
    } on HttpException catch(error) {
      showErrorDialog(context, exception: error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _fetchServices ({bool showError = true}) async {
    try {
      await Provider.of<Services> (context, listen: false).getServices (
        skip: _currentPage * limit, limit: limit
      );
      widget.pagesSink.add (
        Provider.of<Services> (context, listen: false).pages
      );
    } on HttpException catch (error) {
      if (showError) {
        showErrorDialog(context, exception: error);
      } else {
        rethrow;
      }
    }
  }

  Widget _loadingServices () {
    return ListView.builder (
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (ctx, i) {
        return Container (
          margin: const EdgeInsets.symmetric(
            vertical: 8
          ),
          decoration: containerDecoration,
          padding: const EdgeInsets.all(16),
          child: Column (
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SkeletonLine (
                style: SkeletonLineStyle (
                  randomLength: true,
                  maxLength: 150,
                  minLength: 100,
                  height: 18
                ),
              ),
              const SizedBox(height: 16),
              SkeletonAvatar (
                style: SkeletonAvatarStyle(
                  borderRadius: BorderRadius.circular(12),
                  height: 32,
                  width: double.infinity
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _services () {
    return Consumer<Services>(
      builder: (context, services, _) {
        if (_loading) {
          return _loadingServices();
        } else  {
          List<Service> currentServices = services.services.where (
            (service) => service.containsTag(tagsMask) || tagsMask == 0
          ).toList();

          if (currentServices.isEmpty) {
            return ConstrainedBox (
              constraints: BoxConstraints (
                minHeight: MediaQuery.of(context).size.height * 0.7
              ),
              child: Center(
                child: Text (
                  S.of(context).noInformation,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            );
          } else {
            return ListView.builder (
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentServices.length + 1,
              itemBuilder: (ctx, i) {
                if (i == currentServices.length) {
                  return const SizedBox (
                    height: 72,
                  );
                }
                return StatusBoxWidget(
                  key: ValueKey (filter),
                  service: currentServices[i],
                  filter: filter,
                );
              },
            );
          }
        }
      }
    );
  }

  Widget _rangePicker () {
    return Consumer<Overviews>(
      builder: (context, overview, _) {
        return Container (
          width: double.infinity,
          decoration: containerDecoration,
          padding: const EdgeInsets.all(16),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 32,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text (
                  S.of (context).currentRange,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text (
                    "${
                      overview.range.start.dateString
                    } - ${
                      overview.range.end.dateString
                    }",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text (
                    "${overview.range.duration.inDays + 1} ${S.of(context).days}",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              TextButton (
                child: Text (
                  S.of(context).change,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () async {
                  DateTimeRange? newRange = await showDialog (
                    context: context,
                    builder: (ctx) => DateRangeCustomPickerDialog (
                      firstDate: DateTime.now ().subtract(
                        const Duration (days: 365)
                      ),
                      lastDate: DateTime.now (),
                      selectedRange: Provider.of<Overviews> (
                        context, listen: false
                      ).range,
                    )
                  );

                  if (newRange != null) {
                    print (newRange.start);
                    print (newRange.start.millisecondsSinceEpoch);
                    print (newRange.end);
                    print (newRange.end.millisecondsSinceEpoch);
                    Provider.of<Overviews> (context, listen: false).range = newRange;
                    _fetchInfo();
                  }
                },
              )
            ],
          ),
        );
      }
    );
  }

  Widget _limitPicker () {
    return CustomDropdownFormField<int> (
      value: limit,
      items: const [5, 10, 20],
      label: S.of(context).limit,
      name: (val) => val.toString(),
      onChanged: (val) {
        limit = val!;
      },
      validation: false,
    );
  }

  Widget _overviewFilter () {
    return CustomDropdownFormField<OverviewFilter>(
      value: filter,
      items: OverviewFilter.values, 
      name: (val) => "${val.name (context)} ${val.emoji}",
      label: S.of(context).filter,
      onChanged: (val) {
        setState(() {
          filter = val!;
        });
      },
      validation: false,
    );
  }

  Widget _tag (ServiceTag tag) {
    return InkWell(
      onTap: () {
        tagsMask = tagsMask ^ tag.value;

        setState(() {});
      },
      child: Container (
        decoration: containerDecoration.copyWith(
          color: UIColors.primary
        ),
        padding: const EdgeInsets.all(8),
        child: Text (
          tag.name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: UIColors.white
          ),
        ),
      ),
    );
  }

 Widget _tagsFilter () {
    return Consumer<ServiceTags>(
      builder: (context, tags, _) {
        if (_loading) {
          return SkeletonAvatar (
            style: SkeletonAvatarStyle (
              borderRadius: BorderRadius.circular(20),
              height: 52,
              width: double.infinity
            ),
          );
        } else if (tags.tags.isEmpty) {
          return Container();
        }
        return Container(
          decoration: containerDecoration,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputSearchField<ServiceTag>  (
                color: Theme.of(context).scaffoldBackgroundColor,
                label: S.of(context).serviceTags,
                fetchAfterSubmission: true,
                fetch: (String? text) async {
                  return tags.tags.where (
                    (tag) => (
                      (text?.isEmpty ?? true) ||
                      tag.name.formattedSearchText.contains(
                        text?.formattedSearchText ?? ""
                      ) 
                    ) && !tagsFromMask(tagsMask, tags.tags).contains (
                      tag
                    )
                  
                  ).toList();
                },
                onSuggestionTap: (suggestion) {
                  setState(() {
                    tagsMask = tagsMask | suggestion.value;
                  });
                },
                onSubmit: (text) async {
                  ServiceTag? tag = tags.tags.firstWhereOrNull(
                    (element) => element.name.formattedSearchText.contains(
                      text.formattedSearchText
                    )
                  );
        
                  if (tag != null) {
                    setState(() {
                      tagsMask = tagsMask | tag.value;
                    });
                    
                    return tag.name;
                  }
        
                  return null;
                },
                searchFieldMap: (tag) => SearchFieldListItem(
                  tag.name,
                  item: tag
                ),
                clearSelection: () {},
              ),
              Text (
                S.of (context).tapToRemoveTag,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: UIColors.hint
                ),
              ),
              const SizedBox(height: 8),
              Container (
                width: double.infinity,
                constraints: BoxConstraints (
                  maxHeight: MediaQuery.of(context).size.height * 0.2,
                ),
                child: SingleChildScrollView (
                  child: Wrap (
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: tagsFromMask(
                      tagsMask, tags.tags
                    ).map<Widget> (
                      (tag) => _tag (tag)
                    ).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton (
                child: Text (
                  S.of (context).removeTagFilters,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline
                  ),
                ),
                onPressed: () {
                  setState(() {
                    tagsMask = 0;
                  });
                },
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _filters () {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent
      ),
      child: ExpansionTile(
        title: Text (
          S.of (context).filters,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        childrenPadding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 16),
          _overviewFilter(),
          const SizedBox(height: 16),
          _tagsFilter(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rangePicker (),
        const SizedBox(height: 16),
        _limitPicker (),
        _filters (),
        const SizedBox(height: 16),
        _services (),
      ],
    );
  }
}