; Map Ctrl+L to remove text enclosed within angle brackets
^l::
    ; Save the current clipboard contents
    ClipboardOld := ClipboardAll

    ; Get the selected text
    ClipSaved := ClipboardAll
    SendInput, ^c
    ClipWait, 1
    SelectedText := Clipboard
    Clipboard := ClipSaved

    ; Create a regular expression pattern for removing text enclosed within angle brackets "<>"
    RegExPattern := "<[^<>]*>"

    ; Create an empty variable for storing the cleaned text
    CleanText := ""

    ; Loop through each line of the selected text and remove text enclosed within angle brackets
    Loop, Parse, SelectedText, `n, `r
    {
        CleanLine := RegExReplace(A_LoopField, RegExPattern, "")
        CleanText .= CleanLine "`n" ; Append the cleaned line to the variable with a line break
    }

    ; Replace the selected text with the cleaned text
    Clipboard := CleanText
    SendInput, ^v

    
return
