Attribute VB_Name = "Module2"
Const name As String = "YMSG"
Const Ver As Integer = 11
Public Sessionkey As String, ID As String, pass As String, Buffer As String, Crypt(1) As String, ChallengeString As String
Private Declare Function YMSG12_ScriptedMind_Encrypt Lib "YMSG12ENCRYPT.dll" (ByVal username As String, ByVal Password As String, ByVal Seed As String, ByVal result_6 As String, ByVal result_96 As String, intt As Long) As Boolean
Public Function GetStrings(YahooID As String, YahooPass As String, Seed As String, Str1 As String, Str2 As String, Mode As Long) As Boolean
Dim A(1) As String, B As Long
On Error GoTo err
A(0) = String(100, vbNullChar)
A(1) = String(100, vbNullChar)
GetStrings = YMSG12_ScriptedMind_Encrypt(YahooID, YahooPass, Seed, A(0), A(1), Mode)
B = InStr(1, A(0), vbNullChar)
Str1 = Left$(A(0), B - 1)
B = InStr(1, A(1), vbNullChar)
Str2 = Left$(A(1), B - 1)
Exit Function
err:
GetStrings = False
End Function
Public Function Header(ByVal PacketType As String, ByVal Pck As String) As String
Dim i As Integer
Dim X As Integer
X = 0
i = Len(Pck)
Do While i > 255
i = i - 256
X = X + 1
Loop
Header = name & Chr(0) & Chr(Ver) & String(2, 0) & Chr(X) & Chr(i) & Chr(0) & _
Chr("&H" & PacketType) & String(8, 0) & Pck
Debug.Print Header
End Function
Public Function Login(YahooID As String) As String
Dim Pck As String
Pck = "6À€" & Crypt(0) & "À€96À€" & Crypt(1) & "À€0À€" & YahooID & "À€2À€" & YahooID & "À€192À€-1À€2À€1À€1À€" & YahooID & "À€99À€betaÀ€135À€6,0,0,1555À€148À€300À€59À€B04um3lh08ql2q&b=2À€59À€À€"
Login = Header("54", Pck)
End Function
Public Function Data(YahooID As String) As String
Dim Pck As String
Pck = "1À€" & YahooID & "À€"
Data = Header("57", Pck)
End Function
Public Sub pause(interval)
Dim X
 X = Timer
  Do While Timer - X < Val(interval)
  DoEvents
 Loop
End Sub

