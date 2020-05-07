-- 继承BasePlugin
local BasePlugin = require "kong.plugins.base_plugin"
local CustomHandler = BasePlugin:extend()

-- 插件构造函数
function CustomHandler:new()
  CustomHandler.super.new(self, "my-custom-plugin")
end

function CustomHandler:init_worker()
  CustomHandler.super.init_worker(self)
  -- 在这里实现自定义的逻辑
end

function CustomHandler:certificate(config)
  CustomHandler.super.certificate(self)
  -- 在这里实现自定义的逻辑
end

function CustomHandler:rewrite(config)
  CustomHandler.super.rewrite(self)
  -- 在这里实现自定义的逻辑
end

function CustomHandler:access(config)
  CustomHandler.super.access(self)
  -- 在这里实现自定义的逻辑
end

function CustomHandler:header_filter(config)
  CustomHandler.super.header_filter(self)
  -- 在这里实现自定义的逻辑
  kong.log(kong.request.get_header("X-Login-Token"))
end

function CustomHandler:body_filter(config)
  CustomHandler.super.body_filter(self)
  -- 在这里实现自定义的逻辑
end

function CustomHandler:log(config)
  CustomHandler.super.log(self)
  -- 在这里实现自定义的逻辑
end

return CustomHandler
