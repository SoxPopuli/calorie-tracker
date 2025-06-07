type conn

type libSQLOptions = {
  authToken: string,
  remoteOnly: bool,
  url: string,
}

type sqliteOpenOptions = {
  enableChangeListener?: bool,
  libSQLOptions?: libSQLOptions,
  useNewConnection?: bool,
}

type runResult = {
  changes: int,
  lastInsertRowId: int,
}

module Async = {
  @module("expo-sqlite")
  external openDatabase: (
    string,
    ~options: sqliteOpenOptions=?,
    ~directory: string=?,
  ) => promise<conn> = "openDatabaseAsync"

  @send
  external run: (conn, string, ~params: {..}=?) => promise<runResult> = "runAsync"

  @send
  external exec: (conn, string) => promise<unit> = "execAsync"

  @send
  external getAll: (conn, string, ~params: {..}=?) => promise<array<'a>> = "getAllAsync"

  @send
  external getEach: (conn, string, ~params: {..}=?) => AsyncIterator.t<'a> = "getEachAsync"
}

module Sync = {
  @module("expo-sqlite")
  external openDatabase: (string, ~options: sqliteOpenOptions=?, ~directory: string=?) => conn =
    "openDatabaseSync"

  @send
  external run: (conn, string, ~params: {..}=?) => runResult = "runSync"

  @send
  external exec: (conn, string) => unit = "execSync"

  @send
  external getAll: (conn, string, ~params: {..}=?) => array<'a> = "getAllSync"

  @send
  external getEach: (conn, string, ~params: {..}=?) => Iterator.t<'a> = "getEachSync"
}
