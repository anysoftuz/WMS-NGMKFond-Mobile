part of 'package:sklad/presentation/views/home/create_parish_view.dart';

mixin CreateParishMixin on State<CreateParishView> {
  // DropdownControllers
  final OverlayPortalController _controller1 = OverlayPortalController();
  final OverlayPortalController _controller2 = OverlayPortalController();
  final OverlayPortalController _controller3 = OverlayPortalController();
  final OverlayPortalController _controller4 = OverlayPortalController();
  final OverlayPortalController _controller5 = OverlayPortalController();
  // TextEditorControllers
  late TextEditingController controllerNumber;
  late TextEditingController controllerKomu;
  late TextEditingController controllerKogo;
  late TextEditingController throughWhom;
  late TextEditingController foundation;
  late TextEditingController methodOfDispatch;
  late TextEditingController controllerActNumber;
  late TextEditingController controllerActDes;
  late TextEditingController controllerDate;
  late TextEditingController controllerFreight;
  late TextEditingController controllerWarehouseManager;
  late TextEditingController controllerManagerBase;

  int indexCategories = -1;
  int indexType = -1;
  int indexProvider = -1;
  int indexBase = -1;
  int indexManagerBase = -1;
  int indexHeadWarehouse = -1;
  int indexMerchandiser = -1;

  List<TableOfReceivedProducts> tableOfReceivedProducts = [
    TableOfReceivedProducts()
  ];

  List<ProductInfo> productInfo = [ProductInfo()];
  bool anyControllerIsEmpty() {
    List<TextEditingController> controllers = [
      controllerNumber,
      controllerKomu,
      controllerKogo,
      // throughWhom,
      foundation,
      methodOfDispatch,
      controllerActNumber,
      // controllerActDes,
      controllerDate,
      controllerFreight,
      controllerWarehouseManager,
      controllerManagerBase,
    ];

    for (var table in tableOfReceivedProducts) {
      controllers.addAll([
        table.controllerCategory,
        table.controllerType,
        table.controllerQuantity,
        table.controllerPrice,
      ]);
    }

    for (var product in productInfo) {
      controllers.addAll([
        product.supplyContractNumber,
        product.dateOfTheSupplyAgreement,
        product.productManufacturer,
        product.transportController,
        product.licenseNumber,
        product.licenseDate,
        product.sanitaryConclusionNumber,
        product.sanitaryConclusionDate,
        product.veterinaryCertificateNumber,
        product.veterinaryCertificateDate,
        product.qualityCertificateNumber,
        product.qualityCertificateDate,
      ]);
    }

    return controllers.any((controller) => controller.text.trim().isEmpty);
  }

  Future<dynamic> popDialog(BuildContext context) {
    return wshowDialog(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Вы уверены что хотите отменить?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: black,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Все не сохраненные изменения будут потеряны',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: secondary500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WButton(
                onTap: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                text: 'Остаться',
                color: bg00,
                textColor: backgroundText,
              ),
              const SizedBox(width: 16),
              WButton(
                onTap: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                text: 'Отменить',
                color: red,
              )
            ],
          )
        ],
      ),
    );
  }

  DocumentModel getDoc(DocCreateState state) {
    return DocumentModel(
      document: Document(
        docTypeId: 7,
        date: MyFunction.dateFormatCreate(DateTime.now()),
        number: controllerNumber.text,
        fromId: indexProvider != -1
            ? state.respondentsProvider.respondents[indexProvider].id
            : 0,
        fromType: "provider",
        toId: indexBase != -1
            ? state.respondentsBase.respondents[indexBase].id
            : 0,
        toType: "base",
        subject: '',
        throughWhom: throughWhom.text,
        basis: foundation.text,
        shippingMethod: methodOfDispatch.text,
        status: '',
        products: List.generate(
          productInfo.length,
          (index) => Product(
            name: tableOfReceivedProducts[index].productType[indexType].name,
            categoryId: indexCategories != -1
                ? state.productCategoriesModel
                    .productCategories[indexCategories].id
                : 0,
            productTypeId: indexType != -1
                ? tableOfReceivedProducts[index].productType[indexType].id
                : 0,
            quantity: tableOfReceivedProducts[index].controllerQuantity.text,
            unitId: productInfo[index].productType?.unitId ?? 0,
            price: int.tryParse(
                    tableOfReceivedProducts[index].controllerPrice.text) ??
                0,
            unit: productInfo[index].productType?.unit ?? '',
          ),
        ),
      ),
      act: Act(
        number: controllerActNumber.text,
        subject: '',
        content: controllerActDes.text,
        shippingMethod: '',
        products: List.generate(
          productInfo.length,
          (index) => ProductAct(
            countProduct: null,
            contractDetails: productInfo[index].supplyContractNumber.text,
            contractDetailsDate:
                productInfo[index].dateOfTheSupplyAgreement.text,
            manufacturer: productInfo[index].productManufacturer.text,
            shippingMethod: productInfo[index].transportController.text,
            licence: productInfo[index].licenseNumber.text,
            licenceDate: productInfo[index].licenseDate.text,
            sanitary: productInfo[index].sanitaryConclusionNumber.text,
            sanitaryDate: productInfo[index].sanitaryConclusionDate.text,
            vetirinary: productInfo[index].veterinaryCertificateNumber.text,
            vetirinaryDate: productInfo[index].veterinaryCertificateDate.text,
            quality: productInfo[index].qualityCertificateNumber.text,
            qualityDate: productInfo[index].qualityCertificateDate.text,
            quantity: tableOfReceivedProducts[index].controllerQuantity.text,
            categoryId: indexCategories == -1
                ? 0
                : state.productCategoriesModel
                    .productCategories[indexCategories].id,
            productTypeId: indexType == -1
                ? 0
                : tableOfReceivedProducts[index].productType[indexType].id,
            unitId: productInfo[index].productType?.unitId ?? 0,
            price: int.tryParse(
                    tableOfReceivedProducts[index].controllerPrice.text) ??
                0,
            unit: productInfo[index].productType?.unit ?? '',
          ),
        ),
        docSigners: [
          DocSigner(
            signerId: indexMerchandiser == -1
                ? 0
                : state.usersMerchandiser.users[indexMerchandiser].id,
          ),
          DocSigner(
            signerId: indexHeadWarehouse == -1
                ? 0
                : state.usersHeadWarehouse.users[indexHeadWarehouse].id,
          ),
          DocSigner(
            signerId: indexManagerBase == -1
                ? 0
                : state.usersManagerBase.users[indexManagerBase].id,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    context.read<DocCreateBloc>().add(GetRespondentsEvent(
          isBase: true,
          query: {'type[]': 'base', 'per_page': 200},
        ));
    context.read<DocCreateBloc>().add(GetRespondentsEvent(
          isBase: false,
          query: {'type[]': 'provider', 'per_page': 200},
        ));
    context.read<DocCreateBloc>().add(GetMerchandiserEvent());
    context.read<DocCreateBloc>().add(GetManagerBaseEvent());
    context.read<DocCreateBloc>().add(GetHeadWarehouseEvent());
    context.read<DocCreateBloc>().add(GetCategoriesEvent());

    controllerNumber = TextEditingController();
    throughWhom = TextEditingController();
    foundation = TextEditingController();
    methodOfDispatch = TextEditingController();
    controllerActNumber = TextEditingController();
    controllerActDes = TextEditingController();
    controllerDate = TextEditingController();
    controllerKomu = TextEditingController();
    controllerKogo = TextEditingController();
    controllerFreight = TextEditingController();
    controllerWarehouseManager = TextEditingController();
    controllerManagerBase = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerNumber.dispose();
    throughWhom.dispose();
    foundation.dispose();
    methodOfDispatch.dispose();
    controllerActNumber.dispose();
    controllerActDes.dispose();
    controllerDate.dispose();
    controllerKomu.dispose();
    controllerKogo.dispose();
    controllerFreight.dispose();
    controllerWarehouseManager.dispose();
    controllerManagerBase.dispose();
    super.dispose();
  }
}

class TableOfReceivedProducts {
  final TextEditingController controllerCategory = TextEditingController();
  final TextEditingController controllerType = TextEditingController();
  final TextEditingController controllerQuantity = TextEditingController();
  final TextEditingController controllerPrice = TextEditingController();
  final OverlayPortalController controller1 = OverlayPortalController();
  final OverlayPortalController controller2 = OverlayPortalController();
  List<ProductType> productType = [];
}

class ProductInfo {
  final TextEditingController supplyContractNumber = TextEditingController();
  final TextEditingController dateOfTheSupplyAgreement =
      TextEditingController();
  final TextEditingController productManufacturer = TextEditingController();
  final TextEditingController transportController = TextEditingController();
  final TextEditingController licenseNumber = TextEditingController();
  final TextEditingController licenseDate = TextEditingController();
  final TextEditingController sanitaryConclusionNumber =
      TextEditingController();
  final TextEditingController sanitaryConclusionDate = TextEditingController();
  final TextEditingController veterinaryCertificateNumber =
      TextEditingController();
  final TextEditingController veterinaryCertificateDate =
      TextEditingController();
  final TextEditingController qualityCertificateNumber =
      TextEditingController();
  final TextEditingController qualityCertificateDate = TextEditingController();
  ProductType? productType;
}
