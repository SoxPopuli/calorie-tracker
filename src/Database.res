type runResult = {
  changes: int,
  lastInsertRowId: int,
}

module External = {
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
}

module type IDatabase = {
  type conn
  type openOptions

  let openDatabase: (string, ~options: openOptions=?) => promise<conn>
  let run: (conn, string, ~params: {..}=?) => promise<runResult>
  let exec: (conn, string) => promise<unit>
  let getAll: (conn, string, ~params: {..}=?) => promise<array<'a>>
  let getEach: (conn, string, ~params: {..}=?) => AsyncIterator.t<'a>
}

module type Database = {
  include IDatabase

  let getTwo: (conn) => promise<array<'a>>
}

module Make = (D: IDatabase): Database => {
  include D

  let getTwo = (c: D.conn) => {
    getAll(c, "SELECT * FROM * LIMIT 2")
  }
}

module Sqlite = Make({
  type conn = External.conn
  type openOptions = {
    options?: External.sqliteOpenOptions,
    directory?: string,
  }
  include External.Async

  let openDatabase = (c, ~options=?) => {
    let (options, dir) = switch options {
    | Some(o) => (o.options, o.directory)
    | None => (None, None)
    }
    External.Async.openDatabase(c, ~options?, ~directory=?dir)
  }
})

type t = {
  db: module(Database)
}

let t1 = {
  db: module(Sqlite)
}
