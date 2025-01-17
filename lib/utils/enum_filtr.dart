enum FilterType {
  brand,
  model,
  generation,
  modification,
  year,
  mileage,
  currency,
  price,
  bodyType,
  service,
  fuel,
  transmission,
  color,
  numberOfOwners,
  externalBodyKit,
  optics,
  salon,
  media,
  carOptions,
  configurations,
  description,
  time24,
  timeFrom,
  timeTo,
  replacedParts,
  photography,
  none,
  region,
  contact,
  status
}

enum Tables {
  category,
  branch,
  buyer,
  buyerCostInfo,
  employee,
  product,
  role,
  salesDetails,
  salesProducts,
  firms,
  firmsCostInfo,
  firmsProductHistory,
  productCount,
  usdUzs;

  String get text => switch (this) {
        Tables.category => 'category',
        Tables.branch => 'branch',
        Tables.buyer => 'buyer',
        Tables.buyerCostInfo => 'buyer_cost_info',
        Tables.employee => 'employee',
        Tables.product => 'product',
        Tables.role => 'role',
        Tables.salesDetails => 'sales_details',
        Tables.salesProducts => 'sales_products',
        Tables.firms => 'firms',
        Tables.firmsCostInfo => 'firms_cost_info',
        Tables.firmsProductHistory => 'firms_product_history',
        Tables.productCount => 'product_count',
        Tables.usdUzs => 'usd_uzs',
      };
}

enum PaymentType {
  cash,
  cashUSD,
  card,
  cardTerminal,
  debit;

  String get text => switch (this) {
        PaymentType.card => 'Kartaga',
        PaymentType.cardTerminal => 'Terminaldan',
        PaymentType.cash => "So'mda",
        PaymentType.cashUSD => 'Dollarda',
        PaymentType.debit => 'Qarzga',
      };
}
