// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presets.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPresetsCollection on Isar {
  IsarCollection<Presets> get presets => this.collection();
}

const PresetsSchema = CollectionSchema(
  name: r'Presets',
  id: -3842158868510270789,
  properties: {
    r'presetName': PropertySchema(
      id: 0,
      name: r'presetName',
      type: IsarType.string,
    ),
    r'timerCode': PropertySchema(
      id: 1,
      name: r'timerCode',
      type: IsarType.string,
    ),
    r'timerVals': PropertySchema(
      id: 2,
      name: r'timerVals',
      type: IsarType.longList,
    )
  },
  estimateSize: _presetsEstimateSize,
  serialize: _presetsSerialize,
  deserialize: _presetsDeserialize,
  deserializeProp: _presetsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _presetsGetId,
  getLinks: _presetsGetLinks,
  attach: _presetsAttach,
  version: '3.1.0+1',
);

int _presetsEstimateSize(
  Presets object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.presetName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.timerCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.timerVals;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _presetsSerialize(
  Presets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.presetName);
  writer.writeString(offsets[1], object.timerCode);
  writer.writeLongList(offsets[2], object.timerVals);
}

Presets _presetsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Presets();
  object.id = id;
  object.presetName = reader.readStringOrNull(offsets[0]);
  object.timerCode = reader.readStringOrNull(offsets[1]);
  object.timerVals = reader.readLongList(offsets[2]);
  return object;
}

P _presetsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _presetsGetId(Presets object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _presetsGetLinks(Presets object) {
  return [];
}

void _presetsAttach(IsarCollection<dynamic> col, Id id, Presets object) {
  object.id = id;
}

extension PresetsQueryWhereSort on QueryBuilder<Presets, Presets, QWhere> {
  QueryBuilder<Presets, Presets, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PresetsQueryWhere on QueryBuilder<Presets, Presets, QWhereClause> {
  QueryBuilder<Presets, Presets, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Presets, Presets, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Presets, Presets, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Presets, Presets, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PresetsQueryFilter
    on QueryBuilder<Presets, Presets, QFilterCondition> {
  QueryBuilder<Presets, Presets, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'presetName',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'presetName',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'presetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'presetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'presetName',
        value: '',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'presetName',
        value: '',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timerCode',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timerCode',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timerCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timerCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timerVals',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timerVals',
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerVals',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition>
      timerValsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timerVals',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition>
      timerValsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timerVals',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timerVals',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timerVals',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timerVals',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timerVals',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timerVals',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition>
      timerValsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timerVals',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerValsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timerVals',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PresetsQueryObject
    on QueryBuilder<Presets, Presets, QFilterCondition> {}

extension PresetsQueryLinks
    on QueryBuilder<Presets, Presets, QFilterCondition> {}

extension PresetsQuerySortBy on QueryBuilder<Presets, Presets, QSortBy> {
  QueryBuilder<Presets, Presets, QAfterSortBy> sortByPresetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.asc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> sortByPresetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.desc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> sortByTimerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerCode', Sort.asc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> sortByTimerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerCode', Sort.desc);
    });
  }
}

extension PresetsQuerySortThenBy
    on QueryBuilder<Presets, Presets, QSortThenBy> {
  QueryBuilder<Presets, Presets, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> thenByPresetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.asc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> thenByPresetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.desc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> thenByTimerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerCode', Sort.asc);
    });
  }

  QueryBuilder<Presets, Presets, QAfterSortBy> thenByTimerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerCode', Sort.desc);
    });
  }
}

extension PresetsQueryWhereDistinct
    on QueryBuilder<Presets, Presets, QDistinct> {
  QueryBuilder<Presets, Presets, QDistinct> distinctByPresetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'presetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Presets, Presets, QDistinct> distinctByTimerCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timerCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Presets, Presets, QDistinct> distinctByTimerVals() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timerVals');
    });
  }
}

extension PresetsQueryProperty
    on QueryBuilder<Presets, Presets, QQueryProperty> {
  QueryBuilder<Presets, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Presets, String?, QQueryOperations> presetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'presetName');
    });
  }

  QueryBuilder<Presets, String?, QQueryOperations> timerCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timerCode');
    });
  }

  QueryBuilder<Presets, List<int>?, QQueryOperations> timerValsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timerVals');
    });
  }
}
