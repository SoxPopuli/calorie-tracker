open Jest

module MockDb = Database.Make({
  type conn = unit
  type openOptions = unit

  let openDatabase = async (_c, ~options as _=?) => {
    ()
  }

  let run = async (_c, _s, ~params as _=?) => {
    {
      Database.changes: 0,
      lastInsertRowId: 0
    }
  }

  let exec = async (_c, _s) => {
    ()
  }

  let getAll = async (_c, _s, ~params as _=?) => {
    []
  }

  let getEach = (_c, _s, ~params as _=?) => {
    AsyncIterator.make(async () => {
      AsyncIterator.value: None,
      done: true,
    })
  }
})

describe("test", () => {
  open Expect

  test("a", () => {
    expect(1 + 1)->toBe(2)
  })
})
