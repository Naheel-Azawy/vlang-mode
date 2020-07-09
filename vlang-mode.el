;;; vlang-mode.el --- Major mode for the V programming language

;;; Commentary:

;; Copyright 2020 Naheel Azawy.  All rights reserved.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Author: Naheel Azawy
;; Version: 1.0.0
;; Keywords: v vlang languages
;; URL: https://github.com/Naheel-Azawy/vlang-mode.el
;;
;; This file is not part of GNU Emacs.

;;; Code:

(setq vlang-font-lock-keywords
      (let* (
             ;; define several category of keywords
             (x-keywords '("as" "assert" "break" "const" "continue" "defer" "else" "enum" "fn" "for" "go" "goto" "if" "import" "in" "interface" "is" "match" "module" "mut" "none" "or" "pub" "return" "struct" "type" "unsafe" "sizeof" "typeof"))
             (x-types '("bool" "string" "i8" "i16" "int" "i64" "i128" "byte" "u16" "u32" "u64" "u128" "rune" "f32" "f64" "size_t" "ssize_t" "char" "byteptr" "voidptr" "charptr" "any" "any_int" "any_float" "map"))
             (x-constants '("true" "false"))

             ;; generate regex string for each category of keywords
             (x-keywords-regexp  (regexp-opt x-keywords  'symbols))
             (x-types-regexp     (regexp-opt x-types     'symbols))
             (x-constants-regexp (regexp-opt x-constants 'symbols)))

        `(
          (,x-keywords-regexp  . font-lock-keyword-face)
          (,x-types-regexp     . font-lock-type-face)
          (,x-constants-regexp . font-lock-constant-face)
          )))
;;;###autoload
(define-derived-mode vlang-mode javascript-mode "V"
  "Major mode for editing V files"
  (setq-local font-lock-defaults '((vlang-font-lock-keywords))))
(add-to-list 'auto-mode-alist '("\\.v\\'"   . vlang-mode))
(add-to-list 'auto-mode-alist '("\\.vv\\'"  . vlang-mode))
(add-to-list 'auto-mode-alist '("\\.vsh\\'" . vlang-mode))

(provide 'vlang-mode)

;;; vlang-mode.el ends here
