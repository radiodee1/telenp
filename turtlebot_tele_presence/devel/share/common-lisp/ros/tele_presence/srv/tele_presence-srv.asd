
(cl:in-package :asdf)

(defsystem "tele_presence-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CreateMap" :depends-on ("_package_CreateMap"))
    (:file "_package_CreateMap" :depends-on ("_package"))
  ))