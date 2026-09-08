# Resume

LaTeX source for Hardik Kheni's resume.

- Source: `hardikkheni-resume.tex`
- Output: `hardikkheni-resume.pdf`

## Build

```bash
latexmk -pdf hardikkheni-resume.tex
```

In VS Code with the **LaTeX Workshop** extension, save the `.tex` file and it
builds automatically. Settings live in `.vscode/settings.json`.

## When the build gets stuck

If latexmk keeps reporting an error from a *previous* run
(`pdflatex: gave an error in previous invocation of latexmk`) and the PDF
never updates, the build DB holds stale error state.

Run:

```bash
./fix-latex.sh
```

It does a full clean (`latexmk -C`) then a fresh rebuild.
Optional argument for a different file:

```bash
./fix-latex.sh other.tex
```

The VS Code config guards against this automatically:

- the build recipe runs `latexmk -c` (clean aux files, keep PDF) **before**
  every compile, so no run inherits a previous run's error state
- `-f` flag on latexmk — reprocesses instead of replaying an old error
- `latex-workshop.latex.autoClean.run: "onFailed"` — wipes aux files after a
  failed build

After editing `.vscode/settings.json`, run **Developer: Reload Window** in
VS Code for the changes to apply.

## Generated files

Build artifacts (`*.aux`, `*.log`, `*.fls`, `*.fdb_latexmk`, `*.synctex.gz`,
etc.) are git-ignored. See `.gitignore`.
