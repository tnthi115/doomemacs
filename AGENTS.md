# AGENTS.md

**🚨 AGENTIC MODEL MANDATE (READ FIRST) 🚨**

- **Do NOT write or commit code that causes syntax errors.**
- **You MUST test for syntax and LSP errors after every code change, not just at the end.**
- **If you are unsure, do NOT mark the task as complete.**
- **Never leave code in a broken or error state.**

---

## Agent Completion Checklist (MANDATORY)

Before marking any coding task as complete, you MUST:

1. **Check for Emacs Lisp syntax errors**
   - Run `doom build` and ensure there are no syntax errors or byte-compilation failures.
   - If editing interactively, use `M-x check-parens` and `M-x emacs-lisp-byte-compile-and-load` on the file.

2. **Check for LSP and lint errors**
   - Run `doom doctor` and resolve any reported issues.
   - Optionally, use `M-x checkdoc` or `M-x package-lint-current-buffer` for additional linting.

3. **Test configuration loads without errors**
   - Reload configuration (`M-x doom/reload`) or restart Emacs and check `*Messages*` for errors.

4. **Never leave code in a broken or error state**
   - If any errors are found, fix them before marking the task as complete.

**You MUST run these checks after every code change, not just at the end. Never mark a task as finished until all syntax, lint, and LSP errors are resolved.**

---

## Agentic Coding Guide for Doom Emacs Configuration

This repository contains a Doom Emacs configuration. Please follow these guidelines when making changes, running builds, or contributing code.

---

## Configuration Lookup Order

When searching for configuration, always check in this order:

1. **User’s Doom config directory:** `~/.config/doom/`
2. **User’s Emacs config directory:** `~/.config/emacs/`
3. **Upstream Doom Emacs config and documentation:**
   - [https://github.com/doomemacs/doomemacs](https://github.com/doomemacs/doomemacs)
   - [https://docs.doomemacs.org/](https://docs.doomemacs.org/)

Always prefer user-specific configuration first, then fall back to upstream or general documentation.

---

## Build, Lint, and Test Commands

- **Sync Doom modules and packages:**  
  `doom sync`

- **Update Doom Emacs and packages:**  
  `doom upgrade`

- **Rebuild all byte-compiled files:**  
  `doom build`

- **Lint Emacs Lisp code:**  
  `doom doctor`  
  (For more advanced linting, use `checkdoc` or `package-lint` within Emacs.)

- **Reload configuration without restarting Emacs:**  
  `M-x doom/reload`

- **Test configuration (interactive):**  
  Launch Emacs and check for errors in `*Messages*` or run `doom doctor`.

---

## Code Style and Best Practices

### General

- **Language:** Emacs Lisp
- **Indentation:** 2 spaces (no tabs)
- **Line length:** 80 characters recommended
- **Encoding:** UTF-8

### Naming Conventions

- Use `+` as a prefix for custom functions/variables (e.g., `+my-function`).
- Use `defvar`, `defcustom`, or `defconst` for configuration variables.
- Use `defun` for functions; prefer descriptive names.

### Imports and Packages

- Declare packages in `packages.el` using `package!`.
- Use `use-package!` in `config.el` for configuration.
- Avoid loading packages globally; use `:defer` or `:commands` for lazy loading.

### Functions and Macros

- Keep functions small and focused.
- Document all public functions with docstrings.
- Use `lambda` for short, inline functions.
- Use Doom macros (`map!`, `after!`, `use-package!`) for keybindings and package config.

### Error Handling

- Use `ignore-errors` or `condition-case` for non-critical code.
- Avoid suppressing errors silently in core logic.

### Keybindings

- Use `map!` macro for keybindings.
- Group related keybindings together.
- Use leader keys (`SPC`, `,`) as per Doom conventions.

### Comments and Documentation

- Use `;;;` for section headers, `;;` for regular comments.
- Document the purpose of each file at the top.
- Reference upstream issues or documentation where relevant.

---

## References

- [Doom Emacs Documentation](https://docs.doomemacs.org/)
- [Doom Emacs Style Guide](https://docs.doomemacs.org/latest/contributing/style-guide/)
- [Doom Emacs Developer Manual](https://docs.doomemacs.org/latest/contributing/development/)
- [Doom Emacs Themes (Canonical highlight/select face reference)](https://github.com/doomemacs/themes)
- [Emacs Lisp Style Guide](https://github.com/bbatsov/emacs-lisp-style-guide)
- [Joshua Blais' Doom Emacs Config](https://github.com/jblais493/nixos-config/tree/master/dotfiles/doom)
- [Derek Taylor's Doom Emacs Config](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/doom)
- [tnthi115/tvim (Personal Neovim Config)](https://github.com/tnthi115/tvim)
- [LazyVim (Neovim Starter & Reference)](https://www.lazyvim.org/)

---

**If you are an agentic coding agent, always:**

- Run `doom sync` after changing `init.el`, `config.el`, or `packages.el`.
- Run `doom build` after major changes to ensure byte-compilation.
- Lint your code before committing.
- Follow the style and best practices above.
- Reference the official Doom Emacs documentation for advanced configuration.
- For any theme work, always reference [Doom Emacs Themes](https://github.com/doomemacs/themes) for canonical highlight/select face definitions and palette usage. Match highlight/select backgrounds to the official themes for consistency.
- When implementing features or ensuring feature parity with Neovim, always reference [tnthi115/tvim (Personal Neovim Config)](https://github.com/tnthi115/tvim) and [LazyVim (Neovim Starter & Reference)](https://www.lazyvim.org/) for design, workflow, and configuration inspiration.

---

**Agent Completion Checklist (MANDATORY):**

Before finishing any coding task, you MUST:

1. **Check for Emacs Lisp syntax errors**
   - Run `doom build` and ensure there are no syntax errors or byte-compilation failures.
   - If editing interactively, use `M-x check-parens` and `M-x emacs-lisp-byte-compile-and-load` on the file.

2. **Check for LSP and lint errors**
   - Run `doom doctor` and resolve any reported issues.
   - Optionally, use `M-x checkdoc` or `M-x package-lint-current-buffer` for additional linting.

3. **Test configuration loads without errors**
   - Reload configuration (`M-x doom/reload`) or restart Emacs and check `*Messages*` for errors.

4. **Never leave code in a broken or error state**
   - If any errors are found, fix them before marking the task as complete.

**Never mark a task as finished until all syntax, lint, and LSP errors are resolved.**

---
