;; init.el

;; ###########################################
;;  packageの設定
;; ###########################################
(package-initialize)
      
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
;; タイトルにフルパス表示
(set-default 'mode-line-buffer-identification
	     '(buffer-file-name ("%f")("%b")))

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; windowの切り替えをShift + 矢印で行う
(windmove-default-keybindings)
(setq windmove-wrap-around t)

(mouse-wheel-mode t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 2) ((control)))
      mouse-wheel-progressive-speed nil)
(setq scroll-preserve-screen-position 'always)

;; カレントの行を強調する
(global-hl-line-mode t)

