;;; Fri Jul 29 19:13:57 UTC 2022

(in-package #:centre-of-the-pacific)

(defparameter port 44820)
;;; TODO
; (defparameter port-file #p"~/.config/port-files/cotp")

(defun open-repl ()
  (swank:create-server :port port :dont-close t)
  (wait-for-swank-thread))

;;; > https://github.com/brown/swank-client

(defun swank-thread ()
    "Returns a thread that's acting as a Swank server."
      (dolist (thread (sb-thread:list-all-threads))
            (when (com.google.base:prefixp "Swank"
                                           (sb-thread:thread-name
                                             thread))
                    (return thread))))

(defun wait-for-swank-thread ()
    "Wait for the Swank server thread to exit."
      (let ((swank-thread (swank-thread)))
            (when swank-thread
                    (sb-thread:join-thread swank-thread))))

;;; Sat Jul 30 16:53:50 UTC 2022

#+#:nil
(defun open-vlime-connection ()
  (when (not (boundp '*vlime-loaded*))
    (vlime:main :interface #(127 0 0 1)
                ;; TODO pick a free port automatically and use :port-file
                :port 44820
                :backend :vlime-usocket)
    (defparameter *vlime-loaded* t)))
