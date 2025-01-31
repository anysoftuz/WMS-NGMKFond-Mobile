// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'doc_create_bloc.dart';

class DocCreateState extends Equatable {
  final FormzSubmissionStatus statusUsers;
  final FormzSubmissionStatus statusCreate;
  final FormzSubmissionStatus statusCategory;
  final FormzSubmissionStatus statusType;
  final FormzSubmissionStatus statusRespondents;
  final UsersModel usersMerchandiser;
  final UsersModel usersManagerBase;
  final UsersModel usersHeadWarehouse;
  final ProductCategoriesModel productCategoriesModel;
  final ProductTypesModel productTypesModel;
  final RespondentsListModel respondentsBase;
  final RespondentsListModel respondentsProvider;
  const DocCreateState({
    this.statusUsers = FormzSubmissionStatus.initial,
    this.statusCreate = FormzSubmissionStatus.initial,
    this.statusCategory = FormzSubmissionStatus.initial,
    this.statusType = FormzSubmissionStatus.initial,
    this.statusRespondents = FormzSubmissionStatus.initial,
    this.usersMerchandiser = const UsersModel(),
    this.usersManagerBase = const UsersModel(),
    this.usersHeadWarehouse = const UsersModel(),
    this.productCategoriesModel = const ProductCategoriesModel(),
    this.productTypesModel = const ProductTypesModel(),
    this.respondentsBase = const RespondentsListModel(),
    this.respondentsProvider = const RespondentsListModel(),
  });

  @override
  List<Object> get props => [
        statusUsers,
        statusCreate,
        statusCategory,
        statusType,
        statusRespondents,
        usersMerchandiser,
        usersManagerBase,
        usersHeadWarehouse,
        productCategoriesModel,
        productTypesModel,
        respondentsBase,
        respondentsProvider,
      ];

  DocCreateState copyWith({
    FormzSubmissionStatus? statusUsers,
    FormzSubmissionStatus? statusCreate,
    FormzSubmissionStatus? statusCategory,
    FormzSubmissionStatus? statusType,
    FormzSubmissionStatus? statusRespondents,
    UsersModel? usersMerchandiser,
    UsersModel? usersManagerBase,
    UsersModel? usersHeadWarehouse,
    ProductCategoriesModel? productCategoriesModel,
    ProductTypesModel? productTypesModel,
    RespondentsListModel? respondentsBase,
    RespondentsListModel? respondentsProvider,
  }) {
    return DocCreateState(
      statusUsers: statusUsers ?? this.statusUsers,
      statusCreate: statusCreate ?? this.statusCreate,
      statusCategory: statusCategory ?? this.statusCategory,
      statusType: statusType ?? this.statusType,
      statusRespondents: statusRespondents ?? this.statusRespondents,
      usersMerchandiser: usersMerchandiser ?? this.usersMerchandiser,
      usersManagerBase: usersManagerBase ?? this.usersManagerBase,
      usersHeadWarehouse: usersHeadWarehouse ?? this.usersHeadWarehouse,
      productCategoriesModel:
          productCategoriesModel ?? this.productCategoriesModel,
      productTypesModel: productTypesModel ?? this.productTypesModel,
      respondentsBase: respondentsBase ?? this.respondentsBase,
      respondentsProvider: respondentsProvider ?? this.respondentsProvider,
    );
  }
}
