      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. newvnd01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            copy "slovnd01.cbl".
            copy "slvnd02.cbl".

       DATA DIVISION.
       FILE SECTION.

            copy "fdovnd01.cbl".
            copy "fdvnd04.cbl".

       WORKING-STORAGE SECTION.

       77   old-vendor-file-at-end             pic x.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            perform opening-procedure.
            perform main-process.
            perform closing-procedure.

       PROGRAM-DONE.
            STOP RUN.

       opening-procedure.
            open output vendor-file.
            open i-o old-vendor-file.

       closing-procedure.
            close vendor-file.
            close old-vendor-file.

       main-process.
            perform read-next-old-vendor-record.
            perform process-one-record
               until old-vendor-file-at-end = "Y".

       read-next-old-vendor-record.
            move "N" to old-vendor-file-at-end.
            read old-vendor-file next record
               at end
                   move "Y" to old-vendor-file-at-end.

       process-one-record.
            move old-vendor-record to vendor-record.
            perform write-vendor-record.

            perform read-next-old-vendor-record.

       write-vendor-record.
            write vendor-record
               invalid key
               display "ERROR WRITING VENDOR RECORD".
