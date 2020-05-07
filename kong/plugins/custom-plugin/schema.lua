-- schema.lua
return {
  no_consumer = true, -- this plugin will only be applied to Services or Routes,
  fields = {
    kafka_brokers = {type="array"},
    kafka_topic = {type = "string"}
  },
  self_check = function(schema, plugin_t, dao, is_updating)
    -- 自定义的验证函数
    return true
  end
}
