      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       01   DETAIL-LINE.
            05 PRINT-NUMBER               PIC 9(5).
            05 FILLER                     PIC X     VALUE SPACE.
            05 PRINT-NAME                 PIC X(30).
            05 FILLER                     PIC X(15) VALUE SPACE.
            05 PRINT-CONTACT              PIC X(30).

       01   CITY-STATE-LINE.
            05 FILLER                     PIC X(6)  VALUE SPACE.
            05 PRINT-CITY                 PIC X(20).
            05 FILLER                     PIC X     VALUE SPACE.
            05 PRINT-STATE                PIC X(2).
            05 FILLER                     PIC X     VALUE SPACE.
            05 PRINT-STATE-NAME           PIC X(20).
            05 FILLER                     PIC X(1)  VALUE SPACE.
            05 PRINT-ZIP                  PIC X(10).

       01   COLUMN-LINE.
            05 FILLER                     PIC X(2)  VALUE "NO".
            05 FILLER                     PIC X(4)  VALUE SPACE.
            05 FILLER                     PIC X(12)
                                              VALUE "NAME-ADDRESS".
            05 FILLER                     PIC X(33) VALUE SPACE.
            05 FILLER                     PIC X(17)
                                              VALUE "CONTACT-PHONE-ZIP".

       01   TITLE-LINE.
            05 FILLER                     PIC X(20) VALUE SPACE.
            05 FILLER                     PIC X(24)
                       VALUE "VENDOR ALPHABETICAL LIST".
            05 FILLER                     PIC X(11) VALUE SPACE.
            05 FILLER                     PIC X(5) VALUE "PAGE:".
            05 FILLER                     PIC X(1) VALUE SPACE.
            05 PRINT-PAGE-NUMBER          PIC ZZZZ9.
