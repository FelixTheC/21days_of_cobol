      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
            select voucher-file
               assign to "voucher"
               organization is indexed
               record key is voucher-number
               access mode is dynamic.
