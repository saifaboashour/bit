class PaginationResponse<T> {
  List<T>? data;
  MetaData? meta;

  PaginationResponse({
    this.data,
    this.meta,
  });

  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>)? build,
  ) {
    List<T> tmpList = [];
    if (json['data'] != null && build != null) {
      json['data'].forEach((element) {
        tmpList.add(build(element));
      });
    }
    return PaginationResponse(
      data: tmpList,
      meta: MetaData.fromJson(json['meta']),
    );
  }
}

class MetaData {
  int? currentPage;
  int? lastPage;
  int? total;

  MetaData({
    this.currentPage,
    this.lastPage,
    this.total,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      total: json['total'],
    );
  }
}
