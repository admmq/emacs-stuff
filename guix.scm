(use-modules (guix)
             (guix git-download)
             (guix build-system emacs)
             ((guix licenses) #:prefix license:))

(package
  (name "emacs-stuff")
  (version "funky-version-number")
  (source (local-file "." "emacs-stuff-local-build"
                      #:recursive? #t
                      #:select? (const #t)))
  (build-system emacs-build-system)
  (arguments
   '(#:include '("\\.el$")
     #:exclude '("build.el"
                 ".dir-locals.el")
     #:phases
     (modify-phases %standard-phases
       (add-after 'unpack 'load-org-files
         (lambda _
           (invoke
            "emacs" "-Q" "--batch" "--load" "build.el"))))))
  (home-page "https://github.com/admmk/emacs-stuff")
  (synopsis "My emacs package")
  (description "My emacs package")
  (license license:gpl3+))
