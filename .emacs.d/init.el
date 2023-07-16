
;; init.el

;; ###########################################
;;  el-getの設定
;; ###########################################

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file "lisp"))


;; ###########################################
;;  パッケージのインストールと設定
;; ###########################################

;; helmの設定
(el-get-bundle helm)
(require 'helm)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(setq helm-split-window-inside-p t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-echo-input-in-header-line t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-a") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c o") 'helm-occur)
(global-set-key (kbd "C-c i") 'helm-imenu)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;; auto-complete
(el-get-bundle auto-complete)
(require 'auto-complete)
(require 'fuzzy)
(setq ac-use-fuzzy t)
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-delay 0)
(setq ac-auto-show-menu 0.05)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)
(setq ac-menu-height 25)
(setq ac-auto-start 2)
(setq ac-ignore-case t)
(define-key ac-completing-map (kbd "<tab>") 'ac-complete)

;; googlethis
(el-get-bundle Kungsgeten/selected.el)
(el-get-bundle Malabarba/emacs-google-this)
(google-this-mode 1)
(with-eval-after-load "google-this"
  (defun my:google-this()
    "選択範囲をGoogleで検索する"
    (interactive)
    (message "ok")
    (google-this (current-word) t)))
(when (require 'selected nil t)
  (define-key selected-keymap (kbd ";") #'comment-dwim)
  (define-key selected-keymap (kbd "=") #'count-words-region)
  (define-key selected-keymap (kbd "f") #'describe-function)
  (define-key selected-keymap (kbd "g") #'my:google-this)
  (selected-global-mode 1)
)    

;; magit
(el-get-bundle magit)

;; ###########################################
;; 見た目の設定
;; ###########################################      
;; テーマの設定
(load-theme 'deeper-blue t)

;; ###########################################
;; エディタの設定
;; ###########################################      
;; カッコの強調
(show-paren-mode t)

;; 改行で自動でインデントする
(global-set-key "\C-m" 'newline-and-indent)

;; C-kで行全体を削除する
(setq kill-whole-line t)

;; エラー音を鳴らなくする
(setq ring-bell-function 'ignore)

;; Undo
(global-set-key (kbd "C-z") 'undo)

;; tabキーを有効化する
(setq-default indent-tabs-mode t)
(setq default-tab-width 4)


;; 行番号の表示
(if (version<= "26.0.50" emacs-version)
    (progn
      (global-display-line-numbers-mode)
      (set-face-attribute 'line-number nil
			  :foreground "DarkOliveGreen"
			  :background "#131521")
      (set-face-attribute 'line-number-current-line nil
			  :foreground "gold")))

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; windowの切り替えをShift + 矢印で行う
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; カレントの行を強調する
(global-hl-line-mode t)


