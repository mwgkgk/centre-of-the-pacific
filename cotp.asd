(defsystem "cotp"
  :version "0.0.420"

  ; #:com.google.base is used for prefixp "Swank"
  :depends-on (#:com.google.base :swank)

  :components ((:module "src"
                :serial t
                :components
                ((:file "package")
                 (:file "live-repl")
                 (:module "conf"
                  :serial t
                  :components
                  ((:file "groups")
                   (:file "rules")))))))
