/* globals gauge*/
"use strict";
const {
  openBrowser,
  write,
  closeBrowser,
  goto,
  $,
  scrollDown,
  checkBox,
  clear,
  button,
  near,
  click,
  screenshot,
  evaluate,
  inputField,
  contains,
  reload
} = require("taiko");

const assert = require("assert");

beforeSuite(async () =>
  openBrowser({
    headless: true,
    args: [
      '--disable-gpu',
      '--disable-dev-shm-usage',
      '--disable-setuid-sandbox',
      '--no-first-run',
      '--disable-save-password-bubble',
      '--no-sandbox',
      '--no-zygote']
  })
);
afterSuite(async () => closeBrowser());

gauge.screenshotFn = async function () {
  return await screenshot({encoding: "base64"});
};

step("compare <a> with <b>", (a, b) => {

  assert.equal(a, b);
});
