# [AUTO_EN]
server-ban-string-infinity = Forever
# [AUTO_EN]
server-ban-no-name = Not found. ({ $hwid })
# [AUTO_EN]
server-time-ban =
    Temporary ban for { $mins } { $mins ->
        [one] minute
        [few] minutes
       *[other] minutes
    }.
# [AUTO_EN]
server-perma-ban = Permanent ban.
# [AUTO_EN]
server-role-ban =
    Temporary job ban for { $mins } { $mins ->
        [one] minute
        [few] minutes
       *[other] minutes
    }.
# [AUTO_EN]
server-perma-role-ban = Permanent job ban.
# [AUTO_EN]
server-time-ban-string =
    > **Violator**
    > **Login:** ``{ $targetName }``
    > **Discord:** { $targetLink }
    
    > **Administrator**
    > **Login:** ``{ $adminName }``
    > **Discord:** { $adminLink }
    
    > **Issued:** { $TimeNow }
    > **Expires:** { $expiresString }
    
    > **Reason:** { $reason }
    
    > **Severity Level:** { $severity }
# [AUTO_EN]
server-ban-footer = { $server } | Round: #{ $round }
# [AUTO_EN]
server-perma-ban-string =
    > **Perpetrator**
    > **Login:** ``{ $targetName }``
    > **Discord:** { $targetLink }
    
    > **Administrator**
    > **Login:** ``{ $adminName }``
    > **Discord:** { $adminLink }
    
    > **Issued:** { $TimeNow }
    
    > **Reason:** { $reason }
    
    > **Severity Level:** { $severity }
# [AUTO_EN]
server-role-ban-string =
    > **Violator**
    > **Login:** ``{ $targetName }``
    > **Discord:** { $targetLink }
    
    > **Administrator**
    > **Login:** ``{ $adminName }``
    > **Discord:** { $adminLink }
    
    > **Issued:** { $TimeNow }
    > **Expires:** { $expiresString }
    
    > **Roles:** { $roles }
    
    > **Reason:** { $reason }
    
    > **Severity Level:** { $severity }
# [AUTO_EN]
server-perma-role-ban-string =
    > **Perpetrator**
    > **Login:** ``{ $targetName }``
    > **Discord:** ``{ $targetLink }``
    
    > **Administrator**
    > **Login:** ``{ $adminName }``
    > **Discord:** { $adminLink }
    
    > **Issued:** { $TimeNow }
    
    > **Roles:** { $roles }
    
    > **Reason:** { $reason }
    
    > **Severity Level:** { $severity }
