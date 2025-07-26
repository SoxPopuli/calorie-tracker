open Vitest

describe("test", () => {
  open Expect

  test("a", t => {
    t->expect(1 + 1)->toBe(2)
  })

  test("b", t => {
    t->expect(1 + 2)->toBe(3)
  })
})
