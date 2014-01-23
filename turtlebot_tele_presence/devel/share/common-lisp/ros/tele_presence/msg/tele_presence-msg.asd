
(cl:in-package :asdf)

(defsystem "tele_presence-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MapListEntryList" :depends-on ("_package_MapListEntryList"))
    (:file "_package_MapListEntryList" :depends-on ("_package"))
    (:file "MapListElement" :depends-on ("_package_MapListElement"))
    (:file "_package_MapListElement" :depends-on ("_package"))
  ))