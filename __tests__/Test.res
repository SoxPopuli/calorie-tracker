open Jest

describe("test", () => {
  open Expect

  test("a", () => {
    expect(1 + 1)->toBe(2)
  })
})
