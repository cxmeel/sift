/**
 * Gets a value from an array at the given index.
 * This uses Luau's indexing rules, so the start of the
 * array is at 1, not 0.
 *
 * @param array The array to get the value from
 * @param index The index of the element to return.
 * @returns The element at the specified index.
 *
 * @example ```ts
 * const array = [ 1, 2, 3 ]
 *
 * let value = At(array, 1) // 1
 * let value = At(array, 0) // 3
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#At API Documentation}
 */
export function At<T>(array: T[], index: number): T

/**
 * Joins multiple arrays together into a single array.
 *
 * @param arrays The arrays to concatenate.
 * @returns The concatenated array.
 *
 * @example ```ts
 * const array1 = [ 1, 2, 3 ]
 * const array2 = [ 4, 5, 6 ]
 *
 * let concatenated = Concat(array1, array2) // [ 1, 2, 3, 4, 5, 6 ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Concat API Documentation}
 */
export function Concat<T>(...arrays: T[]): T

/**
 * Joins multiple arrays together into a single array, with
 * deep copies of all nested arrays.
 *
 * @param arrays The arrays to concatenate.
 * @returns The concatenated array.
 *
 * @example ```ts
 * const array1 = [ 1, 2, [3, 4] ]
 * const array2 = [ 5, 6, [7, 8] ]
 *
 * let concatenated = ConcatDeep(array1, array2) // [ 1, 2, [3, 4], 5, 6, [7, 8] ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#ConcatDeep API Documentation}
 */
export function ConcatDeep<T>(...arrays: T[]): T

/**
 * Copies an array.
 *
 * @param array The array to copy.
 * @returns A copy of the array.
 *
 * @example ```ts
 * const array = [ 1, 2, 3 ]
 *
 * let copy = Copy(array) // [ 1, 2, 3 ]
 *
 * print(array == copy) // false
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Copy API Documentation}
 */
export function Copy<T>(array: T[]): T

/**
 * Copies an array, with deep copies of all nested arrays.
 *
 * @param array The array to copy.
 * @returns A copy of the array.
 *
 * @example ```ts
 * const array = [ 1, 2, [3, 4] ]
 *
 * let copy = CopyDeep(array) // [ 1, 2, [3, 4] ]
 *
 * print(array == copy) // false
 * print(array[2] == copy[2]) // false
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#CopyDeep API Documentation}
 */
export function CopyDeep<T>(array: T[]): T

/**
 * Counts the number of elements in an array, with an
 * optional predicate.
 *
 * @param array The array to count the elements of.
 * @param predicate The predicate to use to count the elements.
 * @returns The number of elements in the array.
 *
 * @example ```ts
 * const array = [ 1, 2, 3, 4, 5 ]
 *
 * let count = Count(array) // 5
 * let count = Count(array, x => x % 2 == 1) // 3
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Count API Documentation}
 */
export function Count<T>(
  array: T[],
  predicate?: (element?: T, index?: number) => boolean | void
): number

/**
 * Creates a new array with the given length, and fills it
 * with the given value.
 *
 * @param length The length of the array to create.
 * @param value The value to fill the array with.
 * @returns A new array with the given length, and filled with the given value.
 *
 * @example ```ts
 * let array = Create(5, "hello") // [ "hello", "hello", "hello", "hello", "hello" ]
 * let array = Create(5) // [ undefined, undefined, undefined, undefined, undefined ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Create API Documentation}
 */
export function Create<T>(length: number, value?: T): T[]

/**
 * Compares two or more arrays for equality.
 *
 * @param arrays The arrays to compare.
 * @returns Whether the arrays are equal.
 *
 * @example ```ts
 * let array1 = [ 1, 2, 3 ]
 * let array2 = [ 1, 2, 3 ]
 * let array3 = [ 1, 2, 4 ]
 *
 * let equal = Equal(array1, array2) // true
 * let equal = Equal(array1, array2, array3) // false
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Equal API Documentation}
 */
export function Equal<T>(...arrays: T[]): boolean

/**
 * Compares two or more arrays for equality, with deep comparisons
 * for nested arrays.
 *
 * @param arrays The arrays to compare.
 * @returns Whether the arrays are equal.
 *
 * @example ```ts
 * let array1 = [ 1, 2, [3, 4] ]
 * let array2 = [ 1, 2, [3, 4] ]
 * let array3 = [ 1, 2, [3, 5] ]
 *
 * let equal = EqualDeep(array1, array2) // true
 * let equal = EqualDeep(array1, array2, array3) // false
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#EqualDeep API Documentation}
 */
export function EqualDeep<T>(...arrays: T[]): boolean

/**
 * Checks whether every element in an array passes the given predicate.
 *
 * @param array The array to check.
 * @param predicate The predicate to use to check the elements.
 * @returns Whether every element in the array passes the predicate.
 *
 * @example ```ts
 * let array = [ 1, 2, 3, 4, 5 ]
 *
 * let every = Every(array, x => x % 2 == 0) // false
 * let every = Every(array, x => x % 1 == 0) // true
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Every API Documentation}
 */
export function Every<T>(
  array: T[],
  predicate: (element?: T, index?: number) => boolean | void
): boolean

/**
 * Filters an array, with an optional predicate.
 *
 * @param array The array to filter.
 * @param predicate The predicate to use to filter the elements.
 * @returns The filtered array.
 *
 * @example ```ts
 * const array = [ 1, 2, 3, 4, 5 ]
 *
 * let filtered = Filter(array, x => x % 2 == 0) // [ 2, 4 ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Filter API Documentation}
 */
export function Filter<T>(
  array: T[],
  predicate?: (element?: T, index?: number) => boolean | void
): T[]

/**
 * Finds the index of the first item in the array that matches the
 * given value. This is mostly a wrapper around `table.find`,
 * but it also supports negative indexes.
 *
 * @param array The array to search.
 * @param value The value to search for.
 * @param fromIndex The index to start searching from.
 * @returns The index of the first item in the array that matches the
 * given value.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let index = Find(array, "b") // 1
 * let index = Find(array, "d", 2) // 3
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Find API Documentation}
 */
export function Find<T>(array: T[], value?: T, fromIndex?: number): number

/**
 * Finds the index of the last item in the array that matches the
 * given value.
 *
 * @param array The array to search.
 * @param value The value to search for.
 * @param fromIndex The index to start searching from.
 * @returns The index of the last item in the array that matches the
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "b", "d", "e" ]
 *
 * let index = FindLast(array, "b") // 3
 * let index = FindLast(array, "b", 2) // 1
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#FindLast API Documentation}
 */
export function FindLast<T>(array: T[], value?: T, fromIndex?: number): number

/**
 * Finds the index of the first item in the array that passes
 * the predicate.
 *
 * @param array The array to search.
 * @param predicate The predicate to use to check the elements.
 * @param fromIndex The index to start searching from.
 * @returns The index of the first item in the array that passes the
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let index = FindIndex(array, x => x === "b") // 1
 * let index = FindIndex(array, x => x === "d", 2) // 3
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#FindWhere API Documentation}
 */
export function FindWhere<T>(
  array: T[],
  predicate: (element?: T, index?: number) => boolean | void,
  fromIndex?: number
): number

/**
 * Finds the index of the last item in the array that passes
 * the predicate.
 *
 * @param array The array to search.
 * @param predicate The predicate to use to check the elements.
 * @param fromIndex The index to start searching from.
 * @returns The index of the last item in the array that passes the
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "b", "d", "e" ]
 *
 * let index = FindLastIndex(array, x => x === "b") // 3
 * let index = FindLastIndex(array, x => x === "b", 2) // 1
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#FindWhereLast API Documentation}
 */
export function FindWhereLast<T>(
  array: T[],
  predicate: (element?: T, index?: number) => boolean | void,
  fromIndex?: number
): number

/**
 * Returns the first element of the array.
 *
 * @param array The array to get the first element of.
 * @returns The first element of the array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let first = First(array) // "a"
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#First API Documentation}
 */
export function First<T>(array: T[]): T

/**
 * Flattens an array. If the array contains other arrays, they will be
 * flattened as deep as possible (unless the `depth` parameter is
 * specified).
 *
 * @param array The array to flatten.
 * @param depth The depth to flatten the array to.
 * @returns The flattened array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", [ "d", "e", [ "f", "g" ] ] ]
 *
 * let flattened = Flatten(array) // [ "a", "b", "c", "d", "e", "f", "g" ]
 * let flattened = Flatten(array, 1) // [ "a", "b", "c", "d", "e", [ "f", "g" ] ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Flatten API Documentation}
 */
export function Flatten<T>(array: T[], depth?: number): T[]

/**
 * Freezes the array, preventing further changes to it.
 *
 * @param array The array to freeze.
 * @returns The frozen array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", [ "d", "e" ] ]
 *
 * let frozen = Freeze(array) // [ "a", "b", "c", [ "d", "e" ] ]
 *
 * frozen[3].push("f") // this works
 * frozen.push("f") // throws an error
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Freeze API Documentation}
 */
export function Freeze<T>(array: T[]): T[]

/**
 * Freezes the array, preventing further changes to it, including
 * all nested arrays.
 *
 * @param array The array to freeze.
 * @returns The frozen array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", [ "d", "e" ] ]
 *
 * let frozen = FreezeDeep(array) // [ "a", "b", "c", [ "d", "e" ] ]
 *
 * frozen[3].push("f") // throws an error
 * frozen.push("f") // throws an error
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#FreezeDeep API Documentation}
 */
export function FreezeDeep<T>(array: T[]): T[]

/**
 * Checks if the array contains the given value. This is a
 * wrapper around {@link Find}.
 *
 * @alias Contains
 * @param array The array to search.
 * @param value The value to search for.
 * @param fromIndex The index to start searching from.
 * @returns Whether the array contains the value.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let contains = Contains(array, "b") // true
 * let contains = Contains(array, "f") // false
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Includes API Documentation}
 */
export function Includes<T>(array: T[], value?: T, fromIndex?: number): boolean

/**
 * Gets the last element of the array.
 *
 * @param array The array to get the last element of.
 * @returns The last element of the array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let last = Last(array) // "e"
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Last API Documentation}
 */
export function Last<T>(array: T[]): T

/**
 * Maps each element of the array to a new value.
 *
 * @param array The array to map.
 * @param mapper The callback to map each element to.
 * @returns The mapped array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let mapped = Map(array, (element) => element.toUpperCase())
 * // [ "A", "B", "C", "D", "E" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Map API Documentation}
 */
export function Map<T, U>(
  array: T[],
  mapper: (element: T, index: number, array: T[]) => U
): U[]

/**
 * Removes the last element of the array and returns a new array
 * with the last element removed.
 *
 * @param array The array to pop.
 * @param popCount The number of elements to pop.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let popped = Pop(array) // [ "a", "b", "c", "d" ]
 * let popped = Pop(array, 2) // [ "a", "b", "c" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Pop API Documentation}
 */
export function Pop<T>(array: T[], popCount?: number): T[]

/**
 * Adds the given elements to the end of the array and returns
 * a new array with the elements added.
 *
 * @param array The array to push.
 * @param elements The elements to push.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let pushed = Push(array, "f", "g") // [ "a", "b", "c", "d", "e", "f", "g" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Push API Documentation}
 */
export function Push<T>(array: T[], ...elements: T[]): T[]

/**
 * Reduces the array to a single value, starting from the left. If no
 * initial value is given, the first element of the array is used.
 *
 * @param array The array to reduce.
 * @param reducer The callback to reduce each element to.
 * @param initialValue The initial value to start the reduction from.
 * @returns The reduced value.
 *
 * @example ```ts
 * const array = [ 1, 2, 3, 4, 5 ]
 *
 * let reduced = Reduce(array, (total, element) => total + element) // 15
 *
 * let reduced = Reduce(array, (total, element) => total + element, 10) // 25
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Reduce API Documentation}
 */
export function Reduce<T, U>(
  array: T[],
  reducer: (total: U, element: T, index: number, array: T[]) => U,
  initialValue?: U
): U

/**
 * Reduces the array to a single value, starting from the right. If no
 * initial value is given, the last element of the array is used.
 *
 * @param array The array to reduce.
 * @param reducer The callback to reduce each element to.
 * @param initialValue The initial value to start the reduction from.
 *
 * @example ```ts
 * const array = [ 1, 2, 3, 4, 5 ]
 *
 * let reduced = ReduceRight(array, (total, element) => total + element) // 15
 *
 * let reduced = ReduceRight(array, (total, element) => total + element, 10) // 25
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#ReduceRight API Documentation}
 */
export function ReduceRight<T, U>(
  array: T[],
  reducer: (total: U, element: T, index: number, array: T[]) => U,
  initialValue?: U
): U

/**
 * Removes the element at the given index and returns a new array
 * with the element removed.
 *
 * @param array The array to remove the element from.
 * @param index The index of the element to remove.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let removed = RemoveIndex(array, 2) // [ "a", "b", "d", "e" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#RemoveIndex API Documentation}
 */
export function RemoveIndex<T>(array: T[], index: number): T[]

/**
 * Removes the elements at the given indices and returns a new array
 * with the elements removed.
 *
 * @param array The array to remove the elements from.
 * @param indices The indices of the elements to remove.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let removed = RemoveIndices(array, 2, 4) // [ "a", "b", "d" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#RemoveIndices API Documentation}
 */
export function RemoveIndices<T>(array: T[], ...indices: number[]): T[]

/**
 * Removes the first element that matches the given value and returns a new array
 * with the element removed.
 *
 * @param array The array to remove the element from.
 * @param value The value to remove.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let removed = RemoveValue(array, "c") // [ "a", "b", "d", "e" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#RemoveValue API Documentation}
 */
export function RemoveValue<T>(array: T[], value: T): T[]

/**
 * Removes the elements that match the given values and returns a new array
 * with the elements removed.
 *
 * @param array The array to remove the elements from.
 * @param values The values to remove.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let removed = RemoveValues(array, "c", "e") // [ "a", "b", "d" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#RemoveValues API Documentation}
 */
export function RemoveValues<T>(array: T[], ...values: T[]): T[]

/**
 * Reverses the order of the elements in the array and returns a new array.
 *
 * @param array The array to reverse.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let reversed = Reverse(array) // [ "e", "d", "c", "b", "a" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Reverse API Documentation}
 */
export function Reverse<T>(array: T[]): T[]

/**
 * Sets the element at the given index to the given value and returns a new array.
 *
 * @param array The array to set the element in.
 * @param index The index of the element to set.
 * @param value The value to set the element to.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let set = SetIndex(array, 2, "z") // [ "a", "b", "z", "d", "e" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#SetIndex API Documentation}
 */
export function SetIndex<T>(array: T[], index: number, value?: T): T[]

/**
 * Removes elements from the start of the array and returns
 * the array with the elements removed.
 *
 * @param array The array to remove the elements from.
 * @param count The number of elements to remove.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let removed = Shift(array, 2) // [ "c", "d", "e" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Shift API Documentation}
 */
export function Shift<T>(array: T[], count?: number): T[]

/**
 * Randomises the order of the elements in the array and returns a new array.
 *
 * @param array The array to shuffle.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let shuffled = Shuffle(array) // [ "b", "c", "a", "e", "d" ]
 * ```
 */
export function Shuffle<T>(array: T[]): T[]

/**
 * Extracts a slice of the array and returns a new array.
 *
 * @param array The array to slice.
 * @param from The index to start the slice at.
 * @param to The index to end the slice at.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let slice = Slice(array, 1, 3) // [ "b", "c", "d" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Slice API Documentation}
 */
export function Slice<T>(array: T[], from?: number, to?: number): T[]

/**
 * Checks whether some element in the array satisfies the given predicate and
 * returns a boolean.
 *
 * @param array The array to check.
 * @param predicate The predicate to check each element against.
 * @returns Whether some element in the array satisfies the predicate.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let some = Some(array, (value) => value === "c") // true
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Some API Documentation}
 */
export function Some<T>(
  array: T[],
  predicate: (value: T, index?: number) => boolean | void
): boolean

/**
 * Sorts the elements of the array and returns a new array.
 *
 * @param array The array to sort.
 * @param comparator The callback to use to compare elements.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let sorted = Sort(array, (a, b) => a > b) // [ "e", "d", "c", "b", "a" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Sort API Documentation}
 */
export function Sort<T>(array: T[], comparator?: (a: T, b: T) => boolean): T[]

/**
 * Replaces a portion of an array with the given elements and returns a new array.
 *
 * @param array The array to splice.
 * @param start The index to start the splice at.
 * @param end The index to end the splice at.
 * @param elements The elements to splice in.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let spliced = Splice(array, 1, 3, [ "z", "y", "x" ]) // [ "a", "z", "y", "x", "e" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Splice API Documentation}
 */
export function Splice<T>(
  array: T[],
  start: number,
  end?: number,
  ...elements: T[]
): T[]

/**
 * Convert an array to a Set. This is not a native TypeScript Set,
 * as this doesn't exist in Luau. Sift's "sets" are dictionaries,
 * where the elements of the array become keys, and the value
 * is always `true`.
 *
 * @param array The array to convert.
 * @returns The new Set.
 *
 * @example ```ts
 * const array = [ "a", "b", "b", "c", "d", "e" ]
 *
 * let set = ToSet(array) // { "a": true, "b": true, "c": true, "d": true, "e": true }
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#ToSet API Documentation}
 */
export function ToSet<T>(array: T[]): { [key: string]: boolean }

/**
 * Inserts the given elements at the beginning of the array and
 * returns a new array.
 *
 * @param array The array to unshift.
 * @param elements The elements to unshift.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ "a", "b", "c", "d", "e" ]
 *
 * let unshifted = Unshift(array, "z", "y", "x") // [ "z", "y", "x", "a", "b", "c", "d", "e" ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Unshift API Documentation}
 */
export function Unshift<T>(array: T[], ...elements: T[]): T[]

/**
 * Updates the array at the given index using the `updater` function. If the
 * valid does not exist, it will be created using the `callback` function.
 *
 * @param array The array to update.
 * @param index The index to update.
 * @param updater The updater function.
 * @param callback The callback function to use if the index doesn't exist.
 * @returns The new array.
 *
 * @example ```ts
 * const array = [ 1, 2, 3, 4, 5 ]
 *
 * let updated = Update(array, 2, (value) => value + 1) // [ 1, 2, 4, 4, 5 ]
 * let updated = Update(array, 5, (value) => value + 1, () => 0) // [ 1, 2, 4, 4, 5, 0 ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Update API Documentation}
 */
export function Update<T>(
  array: T[],
  index: number,
  updater?: (value: T, index?: number) => T,
  callback?: (index?: number) => T
): T[]

/**
 * Zips together the values of two or more arrays and returns a new array.
 *
 * @param arrays The arrays to zip.
 * @returns The new array.
 *
 * @example ```ts
 * const array1 = [ 1, 2, 3 ]
 * const array2 = [ "hello", "world", "goodbye" ]
 *
 * let zipped = Zip(array1, array2) // [ [ 1, "hello" ], [ 2, "world" ], [ 3, "goodbye" ] ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#Zip API Documentation}
 */
export function Zip<T>(...arrays: T[]): T[]

/**
 * Zips together the values of two or more arrays and returns a new array,
 * filling in any missing values with `None`.
 *
 * @param arrays The arrays to zip.
 * @returns The new array.
 *
 * @example ```ts
 * const array1 = [ 1, 2, 3, 4 ]
 * const array2 = [ "hello", "world", "goodbye" ]
 *
 * let zipped = ZipWith(array1, array2, (a, b) => [ a, b ]) // [ [ 1, "hello" ], [ 2, "world" ], [ 3, "goodbye" ], [ 4, None ] ]
 * ```
 *
 * @see {@link https://csqrl.github.io/Sift/api/Array#ZipAll API Documentation}
 */
export function ZipAll<T>(...arrays: T[]): T[]
