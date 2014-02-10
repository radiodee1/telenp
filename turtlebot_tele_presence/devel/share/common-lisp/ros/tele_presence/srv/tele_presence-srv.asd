
(cl:in-package :asdf)

(defsystem "tele_presence-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CreateMap" :depends-on ("_package_CreateMap"))
    (:file "_package_CreateMap" :depends-on ("_package"))
    (:file "BasicLaunch" :depends-on ("_package_BasicLaunch"))
    (:file "_package_BasicLaunch" :depends-on ("_package"))
    (:file "BasicStop" :depends-on ("_package_BasicStop"))
    (:file "_package_BasicStop" :depends-on ("_package"))
    (:file "PictureMap" :depends-on ("_package_PictureMap"))
    (:file "_package_PictureMap" :depends-on ("_package"))
  ))