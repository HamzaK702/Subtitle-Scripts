


; Map Ctrl+L to select all text, remove line breaks, and replace the text
^l::
    ; Select all text in active text box
    SendInput, ^a
    Sleep, 100

    ; Get the selected text
    ClipSaved := ClipboardAll
    SendInput, ^c
    ClipWait, 1
    SelectedText := Clipboard
    Clipboard := ClipSaved

    ; Remove line breaks from selected text
    CleanText := RegExReplace(SelectedText, "\r\n|\r|\n|\t", " ")

    ; Replace the selected text with the cleaned text
    SendInput, %CleanText%
	SendInput, {Tab}
return
