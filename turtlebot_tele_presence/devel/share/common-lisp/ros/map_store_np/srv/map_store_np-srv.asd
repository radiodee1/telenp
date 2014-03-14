
(cl:in-package :asdf)

(defsystem "map_store_np-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RenameMap" :depends-on ("_package_RenameMap"))
    (:file "_package_RenameMap" :depends-on ("_package"))
    (:file "SaveMap" :depends-on ("_package_SaveMap"))
    (:file "_package_SaveMap" :depends-on ("_package"))
    (:file "PublishMap" :depends-on ("_package_PublishMap"))
    (:file "_package_PublishMap" :depends-on ("_package"))
    (:file "ListMaps" :depends-on ("_package_ListMaps"))
    (:file "_package_ListMaps" :depends-on ("_package"))
    (:file "DeleteMap" :depends-on ("_package_DeleteMap"))
    (:file "_package_DeleteMap" :depends-on ("_package"))
  ))