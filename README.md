# LoadStatusView

[![pub package](https://img.shields.io/pub/v/load_status_view.svg)](https://pub.dev/packages/load_status_view)

## Features

A simple view for different status: loading, success, empty, error, unauthorized.


| loading | success  |  empty   | error    | unauthorized |
|---------|----------|----------|----------|--------------|
| ![-w20](https://github.com/ibangbang/load_status_view/blob/main/preview/1.jpeg) | ![-w20](https://github.com/ibangbang/load_status_view/blob/main/preview/2.jpeg) | ![-w20](https://github.com/ibangbang/load_status_view/blob/main/preview/3.jpeg) | ![-w20](https://github.com/ibangbang/load_status_view/blob/main/preview/4.jpeg) | ![-w20](https://github.com/ibangbang/load_status_view/blob/main/preview/5.jpeg) |


## Getting started

Add the dependency in `pubspec.yaml`:
```yaml
dependencies:
  ...
  load_status_view: ^0.0.1
```

## Basic Usage

```dart
///
LoadStatus loadStatus = LoadStatus.loading;
///
LoadStatusView(status: loadStatus,
    errorCall: _retry,
    child: const Center(
      child: Text('content'),
    ),
)
/// init load data
_loadData() {
    _setStatus(LoadStatus.loading);
        Future.delayed(Duration(seconds: 2), () {
        _setStatus(LoadStatus.success);
    });
}
///
_retry() {
  _loadData();
}
///
_setStatus(LoadStatus status) {
    setState(() {
      loadStatus = status;
    });
}

```

## More Usage

see example
