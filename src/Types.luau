--selene: allow(unused_variable)
local None = require("./Types")

--[=[
  @type None None
  @within Sift
]=]
export type None = typeof(None)
export type Dictionary<K = any, V = any> = { [K]: V }
export type Array<T = any> = Dictionary<number, T>
export type Set<T = any> = Dictionary<T, boolean>

return {}
