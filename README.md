# Curriculum Vitae

This is Filippo Vissani's curriculum vitae, written in [Typst](https://typst.app/) using the [basic-resume](https://typst.app/universe/package/basic-resume/) template.

## Requirements

- [Typst](https://typst.app/) compiler

## Building

To compile the CV to PDF:

```bash
# Using npm script
npm run build

# Or directly with Typst
typst compile main.typ main.pdf
```

## Template

This CV uses the `basic-resume` template v0.2.9, which is designed to work well with ATS (Applicant Tracking Systems).

## Automatic Builds

The CV is automatically compiled to PDF on every push to the main branch using GitHub Actions. The compiled PDF is released using semantic-release.

## Migration from LaTeX

This CV was migrated from LaTeX to Typst to take advantage of Typst's modern typography engine and simpler syntax while maintaining professional output quality.

### Notable Changes

- **Template**: Now uses the `basic-resume` template which is optimized for ATS systems
- **Photo**: Includes a professional photo in the header (uses `picture.jpg`)
- **Build system**: Switched from LaTeX compilation to Typst compilation
- **File structure**: All content is now in a single `main.typ` file instead of multiple `.tex` files
