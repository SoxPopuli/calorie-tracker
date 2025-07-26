//@ts-check

import { defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    dir: 'tests',
    include: ["**/*.res.mjs"],
  },
});
