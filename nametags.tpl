<!--
Copyright 2019 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<html>
<head>
  <style>
    @import url('https://fonts.googleapis.com/css?family=PT+Sans');
    @import url('https://fonts.googleapis.com/css?family=M+PLUS+1p:400,900');

    @page {
      margin: 0;
      size: auto;
    }
    html {
      position: relative;
      width: 4.25in; height: 6in;
      margin: 0;
      padding: 0;
      padding: 0.25in;
      padding-top: 0.5in;
      border: 1px solid gray;
      box-sizing: border-box;
    }
    body {
      display: flex;
      flex-direction: column;
      height: 100%%;
      //border: 1px solid pink;
      padding: 0in;
      margin: 0in;
      overflow: hidden;
    }
    section {
      flex: 1 1;
    }
    h1, h2, h3 {
      text-align: center;
      white-space: nowrap;
      padding: 0px;
      margin: 0px;
    }
    h1 {
      font-size: 100pt;
      line-height: 100pt;
      font-family: 'M PLUS 1p';
      font-weight: 900;
    }
    h2 {
      font-size: 80pt;
      line-height: 80pt;
      font-family: 'M PLUS 1p';
    }
    h3 {
      font-size: 48pt;
      line-height: 36pt;
      font-family: 'PT Sans';
    }
    .pronoun {
      margin-left: -.25in;
      font-size: 24pt;
      font-family: 'PT Sans';
      line-height: 24pt;
      color: white;
      background-color: #777;
      padding: 2px;
      padding-left: 30px;
      padding-right: 10px;
      font-weight: 900;
    }
    footer {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      background-color: #336699;
      color: white;
      font-family: 'PT Sans';
      font-size: 18pt;
      padding-bottom: .3in;
      padding-top: .1in;
      text-align: center;
    }
    </style>
  </head>
  <body>
    <section>
      <h1 class="one-line" id="first-name">%(firstname)s</h1>
      <h2 class="one-line" id="last-name">%(lastname)s</h2>
    </section>
    <section style="display: flex; flex-direction: column; justify-content: center">
      <div>
        <span style="flex: 0 0" class="pronoun" id="pronoun">%(pronoun)s</span>
      </div>
    </section>
    <section>
      <h3 class="one-line" id="username">%(username)s@</h3>
      <h3 class="one-line" id="office" style="padding-top: .3in">%(office)s</h3>
    </section>
    <section style="max-height: .7in">
      <footer>My Conference 2018</footer>
    </section>
    <script>
      window.addEventListener('load', () => {
        for (let e of document.querySelectorAll('.one-line')) {
          // Read the initial font size:
          let fontSize = parseInt(window.getComputedStyle(e).fontSize);
          let lineHeight = parseInt(window.getComputedStyle(e).lineHeight);
          while (e.scrollWidth > e.offsetWidth) {
            fontSize *= 0.95;
            lineHeight *= 0.95;
            e.style.fontSize = `${fontSize.toFixed(2)}px`;
            e.style.lineHeight = `${lineHeight.toFixed(2)}px`;
            console.log(e.scrollWidth, e.offsetWidth);
          }
        }
      });
    </script>
  </body>
  </html>
