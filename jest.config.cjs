module.exports = {
  transform: {},
  testMatch: [
    "**/__tests__/**/*.mjs"
  ],
  moduleFileExtensions: [
    "mjs",
    // must include "js" to pass validation https://github.com/facebook/jest/issues/12116
    "js",
  ],
};
