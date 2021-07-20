Public num_memberCnt As Integer
Public num_infoSheetCnt As Integer
Public num_curSheetIdx As Integer
Public str_sheetName As String
Function getContent(cell As Range)
    Dim resultVal
    resultVal = ""
   
    'addr 변수에 문자열을 저장한다. $가 포함되어 있다면 제거한다.
    'ex) cell.Address = "$A$1:$D$10" 이라면 addr = "A1:D10" 이 된다.
    'ex) cell.Address = "$A$1" 이라면 addr = "A1" 이 된다.
    Dim addr
    addr = cell.Address & ""
    addr = Replace(addr, "$", "")
   
    Dim colonIdx
    colonIdx = InStr(addr, ":")
    If colonIdx > 0 Then
        '콜론이 존재하는 경우(다중범위)
        Dim leftAddr, leftColNum, leftRowNum
        leftAddr = Mid(addr, 1, colonIdx - 1)
        leftColNum = Range(leftAddr).Column
        leftRowNum = Range(leftAddr).Row
        
        Dim rightAddr, rightColNum, rightRowNum
        rightAddr = Mid(addr, colonIdx + 1, Len(addr) - colonIdx)
        rightColNum = Range(rightAddr).Column
        rightRowNum = Range(rightAddr).Row
        
        For r = leftRowNum To rightRowNum
            For c = leftColNum To rightColNum
                resultVal = resultVal & "," & Cells(r, c).Value
                'MsgBox ("(" & r & "," & c & ") : " & Cells(r, c).Value)
            Next c
        Next r
        
        getContent = Mid(resultVal, 2)
    Else
        '콜론이 존재하지 않는 경우(단일범위)
        resultVal = Range(cell, cell).Value
        getContent = resultVal
    End If

End Function
Option Explicit
Function GetEng(MyData As String) As String
 
    With CreateObject("Vbscript.RegExp")    '정규식 생성
    
        .IgnoreCase = True  '대소문자 구분X
        .Pattern = "[a-z]+" '영문자만 체크
        
        If .test(MyData) Then   '영문자가 있으면 영문자만 출력
            GetEng = .Execute(MyData)(0)
            
        Else    '영문자가 없으면 - 출력
            GetEng = "-"
        End If
    
    End With
    
End Function
Sub Auto_Open()
    Application.OnKey "^+a", "main"
End Sub
Sub main()





    If ActiveSheet.Index > num_infoSheetCnt Then
        Call sub_setSheet
        Call sub_setHeader
        Call sub_initTimeTable
    End If
    
    
    
    
End Sub
Sub sub_setSheet()
'
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date : 2021.07.17
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date :
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    
    'init
    Dim num_curSheetIdx As Integer
    Dim str_colColorAlpha As String
    

    
    num_memberCnt = Range("멤버이름").Count
    num_infoSheetCnt = Worksheets.Count - num_memberCnt

    
    num_curSheetIdx = ActiveSheet.Index
    str_sheetName = Range("멤버이름").Rows(num_curSheetIdx - num_infoSheetCnt)
    Debug.Print "worksheets : " & Worksheets.Count
    Debug.Print "num_memberCnt : " & num_memberCnt
    Debug.Print "num_infoSheetCnt : " & num_infoSheetCnt
    Debug.Print "num_curSheetIdx : " & num_curSheetIdx
    Debug.Print "멤버이름 : " & str_sheetName
    ActiveSheet.Name = str_sheetName
    
    
    Worksheets("B_MEMBER").Select
    For i = 1 To Worksheets("B_MEMBER").Rows(1).CurrentRegion.Columns.Count
        If Cells(1, i).Value = "색상" Then
            str_colColorAlpha = GetEng(Cells(1, i).Address)
        End If
    Next
    

    For i = 1 To Range("멤버이름").Count
        If Range("멤버이름").Cells(i) = str_sheetName Then
            num_targetrow = Range("멤버이름").Cells(i).Row()
            If Range(str_colColorAlpha & num_targetrow).Value = "빨강" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 255 '빨강
                    .TintAndShade = 0
                End With
                
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "주황" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 49407 '주황
                    .TintAndShade = 0
                End With
                
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "노랑" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 65535 '노랑
                    .TintAndShade = 0
                End With
            
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "연두" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 5296274 '연두
                    .TintAndShade = 0
                End With
            
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "초록" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 5287936 '초록
                    .TintAndShade = 0
                End With
            
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "하늘" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 15773696 '하늘
                    .TintAndShade = 0
                End With
            
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "파랑" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 12611584 '파랑
                    .TintAndShade = 0
                End With
            
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "진청" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 6299648 '진청
                    .TintAndShade = 0
                End With
                
            ElseIf Range(str_colColorAlpha & num_targetrow).Value = "보라" Then
            
                With Sheets(str_sheetName).Tab
                    .Color = 10498160 '보라
                    .TintAndShade = 0
                End With
            
            End If
            
            
        End If
    Next

    Worksheets(str_sheetName).Select
    
    
End Sub
Sub sub_setHeader()
'
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date : 2021.07.17
' Description :
' 01. 멤버 시트의 헤더 만들기
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date :
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    
    'Header 영역 초기화
    Rows("1:3").Select
    Selection.Clear
    
    
    'Header 영역 색상 채우기
    Selection.Interior.Color = 13434879
    
    
    'Header 영역 테두리 채우기
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .Weight = xlMedium
    End With


    'Header 영역 Info 정의
    Range("A1:A3").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    ActiveCell.FormulaR1C1 = "이름 : "
    Range("B1:B3").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    ActiveCell.FormulaR1C1 = str_sheetName

    
End Sub
Sub sub_initTimeTable()
'
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date : 2021.07.17
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date :
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    
    'Debug.Print Rows.Count
    'Worksheets.Add after:=Sheets(Worksheets.Count)
    
    Call sub_initTimeTableHeader
    Call sub_initTimeTableBody
    
End Sub
Sub sub_initTimeTableHeader()
'
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date : 2021.07.17
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date :
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    
    Dim num_row As Integer
    Dim num_colIdxDay As Integer
    Dim num_colIdxDate As Integer
    Dim num_cntDate As Integer
    
    
    
    
    Range("A4:D4").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    With Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorAccent5
        .TintAndShade = 0.799981688894314
        .PatternTintAndShade = 0
    End With
    ActiveCell.FormulaR1C1 = "주간목표"
    Range("E4:G4").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    With Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorAccent5
        .TintAndShade = 0.799981688894314
        .PatternTintAndShade = 0
    End With
    ActiveCell.FormulaR1C1 = "진행률"

    Range("A4:D4").Select
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    Selection.Borders(xlEdgeRight).LineStyle = xlNone
    Selection.Borders(xlInsideVertical).LineStyle = xlNone
    Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    Selection.Borders(xlEdgeRight).LineStyle = xlNone
    Selection.Borders(xlInsideVertical).LineStyle = xlNone
    Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    Selection.Borders(xlInsideVertical).LineStyle = xlNone
    Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
    Range("E4:G4").Select
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    Selection.Borders(xlInsideVertical).LineStyle = xlNone
    Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    Selection.Borders(xlInsideVertical).LineStyle = xlNone
    Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlMedium
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    Selection.Borders(xlInsideVertical).LineStyle = xlNone
    Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
    Selection.Font.Bold = True
    
    
    
    
    num_row = 4
    num_colIdxDay = 8
    num_colIdxDate = 9
    num_cntDate = Worksheets("B_CALENDAR").Cells(2, 2).Value
    
    Range("H4:ABX4").Clear
    Range("H4:ABX4").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    
    For i = 1 To num_cntDate
        
        Cells(num_row, num_colIdxDay + (i * 2 - 2)).FormulaR1C1 = Range("달력").Cells(i, 2).Value
        Cells(num_row, num_colIdxDate + (i * 2 - 2)).FormulaR1C1 = Range("달력").Cells(i, 1).Value
    Next
    

    
    
    
    
    
    Range("H4").Select
    Range(Selection, Selection.End(xlToRight)).Select
    With Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorAccent5
        .TintAndShade = 0.799981688894314
        .PatternTintAndShade = 0
    End With
    Selection.Font.Bold = True
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With

    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    
    
End Sub
Sub sub_initTimeTableBody()
'
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date : 2021.07.17
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' Modify Date :
' Description :
' 01.
' -----------------------------------------------------------------------------------------------------------------------------
' ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
    
    Range("H4").Select
    Selection.End(xlToRight).Select
    Range("ABI5").Select
    Range(Selection, Selection.End(xlToLeft)).Select
    Range("A5:ABI10").Select
    Range("ABI5").Activate
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With


    Range("A5:D5").Select
    Range( _
        "A5:D5,A6:D6,A7:D7,A8:D8,A9:D9,A10:D10,F5:G5,F6:G6,F7:G7,F8:G8,F9:G9,F10:G10"). _
        Select
    Range("F10").Activate
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    
    Columns("E:E").Select
    Selection.ColumnWidth = 5.63
    Selection.Style = "Percent"
    
    Columns.AutoFit
    
    
    Range("H5").Select
    ActiveWindow.FreezePanes = True
    
End Sub
