abstract interface class Converter<ModelType, EntityType> {
  EntityType fromModel(ModelType model);
  ModelType toModel(EntityType entity);
}
