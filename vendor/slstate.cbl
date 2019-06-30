      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
            SELECT STATE-FILE
               ASSIGN TO "STATE"
               ORGANIZATION IS INDEXED
               RECORD KEY IS STATE-CODE
               ACCESS MODE IS DYNAMIC.
