open Jest

describe("test", () => {
  open Expect

  test("a", () => {
    expect(1 + 1)->toBe(2)
  })

  test("b", () => {
    expect(1 + 2)->toBe(2)
  })
})
