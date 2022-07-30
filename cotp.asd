(defsystem "centre-of-the-pacific"
  :version "0.0.420"

  :depends-on (#:swank)

  :components ((:module "src"
                :serial t 
                :components
                ((:file "package")
                 (:file "live-repl")))))
