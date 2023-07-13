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
      type: IsarType.byte,
      enumMap: _PresetstimerCodeEnumValueMap,
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
  indexes: {
    r'presetName': IndexSchema(
      id: -457108311343499266,
      name: r'presetName',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'presetName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
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
  bytesCount += 3 + object.presetName.length * 3;
  bytesCount += 3 + object.timerVals.length * 8;
  return bytesCount;
}

void _presetsSerialize(
  Presets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.presetName);
  writer.writeByte(offsets[1], object.timerCode.index);
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
  object.presetName = reader.readString(offsets[0]);
  object.timerCode =
      _PresetstimerCodeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          TimerCode.pomo;
  object.timerVals = reader.readLongList(offsets[2]) ?? [];
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
      return (reader.readString(offset)) as P;
    case 1:
      return (_PresetstimerCodeValueEnumMap[reader.readByteOrNull(offset)] ??
          TimerCode.pomo) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PresetstimerCodeEnumValueMap = {
  'pomo': 0,
  'chime': 1,
};
const _PresetstimerCodeValueEnumMap = {
  0: TimerCode.pomo,
  1: TimerCode.chime,
};

Id _presetsGetId(Presets object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _presetsGetLinks(Presets object) {
  return [];
}

void _presetsAttach(IsarCollection<dynamic> col, Id id, Presets object) {
  object.id = id;
}

extension PresetsByIndex on IsarCollection<Presets> {
  Future<Presets?> getByPresetName(String presetName) {
    return getByIndex(r'presetName', [presetName]);
  }

  Presets? getByPresetNameSync(String presetName) {
    return getByIndexSync(r'presetName', [presetName]);
  }

  Future<bool> deleteByPresetName(String presetName) {
    return deleteByIndex(r'presetName', [presetName]);
  }

  bool deleteByPresetNameSync(String presetName) {
    return deleteByIndexSync(r'presetName', [presetName]);
  }

  Future<List<Presets?>> getAllByPresetName(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'presetName', values);
  }

  List<Presets?> getAllByPresetNameSync(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'presetName', values);
  }

  Future<int> deleteAllByPresetName(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'presetName', values);
  }

  int deleteAllByPresetNameSync(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'presetName', values);
  }

  Future<Id> putByPresetName(Presets object) {
    return putByIndex(r'presetName', object);
  }

  Id putByPresetNameSync(Presets object, {bool saveLinks = true}) {
    return putByIndexSync(r'presetName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPresetName(List<Presets> objects) {
    return putAllByIndex(r'presetName', objects);
  }

  List<Id> putAllByPresetNameSync(List<Presets> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'presetName', objects, saveLinks: saveLinks);
  }
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

  QueryBuilder<Presets, Presets, QAfterWhereClause> presetNameEqualTo(
      String presetName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'presetName',
        value: [presetName],
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterWhereClause> presetNameNotEqualTo(
      String presetName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [],
              upper: [presetName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [presetName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [presetName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [],
              upper: [presetName],
              includeUpper: false,
            ));
      }
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

  QueryBuilder<Presets, Presets, QAfterFilterCondition> presetNameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeEqualTo(
      TimerCode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeGreaterThan(
    TimerCode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timerCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeLessThan(
    TimerCode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timerCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Presets, Presets, QAfterFilterCondition> timerCodeBetween(
    TimerCode lower,
    TimerCode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timerCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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

  QueryBuilder<Presets, Presets, QDistinct> distinctByTimerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timerCode');
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

  QueryBuilder<Presets, String, QQueryOperations> presetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'presetName');
    });
  }

  QueryBuilder<Presets, TimerCode, QQueryOperations> timerCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timerCode');
    });
  }

  QueryBuilder<Presets, List<int>, QQueryOperations> timerValsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timerVals');
    });
  }
}
