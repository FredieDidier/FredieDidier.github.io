# LaTeX CV

Source for the PDF CVs, in the same spirit as Francisco Cavalcanti's setup: the CV is a
LaTeX document compiled to PDF, not a hand-written web page. The site's CV tab embeds the
English PDF and offers both languages for download.

```
preamble.tex   layout, colours, macros — shared by both languages
cv-en.tex      English CV
cv-pt.tex      Portuguese CV
```

## Building

```sh
cd cv-latex
./build.sh
```

That compiles both languages twice each and copies the results to `../files/`, which is
where the site links them from. To build one by hand:

```sh
xelatex cv-en.tex          # run twice if you add or remove sections
cp cv-en.pdf ../files/CV_Fredie_Didier_ENG.pdf
```

Use **xelatex**, not pdflatex. XeLaTeX loads Palatino and Helvetica Neue from the system;
pdflatex falls back to Latin Modern, which still compiles but looks different.

## Editing

Edit content in `cv-en.tex` / `cv-pt.tex`. Edit anything visual in `preamble.tex` once and
both languages pick it up. Two macros do all the work:

- `\entry{Title}{Date}{Affiliation}{Description}` — dated rows (education, positions,
  RA work, teaching). Title flush left, date flush right. Pass `{}` to omit the
  affiliation or the description.
- `\paper{Title}{Coauthors}` — papers. Pass `{}` for solo work.

Paper titles stay in English in both versions, since the papers are written in English.

Colours match the website (`../assets/css/style.css`): petrol `#1F4E5F`, soft ink
`#4A4844`, rules `#DDD6CA`.

## Two gotchas in preamble.tex — don't undo them

1. `\MakeUppercase` must stay wrapped in `\sectiontitle` and sit in titlesec's
   *before-code* slot. Put it in the format slot and it leaks into the trailing rule,
   uppercasing `\color{rule}` into `\color{RULE}` — an undefined colour.
2. `\headingfont` needs `Ligatures=TeX`. Without it, `--` and `---` in dates and
   affiliations render as literal hyphens rather than en/em dashes.
