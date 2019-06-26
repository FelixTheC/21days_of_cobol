      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
           SELECT VENDOR-FILE
               ASSIGN TO "vendor"
               ORGANIZATION IS INDEXED
               RECORD KEY IS VENDOR-NUMBER
               ACCESS MODE IS DYNAMIC.
