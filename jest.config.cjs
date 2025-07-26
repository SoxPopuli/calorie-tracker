module.exports = {
  transform: {},
  testMatch: [
    "**/__tests__/**/*.cjs"
  ],
  moduleFileExtensions: [
    "cjs",
    // must include "js" to pass validation https://github.com/facebook/jest/issues/12116
    "js",
  ],
};
