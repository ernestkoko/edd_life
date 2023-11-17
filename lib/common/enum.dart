enum OrderAblyState {
  orderPlaced,
  orderAccepted,
  orderPickupInProgress,
  orderOnTheWayToCustomer,
  orderArrived,
  orderDelivered
}

String convertOrderStateToString(OrderAblyState state) {
  String text = "Unknown";
  switch (state) {
    case OrderAblyState.orderPlaced:
      text = "ORDER PLACED";
      break;
    case OrderAblyState.orderAccepted:
      text = "ORDER ACCEPTED";
      break;
    case OrderAblyState.orderPickupInProgress:
      text = "ORDER PICKUP IN PROGRESS";
      break;
    case OrderAblyState.orderOnTheWayToCustomer:
      text = "ORDER ON THE WAY TO CUSTOMER";
      break;
    case OrderAblyState.orderArrived:
      text = "ORDER ARRIVED";
      break;
    case OrderAblyState.orderDelivered:
      text = "ORDER DELIVERED";
      break;
    default:
  }
  return text;
}

OrderAblyState convertStringToOrderState(String text) {
  if (text == "ORDER PLACED") {
    return OrderAblyState.orderPlaced;
  } else if (text == "ORDER ACCEPTED") {
    return OrderAblyState.orderAccepted;
  } else if (text == "ORDER PICKUP IN PROGRESS") {
    return OrderAblyState.orderPickupInProgress;
  } else if (text == "ORDER ON THE WAY TO CUSTOMER") {
    return OrderAblyState.orderOnTheWayToCustomer;
  } else if (text == "ORDER ARRIVED") {
    return OrderAblyState.orderArrived;
  } else if (text == "ORDER DELIVERED") {
    return OrderAblyState.orderDelivered;
  } else {
    throw Exception(" Order tate not known");
  }
}
