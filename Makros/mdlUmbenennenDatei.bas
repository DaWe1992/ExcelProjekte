Attribute VB_Name = "Modul1"
Option Explicit

Public Sub DateienUmbenennen()
Dim strPfad As String
Dim strDatei As String
Dim i As Integer
i = 1

    Do Until Cells(i, 1) = ""
        strPfad = Cells(i, 1).Value
        strDatei = Dir(strPfad, vbNormal)

        Do Until strDatei = ""
            'Datei umbenennen
            Name (strPfad & strDatei) As (strPfad & Konvertieren(strDatei))
            'n�chste Datei in strDatei speichern
            strDatei = Dir()
        Loop
        i = i + 1
    Loop
End Sub

Private Function Konvertieren(strDatei As String) As String
Dim strDateiNeu As String

    strDateiNeu = Replace(strDatei, " ", "_")
    strDateiNeu = Replace(strDateiNeu, ".", "_")
    strDateiNeu = Replace(strDateiNeu, "�", "oe")
    strDateiNeu = Replace(strDateiNeu, "�", "Oe")
    strDateiNeu = Replace(strDateiNeu, "�", "ae")
    strDateiNeu = Replace(strDateiNeu, "�", "Ae")
    strDateiNeu = Replace(strDateiNeu, "�", "ue")
    strDateiNeu = Replace(strDateiNeu, "�", "Ue")
    strDateiNeu = Replace(strDateiNeu, ",", "")
    strDateiNeu = Replace(strDateiNeu, ";", "")

    Konvertieren = Left(strDateiNeu, InStrRev(strDateiNeu, "_") - 1) & "." & Right(strDateiNeu, Len(strDateiNeu) - InStrRev(strDateiNeu, "_"))
    
End Function
