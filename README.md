# Nametag generator

A few tools for making nametags for a conference.
Note: This is not an officially supported Google product.

## Usage

1. First design a nametag in HTML.
1. Next, set up a form to gather data about the people who need nametags.
1. In the form's sheet, make a new sheet that munges the data so that it's appropriate for display.
1. Save the sheet as a tab-delimited file `.tsv`.
1. Modify nametags.py so that it extracts the right data from the `tsv` and substitutes correctly.
1. Change the nametag to have python-style `%s` named delimiters for sections you want to replace.
1. Run python nametags.py nametags.tpl mycooldata.tsv. You'll end up with an .html file per row of the tsv. Note that HTML is awesome for this purpose, but it's not so good at sizing text to fit a box. No problem, this script can help you out:

    ```javascript
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
```
    Just sprinkle that the `one-line` class wherever you want some text to take up a single line, and the script will find the largest font size that makes it fit.

1. Now, run `npm install`, because of course.
1. Generate pdfs from these html files via headless Chrome: `node print.js *.html`
1. Crop the pdfs: `ls *.pdf | xargs -n 1 pdfcrop`.
1. Make them 2-up (or whatever): `pdfnup --nup 2x1 --paper letter --no-landscape --frame true --no-tidy --scale 1 *-crop.pdf -o all.pdf`
1. Print them.
1. Cut them.
1. Install into badge holders.
1. Add lanyards.
