 :A
               echo enter password to activate programme
               set/p "pass=>"
               if NOT %pass%== 147369 goto :FAIL
 :FAIL
               echo Invalid password
               goto :end
               :end

