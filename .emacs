;; dot emacs file
(package-initialize)

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'text-mode-hook-identify)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'emacs-startup-hook 'turn-on-auto-fill)

;; miscellaneous settings
(delete-selection-mode 1)
(setq inhibit-startup-message t) ; no message at startup
(setq frame-title-format "emacs - %b") ; format the titlebar
(setq icon-title-format "emacs - %b") ; format title icon
(setq resize-mini-windows nil) ; minibuffer does not expand
(set-scroll-bar-mode 'right) ; scrollbar to the right
(setq kill-whole-line t) ; collapse a whole line with C-k
(mouse-avoidance-mode 'animate) ; mouse pointer hides from cursor
(blink-cursor-mode nil) ;cursor does not blink
(mouse-wheel-mode t) ; enable mouse scroll
(setq mouse-wheel-progressive-speed nil) ; no super-fast mouse scrolling
(setq-default show-trailing-whitespace t) ; show trailing whitespace ...
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; remove on save
(show-paren-mode 1) ; show matching parentheses
(setq shell-file-name "/bin/sh") ; default shell
(require 'color-theme) ; enable color themes

;; latex settings
(load "auctex.el" nil t t)
(setq font-latex-fontify-sectioning 1.0)
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o")
				    ("^html$" "." "firefox %o"))))
(eval-after-load "tex" '(progn
     (add-to-list 'TeX-command-list '("Rubber + Clean"
    "rubber --pdf %t && rubber --clean %t"
    TeX-run-TeX nil t))))

(setq tool-bar-style 'image)

;; fonts

; set basic font
;(set-face-attribute 'default nil :height 99 :family "Andale Mono")

; comments in italics
;(make-face-italic 'font-lock-comment-face)
;(make-face-italic 'font-lock-comment-delimiter-face)

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 50)
(setq recentf-max-menu-items 20)
(desktop-save-mode t) ; save last session

;; my functions

(defun quick-line-copy ()
  "Copy the whole line."
  (interactive)
  (beginning-of-line)
  (let ((beg (line-beginning-position 1))
	(end (line-beginning-position 2)))
    (kill-new (buffer-substring beg end))))

(defun quick-line-copy-paste ()
  "Copy and paste the whole line."
  (interactive)
  (quick-line-copy) (yank))

;(defun tool-bar-add-recentf ()
;  "Add toolbar button for Recent Files."
;  (tool-bar-add-item "~/.emacs.d/icons/clock" (lambda ()
;			 (interactive)
;                         (popup-menu (easy-menu-filter-return
;				      (recentf-make-menu-items)
;				      "Open Recent")))
;		     'recent-files
;		     :visible '(and (boundp 'recentf-mode) recentf-mode)
;		     :help "Pop up the Recent Files menu"))

;; (defun tool-bar-add-pdf
;; latex ()
;;   "Add toolbar button for tex-pdf-mode."
;;   (tool-bar-add-item "~/.emacs.d/icons/pdflatex"
;; 		     'tex-pdf-mode
;; 		     :visible
;; 		     :help "Toggle LaTeX PDF mode"))

(defun smart-tab ()
      (interactive)
      (if (minibufferp)
          (minibuffer-complete)
	(if mark-active
            (indent-region (region-beginning)
                           (region-end))
          (if (looking-at "\\_>")
              (dabbrev-expand nil)
            (indent-for-tab-command)))))

;; auto time stamps patch for html files
(add-hook 'html-mode-hook '(lambda ()
	     ; keymap additions
	     (define-key html-mode-map "\C-ct"
	       'html-helper-insert-timestamp-delimiter-at-point)
	     ; additional mode vars
	     (defvar html-helper-timestamp-start
	       "<!-- hhmts start -->\n"
	       "*Start delimiter for timestamps.")
	     (defvar html-helper-timestamp-end
	       "<!-- hhmts end -->"
	       "*End delimiter for timestamps.")
	     ; additional mode functions
	     (defun html-helper-insert-timestamp ()
	       "Timestamp insertion function"
	       (insert "Last modified: "
		       (format-time-string
			"%e %B %Y at %H:%M GMT."
			(current-time)
			t)
		       "\n"))
	     (defun html-helper-update-timestamp ()
	       (save-excursion
		 (goto-char (point-max))
		 (if (not (search-backward
		 html-helper-timestamp-start nil t))
		     (message "timestamp delimiter start was not
		     found. Type C-c t to insert one.")
		   (let ((ts-start (+ (point) (length
		   html-helper-timestamp-start)))
			 (ts-end (if (search-forward
			 html-helper-timestamp-end nil t)
				     (- (point) (length
				   html-helper-timestamp-end))
				   nil)))
		     (if (not ts-end)
			 (message "timestamp delimiter end was
			 not found. Type C-c t to insert one.")
		       (delete-region ts-start ts-end)
		       (goto-char ts-start)
		       (html-helper-insert-timestamp))))) nil)
	     ; timestamp will update on file write
	     (add-hook 'local-write-file-hooks
		       'html-helper-update-timestamp)))


;; my keyboard shortcuts
(global-set-key "\C-p" 'quick-line-copy-paste) ; "pull" down line
(global-set-key [(tab)] 'smart-tab) ; TAB completion
(global-set-key (kbd "\C-x \C-b") 'ibuffer) ; buffers in text window
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key "\C-n" 'next-buffer)
(global-set-key "\C-l" 'previous-buffer)

;; pick theme after fully parsing .emacs
(color-theme-initialize)
;(load-theme 'deeper-blue t)
(load-theme 'misterioso t)
