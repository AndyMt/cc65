;
; 2020-01-08, Greg King
;
; unsigned char kbhit (void);
; /* Returns non-zero (true) if a typed character is waiting. */
;

        .export         _kbhit

        .include        "cx16.inc"


.proc   _kbhit
        ldy     BANK_RAM_SEL    ; (KEY_COUNT is in RAM bank 0)
        stz     BANK_RAM_SEL
        lda     KEY_COUNT       ; Get number of characters
        sty     BANK_RAM_SEL
        tax                     ; High byte of return (only its zero/nonzero ...
        rts                     ; ... state matters)
.endproc
