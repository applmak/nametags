// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// google-chrome --headless --remote-debugging-port=9222

const CDP = require('chrome-remote-interface');
const fs = require('fs');
const path = require('path');

async function writePdf(html, pdf) {
  let client;
  try {
    // connect to endpoint
    client = await CDP();
    // extract domains
    const {Page} = client;
    // enable events then start!
    await Page.enable();
    await Page.navigate({url: html});
    await Page.loadEventFired();
    const base64EncodedData = await Page.printToPDF({
      landscape: false,
      displayHeaderFooter: false,
      printBackground: true,
      paperWidth: 8.5,
      paperHeight: 11,
      marginTop: 0,
      marginBottom: 0,
      marginLeft: 0,
      marginRight: 0,
      headerTemplate: '',
      footerTemplate: '',
    });
    fs.writeFileSync(pdf, base64EncodedData.data, {encoding: 'base64'});
  } catch (err) {
    console.error(err);
  } finally {
    if (client) {
      await client.close();
    }
  }
}

async function printNametag(html) {
  html = path.resolve(html);
  const pdf = path.format(
      Object.assign(path.parse(html), {ext: '.pdf', base: undefined}));
  console.log(html, pdf);
  await writePdf(`file://${html}`, pdf);
}

async function printNametags(htmls) {
  for (let h of htmls) {
    await printNametag(h);
  }
}

process.argv.shift();        // node
process.argv.shift();        // print.js
const htmls = process.argv;  // files to convert.
printNametags(htmls);
