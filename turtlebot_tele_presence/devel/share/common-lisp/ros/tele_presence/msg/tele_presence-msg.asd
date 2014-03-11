
(cl:in-package :asdf)

(defsystem "tele_presence-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :nav_msgs-msg
)
  :components ((:file "_package")
    (:file "MapWithMetaData" :depends-on ("_package_MapWithMetaData"))
    (:file "_package_MapWithMetaData" :depends-on ("_package"))
    (:file "MapListEntryList" :depends-on ("_package_MapListEntryList"))
    (:file "_package_MapListEntryList" :depends-on ("_package"))
    (:file "MapListEntry" :depends-on ("_package_MapListEntry"))
    (:file "_package_MapListEntry" :depends-on ("_package"))
    (:file "MapListElement" :depends-on ("_package_MapListElement"))
    (:file "_package_MapListElement" :depends-on ("_package"))
    (:file "MapWithMetaData" :depends-on ("_package_MapWithMetaData"))
    (:file "_package_MapWithMetaData" :depends-on ("_package"))
    (:file "MapListEntryList" :depends-on ("_package_MapListEntryList"))
    (:file "_package_MapListEntryList" :depends-on ("_package"))
    (:file "MapListEntry" :depends-on ("_package_MapListEntry"))
    (:file "_package_MapListEntry" :depends-on ("_package"))
    (:file "MapListElement" :depends-on ("_package_MapListElement"))
    (:file "_package_MapListElement" :depends-on ("_package"))
  ))