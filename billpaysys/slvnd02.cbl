      ******************************************************************
      * slvnd02.cbl
      ******************************************************************
            select vendor-file
               assign to "vendor"
               organization is indexed
               record key is vendor-number
               alternate record key
                   is vendor-name with duplicates
               access mode is dynamic.
