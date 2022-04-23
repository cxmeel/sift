local None = require(script.Parent.None)

export type None = typeof(None)
export type Dictionary<K, V> = { [K]: V }
export type Array<T> = Dictionary<number, T>
export type Set<T> = Dictionary<T, boolean>
export type Table = Dictionary<any, any>

return nil
