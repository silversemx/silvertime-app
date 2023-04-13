import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http_request_utils/models/http_exception.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/models/resources/service/service_instance.dart';
import 'package:silvertime/models/status/reports/report.dart';
import 'package:silvertime/providers/resources/services/instances.dart';
import 'package:silvertime/providers/resources/services/services.dart';
import 'package:silvertime/providers/status/reports.dart';
import 'package:silvertime/screens/image.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:silvertime/widgets/quill/quill_editor.dart';
import 'package:skeletons/skeletons.dart';

class InputReportScreen extends StatefulWidget {
  final Report? report;
  const InputReportScreen({
    super.key, this.report
  });

  @override
  State<InputReportScreen> createState() => _InputReportScreenState();
}

class _InputReportScreenState extends State<InputReportScreen> {
  bool _loadingImage  = false;
  bool _loading = true;
  bool _saving = false;
  bool _loadingInstance = false;
  final GlobalKey<FormState> _formKey = GlobalKey ();
  late Report report = widget.report ?? Report.empty ();
  Map<String, bool> validation = {};
  FocusNode formFocus = FocusNode ();
  ImageSource source = ImageSource.gallery;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _fetchInfo());
  }
  
  @override
  void reassemble() {
    Future.microtask(() => _fetchInfo());
    super.reassemble();
  }

  Future<void> _fetchInstances () async {
    await Provider.of<ServiceInstances> (
      context, listen: false
    ).getInstances(service: report.service, limit: 0);
  }

  void _save () async {
    setState(() {
      validation = report.isComplete();
    });
    bool formComplete = _formKey.currentState!.validate();

    if (formComplete && validation ['total']!) {
      try {
        setState(() {
          _saving = true;
        });
        if (widget.report == null) {
          await Provider.of<Reports> (context, listen: false).createReport(report);
        } else {
          //
        }
        Navigator.of (context).pop (true);
      } on HttpException catch (error) {
        showErrorDialog(context, exception: error);
      } finally {
        setState(() {
          _saving = false;
        });
      }
    }
  }

  void _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      await Provider.of<Services> (context, listen: false).getServices (limit: 0);
      if (report.service != null) {
        setState(() {
          _loadingInstance = true;
        });
        await _fetchInstances ();
      }
    } on HttpException catch(error) {
      showErrorDialog(context, exception: error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _selectService (String? id) {
    setState(() {
      report.service = id;
      report.instance = null;
    });
    _fetchInstances ();

  }

  void pickImage () async {
    if (!_loadingImage) {
      setState(() {
        _loadingImage = true;
      });
      try {

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        ReportImageFile imageFile = ReportImageFile();
        imageFile.bytes = await image.readAsBytes();
        imageFile.filename = image.name.replaceAll("image_picker_", "");
        report.image = imageFile;
      }
      } catch (error, bt) {
        Completer ().completeError(error, bt);
      } finally {
        setState(() {
          _loadingImage = false;
        });
      }
    }
  }

  Widget _serviceInput () {
    return Consumer<Services> (
      builder: (ctx, services, _) {
        if (_loading) {
          return SizedBox (
            width: double.infinity,
            child: SkeletonAvatar (
              style: SkeletonAvatarStyle (
                borderRadius: BorderRadius.circular(12),
                height: 24,
                width: double.infinity,
              ),
            ),
          );
        } else if (services.services.isEmpty) {
          return Container (
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Text (
              S.of(context).noServices,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else {
          return CustomInputSearchField<Service> (
            initialValue: report.service  != null
            ? SearchFieldListItem(
              services.services.firstWhereOrNull (
                (service) => service.id == report.service
              )?.name ?? "",
              item: services.services.firstWhereOrNull(
                (element) => element.id == report.service
              )
            )
            : null,
            fetch: (search) async {
              if (search?.isNotEmpty ?? false) {
                return services.services.where (
                  (service) => service.name.contains (search!)
                ).toList();
              } else {
                return services.services;
              }
            },
            searchFieldMap: (service) => SearchFieldListItem<Service> (
              service.name,
              item: service
            ),
            label: S.of(context).service,
            clearSelection: () {
              _selectService(null);
            },
            onSuggestionTap: (suggestion) {
              _selectService (suggestion.id);
            },
            onSubmit: (serviceName) async {
              Service? serviceFound = services.services.firstWhereOrNull(
                (element) => element.name.formattedSearchText.contains(
                  serviceName.formattedSearchText
                )
              );

              if (serviceFound != null) {
                _selectService (serviceFound.id);

                return serviceName;
              }
              return null;
            },
            
            showSuggestions: true,
            validation: validation ['service'],
          );
        }
      },
    );
  }

  Widget _instanceInput () {
    return Consumer<ServiceInstances> (
      builder: (ctx, instances, _) {
        if (_loadingInstance) {
          return SizedBox (
            width: double.infinity,
            child: SkeletonAvatar (
              style: SkeletonAvatarStyle (
                borderRadius: BorderRadius.circular(12),
                height: 24,
                width: double.infinity,
              ),
            ),
          );
        } else if (instances.instances.isEmpty) {
          return Container (
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Text (
              S.of(context).noInstances,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else {
          return CustomInputSearchField<ServiceInstance> (
            initialValue: report.instance  != null
            ? SearchFieldListItem(
              instances.instances.firstWhereOrNull (
                (instance) => instance.id == report.instance
              )?.name ?? "",
              item: instances.instances.firstWhereOrNull(
                (element) => element.id == report.instance
              )
            )
            : null,
            fetch: (search) async {
              if (search?.isNotEmpty ?? false) {
                return instances.instances.where (
                  (instance) => instance.name.contains (search!)
                ).toList();
              } else {
                return instances.instances;
              }
            },
            searchFieldMap: (instance) => SearchFieldListItem<ServiceInstance> (
              instance.name,
              item: instance
            ),
            label: S.of(context).instance,
            clearSelection: () {
              setState(() {
                report.instance = null;
              });
            },
            onSuggestionTap: (suggestion) {
              setState(() {
                report.instance = suggestion.id;
              });
            },
            onSubmit: (instanceName) async {
              ServiceInstance? instanceFound = instances.instances.firstWhereOrNull(
                (element) => element.name.formattedSearchText.contains(
                  instanceName.formattedSearchText
                )
              );

              if (instanceFound != null) {
                setState(() {
                  report.instance = instanceFound.id;
                });

                return instanceName;
              }
              return null;
            },
            
            showSuggestions: true,
            validation: validation ['instance'],
          );
        }
      },
    );
  }

  Widget _imageInput () {
    String text;
    if (source == ImageSource.gallery) {
      if (report.image?.bytes != null) {
        text = S.of(context).pickAnotherImage;
      } else {
        text = S.of(context).pickAnImage;
      }
    } else {
      if (report.image?.bytes != null) {
        text = S.of(context).captureAnotherImage;
      } else {
        text = S.of(context).captureImage;
      }
    }

    return Column (
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text (
              S.of(context).camera,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Switch(
              value: source == ImageSource.gallery,
              onChanged: (val) {
                if (source == ImageSource.gallery) {
                  source = ImageSource.camera;
                } else {
                  source = ImageSource.gallery;
                }
                setState(() {});
              },
              activeColor: Colors.red,
              inactiveTrackColor: Colors.blue,
              inactiveThumbColor: Colors.blue,
            ),
            Text (
              S.of(context).gallery,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(UIColors.warning),
            overlayColor: MaterialStateProperty.all(Colors.transparent)
          ),
          onPressed: pickImage,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Center (
              child: _loadingImage
              ? const SpinKitRipple(
                color: UIColors.white,
                size: 24,
              )
              : Text (
                text,
                style: Theme.of(context).textTheme.displaySmall!
              ),
            ),
          )
        )
      ],
    );
  }

  Widget _imagePreview () {
    if (report.image?.bytes == null) {
      return Container ();
    }
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: ImageScreen (
              filename: report.image!.filename!,
              imageBytes: report.image!.bytes!,
              hero: "preview",
            ), 
            type: PageTransitionType.fade
          )
        );
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: containerDecoration.copyWith(
          color: Theme.of(context).primaryColorLight.withOpacity(0.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Hero(
            tag: "preview",
            child: FadeInImage(
              fit: BoxFit.contain,
              placeholder: const AssetImage (
                'assets/images/loading.gif',
              ), 
              image: MemoryImage (
                report.image!.bytes!,
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget _form () {
    return Form (
      key: _formKey,
      child: Column (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          CustomInputField (
            initialValue: report.title,
            label: S.of (context).title,
            type: TextInputType.name,
            onChanged: (val) {
              report.title = val;
            },
            action: TextInputAction.next,
            validation: validation ['title'],
          ),
          Container (
            margin: const EdgeInsets.only(bottom: 16),
            decoration: containerDecoration,
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.6,
            child: QuillEditorWidget (
              focusNode: formFocus,
              initialValue: report.text,
              label: S.of (context).description,
              onUpdate: (val) {
                report.text = val;
              },
              validation: validation ['text'],
            ),
          ),
          CustomDropdownFormField<ReportPriority> (
            value: report.priority,
            items: ReportPriority.values,
            label: S.of(context).priority,
            name: (val) => val.name(context),
            onChanged: (val) {
              formFocus.unfocus();
              unfocus(context);
              report.priority = val!;
            },
            validation: validation ['priority'],
          ),
          CustomDropdownFormField<ReportType> (
            value: report.type,
            items: ReportType.values,
            label: S.of(context).type,
            name: (val) => val.name(context),
            onChanged: (val) {
              formFocus.unfocus();
              unfocus(context);
              report.type = val!;
            },
            validation: validation ['type'],
          ),
          CustomDropdownFormField<ExecutionScope> (
            value: report.scope,
            items: ExecutionScope.values,
            label: S.of(context).scope,
            name: (val) => val.name(context),
            onChanged: (val) {
              formFocus.unfocus();
              unfocus(context);
              report.scope = val!;
            },
            validation: validation ['scope'],
          ),
          Visibility (
            visible: [
              ExecutionScope.service, ExecutionScope.instance
            ].contains(report.scope),
            child: _serviceInput(),
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: report.scope == ExecutionScope.instance,
            child: _instanceInput()
          ),
          const SizedBox(height: 16),
          _imageInput(),
          const SizedBox(height: 16),
          Container (
            margin: const EdgeInsets.only(bottom: 16),
            decoration: containerDecoration.copyWith(
              color: UIColors.inputSuccess.withOpacity(0.3)
            ),
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.6,
            child: QuillEditorWidget (
              focusNode: formFocus,
              initialValue: report.solution,
              label: S.of (context).solution,
              onUpdate: (val) {
                report.solution = val;
              },
              validation: validation ['solution'],
            ),
          ),
          const SizedBox(height: 16),
          _imagePreview (),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text (
          S.of (context).newReport,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: GestureDetector(
        onTap:  (){
          formFocus.unfocus();
          unfocus(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _form (),
                const SizedBox(height: 16),
                ElevatedButton (
                  onPressed: _save,
                  child: Container (
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Center (
                      child: _saving
                      ? const SpinKitDoubleBounce(
                        color: UIColors.white,
                        size: 24,
                      ) 
                      : Text (
                        S.of (context).createReport,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: UIColors.white
                        ),
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 32),
              ],
            )
          ),
        ),
      ),
    );
  }
}