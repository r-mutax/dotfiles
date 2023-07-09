(defvar packages-to-install
  '(package1
    package2))

(dolist (package packages_to_install)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
