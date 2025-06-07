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

@module("expo-sqlite")
external openAsync: (
  string,
  ~options: sqliteOpenOptions=?,
  ~directory: string=?,
) => promise<conn> = "openDatabaseAsync"

@module("expo-sqlite")
external openSync: (
  string,
  ~options: sqliteOpenOptions=?,
  ~directory: string=?,
) => conn = "openDatabaseSync"

type runResult = {
  changes: int,
  lastInsertRowId: int,
}

@send
external runAsync: (
  conn,
  string,
  ~params: {..}=?,
) => runResult = "runAsync"

@send
external runSync: (
  conn,
  string,
  ~params: {..}=?,
) => runResult = "runSync"

@send
external execAsync: (
  conn,
  string
) => unit = "execAsync"

@send
external execSync: (
  conn,
  string
) => unit = "execSync"


