import 'package:flutter/material.dart';
import 'package:movie/movies/presentation/widgets/loader.dart';

import '../../../../core/utils/enums/enums_states_request.dart';

class CheckingRequestState {
  static Widget checkRequestState(
    Widget designWidget,
    RequestState requestState,
    BuildContext context,
  ) {
    switch (requestState) {
      case RequestState.loading:
        return LoaderWidget();
      case RequestState.loaded:
        return designWidget;
      case RequestState.error:
        return _createErrorMessage();
    }
  }
}

Widget _createErrorMessage() => Text('find error');
