;;; doom-kanagawa-theme.el --- Kanagawa theme for Doom Emacs -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: OpenCode Agent
;; Source: https://github.com/rebelot/kanagawa.nvim
;;
;;; Commentary:
;;  A dark theme based on the Kanagawa.nvim theme with "wave" palette and background.
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-kanagawa-theme nil
  "Options for doom-kanagawa theme."
  :group 'doom-themes)

(defcustom doom-kanagawa-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-kanagawa-theme
  :type 'boolean)

(defcustom doom-kanagawa-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-kanagawa-theme
  :type 'boolean)

(defcustom doom-kanagawa-comment-bg doom-kanagawa-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their legibility."
  :group 'doom-kanagawa-theme
  :type 'boolean)

(defcustom doom-kanagawa-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-kanagawa-theme
  :type '(or integer boolean))


;;
;;; Theme definition

(defconst kanagawa-wave-palette
  '((sumiInk0      . "#16161D")
    (sumiInk1      . "#181820")
    (sumiInk2      . "#1a1a22")
    (sumiInk3      . "#1F1F28")
    (sumiInk4      . "#2A2A37")
    (sumiInk5      . "#363646")
    (sumiInk6      . "#54546D")
    (waveBlue1     . "#223249")
    (waveBlue2     . "#2D4F67")
    (winterGreen   . "#2B3328")
    (winterYellow  . "#49443C")
    (winterRed     . "#43242B")
    (winterBlue    . "#252535")
    (autumnGreen   . "#76946A")
    (autumnRed     . "#C34043")
    (autumnYellow  . "#DCA561")
    (samuraiRed    . "#E82424")
    (roninYellow   . "#FF9E3B")
    (waveAqua1     . "#6A9589")
    (dragonBlue    . "#658594")
    (oldWhite      . "#E8E4D8")
    (fujiWhite     . "#E8E4D8")
    (fujiGray      . "#727169")
    (oniViolet     . "#957FB8")
    (oniViolet2    . "#b8b4d0")
    (crystalBlue   . "#7E9CD8")
    (springViolet1 . "#938AA9")
    (springViolet2 . "#9CABCA")
    (springBlue    . "#7FB4CA")
    (lightBlue     . "#A3D4D5")
    (waveAqua2     . "#7AA89F")
    (springGreen   . "#98BB6C")
    (boatYellow1   . "#938056")
    (boatYellow2   . "#C0A36E")
    (carpYellow    . "#E6C384")
    (sakuraPink    . "#D27E99")
    (waveRed       . "#E46876")
    (peachRed      . "#FF5D62")
    (surimiOrange  . "#FFA066")
    (katanaGray    . "#717C7C")
    (dragonBlack0  . "#0d0c0c")
    (dragonBlack1  . "#12120f")
    (dragonBlack2  . "#1D1C19")
    (dragonBlack3  . "#181616")
    (dragonBlack4  . "#282727")
    (dragonBlack5  . "#393836")
    (dragonBlack6  . "#625e5a")
    (dragonWhite   . "#c5c9c5")
    (dragonGreen   . "#87a987")
    (dragonGreen2  . "#8a9a7b")
    (dragonPink    . "a292a3")
    (dragonOrange  . "#b6927b")
    (dragonOrange2 . "#b98d7b")
    (dragonGray    . "#a6a69c")
    (dragonGray2   . "#9e9b93")
    (dragonGray3   . "#7a8382")
    (dragonBlue2   . "#8ba4b0")
    (dragonViolet  . "#8992a7")
    (dragonRed     . "#c4746e")
    (dragonAqua    . "#8ea4a2")
    (dragonAsh     . "#737c73")
    (dragonTeal    . "#949fb5")
    (dragonYellow  . "#c4b28a")
    ;; Lotus colors (for completeness)
    (lotusInk1     . "#545464")
    (lotusInk2     . "#43436c")
    (lotusGray     . "#dcd7ba")
    (lotusGray2    . "#716e61")
    (lotusGray3    . "#8a8980")
    (lotusWhite0   . "#d5cea3")
    (lotusWhite1   . "#dcd5ac")
    (lotusWhite2   . "#e5ddb0")
    (lotusWhite3   . "#f2ecbc")
    (lotusWhite4   . "#e7dba0")
    (lotusWhite5   . "#e4d794")
    (lotusViolet1  . "#a09cac")
    (lotusViolet2  . "#766b90")
    (lotusViolet3  . "#c9cbd1")
    (lotusViolet4  . "#624c83")
    (lotusBlue1    . "#c7d7e0")
    (lotusBlue2    . "#b5cbd2")
    (lotusBlue3    . "#9fb5c9")
    (lotusBlue4    . "#4d699b")
    (lotusBlue5    . "#5d57a3")
    (lotusGreen    . "#6f894e")
    (lotusGreen2   . "#6e915f")
    (lotusGreen3   . "#b7d0ae")
    (lotusPink     . "#b35b79")
    (lotusOrange   . "#cc6d00")
    (lotusOrange2  . "#e98a00")
    (lotusYellow   . "#77713f")
    (lotusYellow2  . "#836f4a")
    (lotusYellow3  . "#de9800")
    (lotusYellow4  . "#f9d791")
    (lotusRed      . "#c84053")
    (lotusRed2     . "#d7474b")
    (lotusRed3     . "#e82424")
    (lotusRed4     . "#d9a594")
    (lotusAqua     . "#597b75")
    (lotusAqua2    . "#5e857a")
    (lotusTeal1    . "#4e8ca2")
    (lotusTeal2    . "#6693bf")
    (lotusTeal3    . "#5a7785")
    (lotusCyan     . "#d7e3d8"))

  "Kanagawa Wave color palette for Emacs.")

(def-doom-theme doom-kanagawa-wave
    "A dark theme inspired by Kanagawa.nvim, using the wave palette and background."

  ;; Palette: Latest Kanagawa.nvim "wave" colors
  (
   ;; (bg         (list (alist-get 'sumiInk3 kanagawa-wave-palette) nil nil))       ;; sumiInk3
   (bg         (list (alist-get 'sumiInk3 kanagawa-wave-palette) nil nil))       ;; sumiInk3
   (bg-alt     (list (alist-get 'sumiInk0 kanagawa-wave-palette) nil nil))       ;; sumiInk0
   (base0      (list (alist-get 'sumiInk3 kanagawa-wave-palette) nil nil))       ;; sumiInk3
   (base1      (list (alist-get 'sumiInk4 kanagawa-wave-palette) nil nil))       ;; sumiInk4
   (base2      (list (alist-get 'sumiInk5 kanagawa-wave-palette) nil nil))       ;; sumiInk5
   (base3      (list (alist-get 'sumiInk6 kanagawa-wave-palette) nil nil))       ;; sumiInk6
   (base4      (list (alist-get 'dragonBlack6 kanagawa-wave-palette) nil nil))   ;; dragonBlack6
   (base5      (list (alist-get 'fujiGray kanagawa-wave-palette) nil nil))       ;; fujiGray
   (base6      (list (alist-get 'oldWhite kanagawa-wave-palette) nil nil))       ;; oldWhite
   (base7      (list (alist-get 'fujiWhite kanagawa-wave-palette) nil nil))      ;; fujiWhite
   (base8      (list (alist-get 'fujiWhite kanagawa-wave-palette) nil nil))      ;; fujiWhite
   (fg-alt     (list (alist-get 'oldWhite kanagawa-wave-palette) nil nil))       ;; oldWhite
   (fg         (list (alist-get 'fujiWhite kanagawa-wave-palette) nil nil))      ;; fujiWhite
   (grey       base5)
   (red        (list (alist-get 'waveRed kanagawa-wave-palette) nil nil))        ;; waveRed
   (orange     (list (alist-get 'surimiOrange kanagawa-wave-palette) nil nil))   ;; surimiOrange
   (green      (list (alist-get 'springGreen kanagawa-wave-palette) nil nil))    ;; springGreen
   (teal       (list (alist-get 'waveAqua2 kanagawa-wave-palette) nil nil))      ;; waveAqua2
   (yellow     (list (alist-get 'carpYellow kanagawa-wave-palette) nil nil))     ;; carpYellow
   (blue       (list (alist-get 'crystalBlue kanagawa-wave-palette) nil nil))    ;; crystalBlue
   (dark-blue  (list (alist-get 'waveBlue1 kanagawa-wave-palette) nil nil))      ;; waveBlue1
   (magenta    (list (alist-get 'oniViolet kanagawa-wave-palette) nil nil))      ;; oniViolet
   (violet     (list (alist-get 'springViolet1 kanagawa-wave-palette) nil nil))  ;; springViolet1
   (cyan       (list (alist-get 'waveAqua1 kanagawa-wave-palette) nil nil))      ;; waveAqua1
   (dark-cyan  (list (alist-get 'springBlue kanagawa-wave-palette) nil nil))     ;; springBlue
   (pink       (list (alist-get 'sakuraPink kanagawa-wave-palette) nil nil))     ;; sakuraPink
   (bg-popup   (list nil nil nil))                                               ;; transparent popup (bg_gutter = "none")
   (bg-search  (list (alist-get 'waveBlue2 kanagawa-wave-palette) nil nil))      ;; waveBlue2
   (bg-diff-add    (list (alist-get 'winterGreen kanagawa-wave-palette) nil nil))   ;; winterGreen
   (bg-diff-change (list (alist-get 'winterYellow kanagawa-wave-palette) nil nil))  ;; winterYellow
   (bg-diff-delete (list (alist-get 'winterRed kanagawa-wave-palette) nil nil))     ;; winterRed
   (bg-diff-line   (list (alist-get 'winterBlue kanagawa-wave-palette) nil nil))    ;; winterBlue
   (bg-tab-selected (list (alist-get 'sumiInk4 kanagawa-wave-palette) nil nil))     ;; sumiInk4
   (git-add    (list (alist-get 'autumnGreen kanagawa-wave-palette) nil nil))       ;; autumnGreen
   (git-del    (list (alist-get 'autumnRed kanagawa-wave-palette) nil nil))         ;; autumnRed
   (git-change (list (alist-get 'autumnYellow kanagawa-wave-palette) nil nil))      ;; autumnYellow
   (diag-error (list (alist-get 'samuraiRed kanagawa-wave-palette) nil nil))        ;; samuraiRed
   (diag-warning (list (alist-get 'roninYellow kanagawa-wave-palette) nil nil))     ;; roninYellow
   (diag-info  (list (alist-get 'dragonBlue kanagawa-wave-palette) nil nil))        ;; dragonBlue
   (diag-hint  (list (alist-get 'waveAqua1 kanagawa-wave-palette) nil nil))         ;; waveAqua1
   (highlight      blue)
   (vertical-bar   (doom-lighten bg 0.05))
   (selection      dark-blue)
   (builtin        red)
   (comments       (if doom-kanagawa-brighter-comments base6 base5))
   (doc-comments   (doom-lighten (if doom-kanagawa-brighter-comments base6 base5) 0.25))
   (constants      orange)
   (functions      blue)
   (keywords       magenta)
   (methods        cyan)
   (operators      teal)
   (type           yellow)
   (strings        green)
   (variables      fg)
   (numbers        orange)
   (region         (alist-get 'sumiInk4 kanagawa-wave-palette))
   (error          diag-error)
   (warning        diag-warning)
   (success        green)
   (vc-modified    git-change)
   (vc-added       git-add)
   (vc-deleted     git-del)
   (hidden     (list (alist-get 'dragonBlack3 kanagawa-wave-palette) "black" "black"))
   (-modeline-bright doom-kanagawa-brighter-modeline)
   (-modeline-pad
    (when doom-kanagawa-padded-modeline
      (if (integerp doom-kanagawa-padded-modeline) doom-kanagawa-padded-modeline 4)))
   (modeline-fg     nil)
   (modeline-fg-alt base6)
   (modeline-bg
    (if -modeline-bright
        base3
      `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        base3
      `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1)))
   )

  ;; Faces
  (
   ;; Default face (this is the most important fix)
   (default :background bg :foreground fg)

   ;; Universal background enforcement for major UI elements
   (buffer-menu-buffer :background bg :foreground fg)
   (internal-border :background bg)
   (header-line-highlight :background bg :foreground fg)
   (child-frame-border :background bg)
   (transient-separator :background bg)
   (transient-heading :background bg)

   ;; Line numbers and cursor line
   ((line-number &override) :foreground base5 :background bg)
   ((line-number-current-line &override) :foreground blue :background bg :weight 'bold)

   ;; Font lock
   (font-lock-comment-face :foreground comments :slant 'italic :background (if doom-kanagawa-comment-bg (doom-lighten bg 0.05) bg))
   (font-lock-doc-face :inherit 'font-lock-comment-face :slant 'italic :foreground doc-comments :background bg)
   (font-lock-constant-face :foreground constants :background bg)
   (font-lock-function-name-face :foreground functions :background bg)
   (font-lock-keyword-face :foreground keywords :slant 'italic :background bg)
   (font-lock-statement-face :foreground keywords :weight 'bold :background bg)
   (font-lock-string-face :foreground strings :background bg)
   (font-lock-type-face :foreground type :background bg)
   (font-lock-variable-name-face :foreground variables :background bg)
   (font-lock-warning-face :foreground warning :background bg)
   (font-lock-negation-char-face :foreground operators :background bg)
   (font-lock-preprocessor-face :foreground operators :background bg)
   (font-lock-preprocessor-char-face :foreground operators :background bg)
   (font-lock-regexp-grouping-backslash :foreground operators :background bg)
   (font-lock-regexp-grouping-construct :foreground operators :background bg)

   ;; Modeline
   (mode-line :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground modeline-fg :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,(alist-get 'sumiInk4 kanagawa-wave-palette))))
   (mode-line-inactive :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground modeline-fg-alt :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,(alist-get 'sumiInk4 kanagawa-wave-palette))))   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight) :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (mode-line-buffer-id :foreground highlight :bold bold :background (alist-get 'sumiInk4 kanagawa-wave-palette))

   ;; Doom modeline
   (doom-modeline-bar :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-buffer-modified :foreground orange :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-buffer-path :foreground blue :weight 'normal :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-buffer-file :foreground fg :weight 'normal :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-project-dir :foreground violet :weight 'normal :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-project-root-dir :foreground violet :weight 'normal :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-highlight :foreground blue :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-panel :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg)
   (doom-modeline-evil-normal-state :foreground green :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-evil-insert-state :foreground blue :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (doom-modeline-evil-visual-state :foreground magenta :background (alist-get 'sumiInk4 kanagawa-wave-palette))

   ;; Highlight line
   (hl-line :background (alist-get 'sumiInk4 kanagawa-wave-palette))

   ;; Ivy
   (ivy-current-match :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (ivy-minibuffer-match-face-1 :foreground blue :background bg)
   (ivy-minibuffer-match-face-2 :foreground orange :background bg)
   (ivy-minibuffer-match-face-3 :foreground green :background bg)
   (ivy-minibuffer-match-face-4 :foreground yellow :background bg)

   ;; Vertico
   (vertico-current :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)

   ;; Solaire mode
   (solaire-hl-line-face :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (solaire-region-face :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (solaire-mode-line-face :inherit 'mode-line :background (alist-get 'sumiInk4 kanagawa-wave-palette) :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,(alist-get 'sumiInk4 kanagawa-wave-palette))))
   (solaire-mode-line-inactive-face :inherit 'mode-line-inactive :background (alist-get 'sumiInk4 kanagawa-wave-palette) :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,(alist-get 'sumiInk4 kanagawa-wave-palette))))   ;; Magit
   (magit-diff-hunk-heading :foreground fg-alt :background bg :extend t)
   (magit-diff-hunk-heading-highlight :foreground fg :background bg :weight 'bold :extend t)
   (magit-section-heading :foreground blue :weight 'bold :background bg)
   (magit-branch-remote :foreground green :background bg)
   (magit-branch-local :foreground blue :background bg)
   (magit-branch-current :foreground teal :background bg)
   (magit-diff-added :foreground (doom-darken git-add 0.2) :background bg :extend t)
   (magit-diff-added-highlight :foreground git-add :background bg :weight 'bold :extend t)
   (magit-diff-removed :foreground (doom-darken git-del 0.2) :background bg :extend t)
   (magit-diff-removed-highlight :foreground git-del :background bg :weight 'bold :extend t)
   (magit-diff-lines-heading :foreground yellow :background bg :extend t)
   (magit-diff-context :foreground fg-alt :background bg)
   (magit-diff-context-highlight :foreground fg :background bg)

   ;; Rainbow delimiters
   (rainbow-delimiters-depth-1-face :foreground fg :background bg)
   (rainbow-delimiters-depth-2-face :foreground blue :background bg)
   (rainbow-delimiters-depth-3-face :foreground orange :background bg)
   (rainbow-delimiters-depth-4-face :foreground green :background bg)
   (rainbow-delimiters-depth-5-face :foreground cyan :background bg)
   (rainbow-delimiters-depth-6-face :foreground yellow :background bg)
   (rainbow-delimiters-depth-7-face :foreground teal :background bg)

   ;; Treemacs
   (treemacs-selected :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (treemacs-active :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (treemacs-root-face :foreground magenta :weight 'bold :height 1.2 :background bg)
   (doom-themes-treemacs-root-face :foreground magenta :weight 'bold :height 1.2 :background bg)
   (doom-themes-treemacs-file-face :foreground fg :background bg)
   (treemacs-directory-face :foreground fg-alt :background bg)
   (treemacs-file-face :foreground fg :background bg)
   (treemacs-git-modified-face :foreground yellow :background bg)
   (treemacs-git-added-face :foreground green :background bg)
   (treemacs-git-renamed-face :foreground orange :background bg)
   (treemacs-git-untracked-face :foreground teal :background bg)
   (treemacs-git-ignored-face :foreground (doom-lighten base5 0.6) :background bg)
   (treemacs-git-conflict-face :foreground red :background bg)
   (cfrs-border-color :background bg)
   (treemacs-fringe-indicator-face :foreground fg :background bg)
   (treemacs-tags-face :inherit 'font-lock-function-name-face :background bg)
   (treemacs-help-title-face :foreground fg :background bg)
   (treemacs-help-column-face :foreground blue :background bg)
   (treemacs-on-success-pulse-face :background bg :foreground fg)
   (treemacs-on-failure-pulse-face :background bg :foreground fg)
   (treemacs-directory-collapsed-face :foreground fg-alt :background bg)
   (treemacs-header-face :foreground fg :underline t :background bg)
   (treemacs-header-button-face :foreground fg :background bg)
   (treemacs-term-node-face :foreground green :background bg)
   (treemacs-async-loading-face :foreground yellow :background bg)
   (treemacs-peek-mode-indicator-face :foreground magenta :background bg)
   (treemacs-marked-file-face :foreground red :background bg)
   (treemacs-hl-line :background bg :extend t)
   (treemacs-file-face-extensions :inherit 'treemacs-file-face :background bg)
   (treemacs-directory-open-face :foreground fg-alt :background bg)
   (treemacs-git-unmodified-face :foreground fg :background bg)
   (treemacs-root-remote-face :inherit 'treemacs-root-face :foreground blue :background bg)
   (treemacs-root-remote-disconnected-face :inherit 'treemacs-root-face :foreground red :background bg)
   (treemacs-root-untagged-face :inherit 'treemacs-root-face :background bg)
   (treemacs-root-tagged-face :inherit 'treemacs-root-face :background bg)

   ;; Dashboard
   (dashboard-banner-logo-title :foreground fg :background bg)
   (dashboard-heading :foreground blue :background bg)
   (dashboard-text-banner :foreground fg :background bg)
   (dashboard-items-face :foreground fg :background bg)
   (dashboard-no-items-face :foreground base5 :background bg)
   (dashboard-navigator :foreground teal :background bg)
   (dashboard-footer :foreground fg-alt :background bg)
   (dashboard-footer-face :foreground fg-alt :background bg)
   (dashboard-loaded :foreground green :background bg)
   (dashboard-heading-face :foreground blue :background bg)
   (dashboard-selected-item :foreground blue :background (alist-get 'sumiInk4 kanagawa-wave-palette) :weight 'bold)
   (dashboard-active-item :foreground blue :background (alist-get 'sumiInk4 kanagawa-wave-palette) :weight 'bold)   (widget-button :foreground blue :bold t :background bg)
   (widget-button-pressed :foreground red :background bg)
   (widget-documentation :foreground fg-alt :background bg)
   (button :foreground blue :box '(:line-width 1 :style released-button) :background bg)

   ;; Buffer-local tooltip/help text
   (marginalia-documentation :foreground fg-alt :background bg)
   (marginalia-selected :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (marginalia-highlight :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg)
   (marginalia-current :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (completions-annotations :foreground fg-alt :background bg)
   (completions-common-part :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg)
   (completions-first-difference :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg)
   (completions-highlight :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg)
   (completions-selected :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)

   ;; Company
   (company-active-selection :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (company-tooltip :background bg :foreground fg)
   (company-tooltip-annotation :foreground cyan :background bg)
   (company-tooltip-annotation-selection :foreground cyan :weight 'bold :background bg)
   (company-tooltip-selection :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (company-tooltip-common :foreground yellow :weight 'bold :background bg)
   (company-tooltip-common-selection :foreground yellow :weight 'bold :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (company-scrollbar-bg :background bg)
   (company-scrollbar-fg :background bg)
   (company-preview :background bg :foreground fg)
   (company-preview-common :foreground yellow :weight 'bold :background bg)

   ;; Dired
   (dired-directory :foreground blue :background bg)
   (dired-marked :foreground yellow :background bg)
   (dired-symlink :foreground teal :background bg)
   (dired-header :foreground orange :background bg)

   ;; Flycheck
   (flycheck-error :underline `(:style wave :color ,diag-error) :background bg)
   (flycheck-warning :underline `(:style wave :color ,diag-warning) :background bg)
   (flycheck-info :underline `(:style wave :color ,diag-info) :background bg)

   ;; Org
   (org-level-1 :foreground blue :weight 'bold :extend t :height 1.2 :background bg)
   (org-level-2 :foreground magenta :weight 'bold :extend t :height 1.15 :background bg)
   (org-level-3 :foreground green :weight 'bold :extend t :height 1.1 :background bg)
   (org-level-4 :foreground yellow :weight 'bold :extend t :height 1.05 :background bg)
   (org-level-5 :foreground violet :weight 'bold :extend t :background bg)
   (org-level-6 :foreground red :weight 'bold :extend t :background bg)
   (org-level-7 :foreground cyan :weight 'bold :extend t :background bg)
   (org-level-8 :foreground teal :weight 'bold :extend t :background bg)
   (org-todo :foreground orange :weight 'bold :background bg)
   (org-done :foreground green :weight 'bold :background bg)
   (org-headline-done :foreground base5 :strike-through t :background bg)
   (org-link :foreground teal :underline t :background bg)
   (org-code :foreground yellow :background bg)
   (org-special-keyword :foreground magenta :background bg)
   (org-block :background bg :extend t)
   (org-block-begin-line :foreground base5 :background bg :extend t)
   (org-block-end-line :foreground base5 :background bg :extend t)
   (org-quote :foreground blue :background bg :extend t)
   (org-table :foreground violet :background bg)
   (org-document-title :foreground cyan :weight 'bold :height 1.3 :background bg)
   (org-document-info :foreground cyan :background bg)
   (org-date :foreground magenta :background bg)
   (org-drawer :foreground base5 :background bg)
   (org-agenda-structure :foreground blue :background bg)
   (org-agenda-date :foreground fg :background bg)
   (org-agenda-date-today :foreground fg :weight 'bold :background bg)
   (org-scheduled :foreground fg :background bg)
   (org-scheduled-today :foreground fg :background bg)
   (org-scheduled-previously :foreground base5 :background bg)
   (org-upcoming-deadline :foreground orange :background bg)
   (org-deadline-announce :foreground red :background bg)
   (org-formula :foreground green :background bg)
   (org-tag :foreground (doom-darken cyan 0.2) :weight 'normal :background bg)
   (org-checkbox :foreground blue :weight 'normal :background bg)
   (org-checkbox-statistics-todo :foreground blue :weight 'normal :background bg)
   (org-checkbox-statistics-done :foreground green :weight 'normal :background bg)

   ;; Terminal
   (term-color-black :foreground bg-alt :background bg)
   (term-color-red :foreground red :background bg)
   (term-color-green :foreground green :background bg)
   (term-color-yellow :foreground yellow :background bg)
   (term-color-blue :foreground blue :background bg)
   (term-color-magenta :foreground magenta :background bg)
   (term-color-cyan :foreground cyan :background bg)
   (term-color-white :foreground fg :background bg)

   ;; CSS
   (css-property :foreground green :background bg)
   (css-selector :foreground blue :background bg)
   (css-pseudo-class :foreground orange :background bg)

   ;; JavaScript/TypeScript
   (js2-function-param :foreground orange :background bg)
   (js2-object-property :foreground green :background bg)
   (typescript-this-face :foreground red :background bg)
   (typescript-access-modifier-face :foreground magenta :background bg)

   ;; Web-mode
   (web-mode-html-tag-face :foreground red :background bg)
   (web-mode-html-tag-bracket-face :foreground (doom-lighten red 0.3) :background bg)
   (web-mode-html-attr-name-face :foreground orange :background bg)
   (web-mode-html-attr-value-face :foreground green :background bg)
   (web-mode-css-property-name-face :foreground green :background bg)
   (web-mode-css-selector-face :foreground blue :background bg)
   (web-mode-json-key-face :foreground yellow :background bg)
   (web-mode-json-context-face :foreground orange :background bg)

   ;; Markdown
   (markdown-markup-face :foreground base5 :background bg)
   (markdown-header-face :inherit 'bold :foreground blue :background bg)
   (markdown-header-delimiter-face :foreground base5 :background bg)
   (markdown-metadata-key-face :foreground base5 :background bg)
   (markdown-metadata-value-face :foreground cyan :background bg)
   (markdown-list-face :foreground magenta :background bg)
   (markdown-bold-face :inherit 'bold :foreground orange :background bg)
   (markdown-italic-face :inherit 'italic :foreground green :background bg)
   (markdown-link-face :foreground blue :background bg)
   (markdown-url-face :foreground violet :underline t :background bg)
   (markdown-code-face :foreground yellow :background bg)
   (markdown-inline-code-face :foreground yellow :background bg)
   (markdown-blockquote-face :foreground base6 :slant 'italic :background bg)
   (markdown-table-face :foreground blue :background bg)

   ;; Whitespace
   (whitespace-empty :background bg)
   (whitespace-space :foreground base4 :background bg)
   (whitespace-tab :foreground base4 :background bg)
   (whitespace-newline :foreground base4 :background bg)
   (whitespace-line :background bg :foreground red)

   ;; LSP
   (lsp-face-highlight-read :background bg)
   (lsp-face-highlight-write :background bg)
   (lsp-face-highlight-textual :background bg)
   (lsp-headerline-breadcrumb-path-face :foreground base7 :background bg)
   (lsp-headerline-breadcrumb-path-error-face :foreground error :background bg)
   (lsp-headerline-breadcrumb-separator-face :foreground cyan :background bg)

   ;; Additional UI elements
   (isearch :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (tooltip :background bg :foreground fg)
   (fringe :background bg)
   (widget-field :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg)
   (widget-single-line-field :background (alist-get 'sumiInk4 kanagawa-wave-palette))

   ;; Help/documentation-related
   (help-key-binding :background bg :foreground fg)
   (Info-quoted :foreground green :background bg)
   (info-menu-star :foreground red :background bg)
   (help-argument-name :foreground orange :background bg)

   ;; Dashboard hover text and related elements
   (eldoc-highlight-function-argument :foreground yellow :bold t :background bg)
   (eldoc-box-border :background bg :foreground fg-alt)
   (eldoc-box-body :background bg :foreground fg)
   (dashboard-text-banner :foreground fg :background bg)
   (dashboard-banner-logo-title :foreground fg :background bg)
   (dashboard-items-face :foreground fg :background bg)
   (echo-area :background bg :foreground fg)
   (window-divider :foreground base4 :background bg)
   (window-divider-first-pixel :foreground base4 :background bg)
   (window-divider-last-pixel :foreground base4 :background bg)
   (minibuffer-prompt :foreground blue :background bg)

   ;; Popup windows
   (lsp-ui-doc-background :background bg)
   (lsp-ui-doc-header :background bg :foreground blue)
   (lsp-ui-doc-border :foreground fg-alt :background bg)
   (lsp-ui-peek-header :background bg :foreground blue)
   (lsp-ui-peek-highlight :foreground yellow :weight 'bold :background bg)
   (lsp-ui-peek-list :background bg)
   (lsp-ui-peek-filename :foreground blue :background bg)
   (lsp-ui-peek-line-number :foreground base5 :background bg)
   (lsp-ui-peek-selection :foreground fg :bold t :background bg)
   (lsp-ui-sideline-code-action :foreground yellow :background bg)
   (lsp-ui-sideline-current-symbol :foreground blue :weight 'bold :background bg)
   (lsp-ui-sideline-symbol :foreground fg-alt :background bg)

   ;; Transient/popup-menu faces
   (transient-separator :foreground base5 :background bg)
   (transient-heading :foreground blue :weight 'bold :background bg)
   (transient-argument :foreground green :weight 'bold :background bg)
   (transient-value :foreground teal :background bg)
   (transient-inactive-value :foreground base5 :background bg)
   (transient-inactive-argument :foreground base5 :background bg)

   ;; Popup menu faces
   (popup-face :foreground fg :background bg)
   (popup-menu-face :foreground fg :background bg)
   (popup-menu-selection-face :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg :weight 'bold)
   (popup-tip-face :foreground fg-alt :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (popup-menu-summary-face :foreground base5 :background bg)

   ;; Posframe faces
   (posframe-border :background bg)
   (posframe-fringe :background bg)

   ;; tab-bar and tab-line
   (tab-bar :background bg :foreground fg)
   (tab-bar-tab :background bg :foreground fg)
   (tab-bar-tab-inactive :background bg :foreground base5)
   (tab-line :background bg :foreground fg)
   (tab-line-tab :background bg :foreground fg)
   (tab-line-tab-inactive :background bg :foreground base5)
   (tab-line-tab-current :background bg :foreground fg)
   (tab-line-highlight :background (alist-get 'sumiInk4 kanagawa-wave-palette) :foreground fg)

   ;; which-key
   (which-key-key-face :foreground green :background bg)
   (which-key-group-description-face :foreground red :background bg)
   (which-key-command-description-face :foreground blue :background bg)
   (which-key-local-map-description-face :foreground orange :background bg)
   (which-key-separator-face :foreground base5 :background bg)
   (which-key-special-key-face :foreground yellow :weight 'bold :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (which-key-note-face :foreground base5 :background bg)
   (which-key-highlighted-command-face :foreground blue :weight 'bold :background (alist-get 'sumiInk4 kanagawa-wave-palette))
   (which-key-posframe :background bg)
   (which-key-posframe-border :background bg)

   ;; centaur-tabs
   (centaur-tabs-default :background bg :foreground fg)
   (centaur-tabs-selected :background bg :foreground fg :weight 'bold)
   (centaur-tabs-unselected :background bg :foreground base5)
   (centaur-tabs-selected-modified :background bg :foreground yellow :weight 'bold)
   (centaur-tabs-unselected-modified :background bg :foreground orange)
   (centaur-tabs-active-bar-face :background blue :background bg)
   (centaur-tabs-modified-marker-selected :foreground yellow :background bg)
   (centaur-tabs-modified-marker-unselected :foreground orange :background bg)
   (centaur-tabs-close-selected :inherit 'centaur-tabs-selected :foreground fg :background bg)
   (centaur-tabs-close-unselected :inherit 'centaur-tabs-unselected :foreground base5 :background bg)
   (centaur-tabs-close-mouse-face :foreground red :background bg)
   (centaur-tabs-name-mouse-face :foreground blue :bold t :background bg)
   (centaur-tabs-group-separator :foreground base2 :background bg)
   (centaur-tabs-group-separator-face :foreground base2 :background bg)
   (centaur-tabs-active-group-marker-face :foreground blue :weight 'bold :background bg)

   ;; Standard header line treatment
   (header-line :background bg :foreground fg)
   )
  )

(custom-set-faces!
  `(default :background ,(alist-get 'sumiInk3 kanagawa-wave-palette) :foreground ,(alist-get 'fujiWhite kanagawa-wave-palette))
  `(solaire-default-face :background ,(alist-get 'sumiInk3 kanagawa-wave-palette))
  `(solaire-mode-line-face :background ,(alist-get 'sumiInk4 kanagawa-wave-palette))
  `(solaire-mode-line-inactive-face :background ,(alist-get 'sumiInk4 kanagawa-wave-palette))
  `(header-line :background ,(alist-get 'sumiInk3 kanagawa-wave-palette))
  `(org-block :background ,(alist-get 'sumiInk3 kanagawa-wave-palette))
  `(org-block-begin-line :background ,(alist-get 'sumiInk3 kanagawa-wave-palette))
  `(org-block-end-line :background ,(alist-get 'sumiInk3 kanagawa-wave-palette))
  '(font-lock-comment-face :slant italic)
  `(region :background ,(alist-get 'waveBlue1 kanagawa-wave-palette)))

(provide 'doom-kanagawa-wave-theme)
;;; doom-kanagawa-theme.el ends here
