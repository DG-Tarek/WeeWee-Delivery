class TraderFirebaseCubitState {}

class CreateTraderFirebaseBlocState extends TraderFirebaseCubitState {}
// New Product States
class CreateProductState extends TraderFirebaseCubitState {}
class CreateProductLoadingState extends TraderFirebaseCubitState {}
class CreateProductSuccessfullyState extends TraderFirebaseCubitState {}
// New Client States
class CreateClientState extends TraderFirebaseCubitState {}
class CreateClientLoadingState extends TraderFirebaseCubitState {}
class CreateClientSuccessfullyState extends TraderFirebaseCubitState {}
// New Order States
class CreateOrderLoadingState extends TraderFirebaseCubitState {}
class CreateOrderSuccessfullyState extends TraderFirebaseCubitState {}
// Get Clients List
class GetClientsLoadingState extends TraderFirebaseCubitState{}
class GetClientsSuccessfullyState extends TraderFirebaseCubitState {}
// Get Products List
class GetProductsLoadingState extends TraderFirebaseCubitState{}
class GetProductsSuccessfullyState extends TraderFirebaseCubitState {}
// Select Product for Order
class SelectedProductState extends TraderFirebaseCubitState{}
// Select Client for Order
class SelectedClientState extends TraderFirebaseCubitState{}