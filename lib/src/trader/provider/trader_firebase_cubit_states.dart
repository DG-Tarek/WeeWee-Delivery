class TraderFirebaseCubitState {}

class CreateTraderFirebaseBlocState extends TraderFirebaseCubitState {}
// New Product States
class NewProductState extends TraderFirebaseCubitState {}
class NewProductLoadingState extends TraderFirebaseCubitState {}
class NewProductSuccessfullyState extends TraderFirebaseCubitState {}
// New Client States
class NewClientState extends TraderFirebaseCubitState {}
class NewClientLoadingState extends TraderFirebaseCubitState {}
class NewClientSuccessfullyState extends TraderFirebaseCubitState {}
// New Order States
class NewOrderState extends TraderFirebaseCubitState {}
class NewOrderLoadingState extends TraderFirebaseCubitState {}
class NewOrderSuccessfullyState extends TraderFirebaseCubitState {}
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