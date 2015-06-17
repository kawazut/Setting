;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;
(add-to-list 'load-path "~/.emacs.d/lisp")
;; オープニングメッセージを表示しない
(setq inhibit-startup-message t)
;; 行の最後に来たら、新しい行を作らない
(setq next-line-add-newlines nil)
;; オートセーブファイルを作成しない
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)
;; 1行づつスクロールする
(setq scroll-conservatively 1)
;; 対応する括弧をハイライトする
(show-paren-mode 1)
;; 対応する括弧の色の設定
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "grey")
(set-face-foreground 'show-paren-match-face "black")
;; リージョンを色付きにする
(transient-mark-mode 1)
;; 予約語を色分けする
(global-font-lock-mode t)
;; オートインデント
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)
;; C-c c で compile コマンドを呼び出す
(define-key mode-specific-map "c" 'compile)
;; C-c C-z で shell コマンドを呼び出す
;(define-key mode-specific-map "¥C-z" 'shell-command)

;; shell-command のコマンド入力に補完が効くようにする
(require 'shell-command)
(shell-command-completion-mode)

;;nnで「ん」
(setq quail-japanese-use-double-n t)
;;mozc有効
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
;
;(setq mozc-candidate-style 'overlay)
(setq mozc-candidate-style 'echo-area)

;; Cut & Past
(global-set-key "\C-v" 'yank)
(global-set-key "\C-z" 'undo)
;; --
(global-set-key "\C-x\c" 'find-file-other-frame)
;; C-x C-b でバッファリストを開く時に、ウィンドウを分割しない
(global-set-key "\C-x\C-b" 'buffer-menu)

;;; byte-compile 関連
;;
(setq debug-on-error t)
;;
(eval-and-compile (require 'cl))
;; Compile-Log の非表示
(let ((win (get-buffer-window "*Compile-Log*")))
  (when win (delete-window win)))
;; Warning の抑制
;; 透明度を変更するコマンド M-x set-alpha
(set-frame-parameter nil 'alpha 80)
;; http://qiita.com/marcy@github/items/ba0d018a03381a964f24
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(80))))

;; ---
;(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;;左に行番号表示
;(require 'linum)
;(global-linum-mode)
(setq *c-mode-hook* '(lambda ()
                       (global-linum-mode)
                       )
)
;;
(require 'smart-compile)
;; Python Dev
;; Ruby Dev
;(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
;(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))
;; lua Dev
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

