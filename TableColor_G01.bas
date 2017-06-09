Attribute VB_Name = "TableColor_G01"
Sub TestColorTable()
  Dim message As String
  message = ColorTable
  MsgBox message
  
End Sub

Function ColorTable() As String

    Dim ct As ColorTable
    Dim ArrayRGBLongs() As Long
    Dim color As Long
    Dim r As Byte, g As Byte, b As Byte
    Dim message As String

    message = ""
    
    'Get a copy of the colortable that is currently attached to the active design file
    Set ct = Application.ActiveDesignFile.ExtractColorTable
    
    Dim cIndex As Long
    
    'Get an array of all of the RGB color values
    ArrayRGBLongs = ct.GetColors
    
    '35 is the highest color number assigned to a level
    For cIndex = 0 To 35
    
      ExtractRGB ArrayRGBLongs(cIndex), r, g, b

      message = CheckColor(cIndex, r, g, b)
      
      If message <> "" Then
        ColorTable = message & "One or More Colors Off!"
        'get out of for loop early, Fix manually, by attaching the new Color Table
        Exit Function
      End If
    Next
    ColorTable = message
    If message <> "" Then
      MsgBox message
    End If
    
End Function

Public Sub ExtractRGB(ByVal longColor As Long, intRed As Byte, intGreen As Byte, intBlue As Byte)
    Dim lngColor As Long
    
    lngColor = longColor
    intRed = lngColor Mod &H100
    lngColor = lngColor \ &H100
    intGreen = lngColor Mod &H100
    lngColor = lngColor \ &H100
    intBlue = lngColor Mod &H100
End Sub

Function CheckColor(chkIndex As Long, r As Byte, g As Byte, b As Byte) As String
 Dim message As String
 Dim CheckIndex As Integer
 
 CheckIndex = CInt(chkIndex)
 
  message = ""
  
      Select Case CheckIndex
      
' 0 is:  (r = 255, g = 255, b = 255)
        Case 0
            If r <> 255 Then
               message = "Red for Color 0 should be 255 not:" & r & vbCr
            End If
            If g <> 255 Then
               message = message & "Green for color 0 not 255:" & g & vbCr
            End If
            If b <> 255 Then
               message = message & "Blue for color 0 should be 255 not: " & b & vbCr
            End If
               CheckColor = message
            Exit Function
            
' 1 is:  (r = 0, g = 0, b = 255)
        Case 1
                If r <> 0 Then
               message = "Red for color 1 should be 0 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 1 should be 0 not: " & g & vbCr
               End If
              If b <> 255 Then
               message = message & "Blue for color 1 should be 255 not: " & b & vbCr
            End If
                   CheckColor = message
            Exit Function
        
' 2 is: (r = 0, g = 255, b = 0)
        Case 2
                If r <> 0 Then
               message = "Red for color 2 should be 0 not: " & r & vbCr
               End If
              If g <> 255 Then
               message = message & "Green for color 2 should be 255 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 2 should be 0 not: " & b & vbCr
            End If
                  CheckColor = message
            Exit Function
   
' 3 is:  (r = 255, g = 0, b = 0)
        Case 3
                If r <> 255 Then
               message = "Red for color 3 should be 255 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 3 should be 0 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 3 should be 0 not: " & b & vbCr
            End If
                 CheckColor = message
            Exit Function

' 4 is:  (r = 255, g = 255, b = 0)
        Case 4
                If r <> 255 Then
               message = "Red for color 4 should be 255 not: " & r & vbCr
               End If
              If g <> 255 Then
               message = message & "Green for color 4 should be 255 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 4 should be 0 not: " & b & vbCr
            End If
                  CheckColor = message
            Exit Function
    
' 5 is:  (r = 255, g = 0, b = 255)
        Case 5
                If r <> 255 Then
               message = "Red for color 5 should be 255 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 5 should be 0 not: " & g & vbCr
               End If
              If b <> 255 Then
               message = message & "Blue for color 5 should be 255 not: " & b & vbCr
            End If
                CheckColor = message
            Exit Function
                           
' 6 is: (r = 255, g = 127, b = 0)
        Case 6
                If r <> 255 Then
               message = "Red for color 6 should be 255 not: " & r & vbCr
               End If
              If g <> 127 Then
               message = message & "Green for color 6 should be 127 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 6 should be 0 not: " & b & vbCr
            End If
               CheckColor = message
            Exit Function
            
' 7 is:  (r = 0, g = 255, b = 255)
        Case 7
                If r <> 0 Then
               message = "Red for color 7 should be 0 not: " & r & vbCr
               End If
              If g <> 255 Then
               message = message & "Green for color 7 should be 255 not: " & g & vbCr
               End If
              If b <> 255 Then
               message = message & "Blue for color 7 should be 255 not: " & b & vbCr
            End If
               CheckColor = message
            Exit Function
    
' 8 is:  (r = 64, g = 64, b = 64)
        Case 8
                If r <> 64 Then
               message = "Red for color 8 should be 64 not: " & r & vbCr
               End If
              If g <> 64 Then
               message = message & "Green for color 8 should be 64 not: " & g & vbCr
               End If
              If b <> 64 Then
               message = message & "Blue for color 8 should be 64 not: " & b & vbCr
            End If
               CheckColor = message
            Exit Function
           
' 9 is:  (r = 192, g = 192, b = 192)
        Case 9
                If r <> 192 Then
               message = "Red for color 9 should be 192 not: " & r & vbCr
               End If
              If g <> 192 Then
               message = message & "Green for color 9 should be 192 not: " & g & vbCr
               End If
              If b <> 192 Then
               message = message & "Blue for color 9 should be 192 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function

' 10 is:  (r = 254, g = 0, b = 96)

        Case 10
                If r <> 254 Then
               message = "Red for color 10 should be 254 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 10 should be 0 not: " & g & vbCr
               End If
              If b <> 96 Then
               message = message & "Blue for color 10 should be 96 not: " & b & vbCr
            End If
             CheckColor = message
            Exit Function
' 11 is:  (r = 160, g = 224, b = 0)
        Case 11
                If r <> 160 Then
               message = "Red for color 11 should be 160 not: " & r & vbCr
               End If
              If g <> 224 Then
               message = message & "Green for color 11 should be 224 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 11 should be 0 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function
          
' 12 is:  (r = 0, g = 254, b = 160)
        Case 12
                If r <> 0 Then
               message = "Red for color 12 should be 0 not: " & r & vbCr
               End If
              If g <> 254 Then
               message = message & "Green for color 12 should be 254 not: " & g & vbCr
               End If
              If b <> 160 Then
               message = message & "Blue for color 12 should be 160 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function
         
' 13 is:  (r = 128, g = 0, b = 160)
        Case 13
                If r <> 128 Then
               message = "Red for color 13 should be 128 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 13 should be 0 not: " & g & vbCr
               End If
              If b <> 160 Then
               message = message & "Blue for color 13 should be 160 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function
       
' 14 is:  (r = 176, g = 176, b = 176)
        Case 14
                If r <> 176 Then
               message = "Red for color 14 should be 176 not: " & r & vbCr
               End If
              If g <> 176 Then
               message = message & "Green for color 14 should be 176 not: " & g & vbCr
               End If
              If b <> 176 Then
               message = message & "Blue for color 14 should be 176 not: " & b & vbCr
            End If
                 CheckColor = message
            Exit Function

' 15 is:  (r = 0, g = 240, b = 240)
        Case 15
                If r <> 0 Then
               message = "Red for color 15 should be 0 not: " & r & vbCr
               End If
              If g <> 240 Then
               message = message & "Green for color 15 should be 240 not: " & g & vbCr
               End If
              If b <> 240 Then
               message = message & "Blue for color 15 should be 240 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function
        
' 16 is:  (r = 240, g = 240, b = 240)
        Case 16
              If r <> 240 Then
               message = "Red for color 16 should be 240 not: " & r & vbCr
               End If
              If g <> 240 Then
               message = message & "Green for color 16 should be 240 not: " & g & vbCr
               End If
              If b <> 240 Then
               message = message & "Blue for color 16 should be 240 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function
         
' 17 is:  (r = 0, g = 0, b = 240)
        Case 17
                If r <> 0 Then
               message = "Red for color 17 should be 0 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 17 should be 0 not: " & g & vbCr
               End If
              If b <> 240 Then
               message = message & "Blue for color 17 should be 240 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function
       
   
' 18 is:  (r = 0, g = 240, b = 0)
        Case 18
                If r <> 0 Then
               message = "Red for color 18 should be 0 not: " & r & vbCr
               End If
              If g <> 240 Then
               message = message & "Green for color 18 should be 240 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 18 should be 0 not: " & b & vbCr
            End If
             CheckColor = message
            Exit Function
            
   
' 19 is:  (r = 240, g = 0, b = 0)
        Case 19
                If r <> 240 Then
               message = "Red for color 19 should be 240 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 19 should be 0 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 19 should be 0 not: " & b & vbCr
            End If
              CheckColor = message
            Exit Function
  
' 20 is:  (r = 240, g = 240, b = 0)

        Case 20
                If r <> 240 Then
               message = "Red for color 20 should be 240 not: " & r & vbCr
               End If
              If g <> 240 Then
               message = message & "Green for color 20 should be 240 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 20 should be 0 not: " & b & vbCr
            End If
             CheckColor = message
            Exit Function
            
' 21 is:  (r = 240, g = 0, b = 240)
        Case 21
                If r <> 240 Then
               message = "Red for color 21 should be 240 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 21 should be 0 not: " & g & vbCr
               End If
              If b <> 240 Then
               message = message & "Blue for color 21 should be 240 not: " & b & vbCr
            End If
             CheckColor = message
            Exit Function
      
' 22 is:  (r = 240, g = 122, b = 0)
        Case 22
                If r <> 240 Then
               message = "Red for color 22 should be 240 not: " & r & vbCr
               End If
              If g <> 122 Then
               message = message & "Green for color 22 should be 122 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 22 should be 0 not: " & b & vbCr
            End If
             CheckColor = message
            Exit Function
            
' 35 is: r = 225, g = 0, b = 0)
        Case 35
                If r <> 225 Then
               message = "Red for color 35 should be 225 not: " & r & vbCr
               End If
              If g <> 0 Then
               message = message & "Green for color 35 should be 0 not: " & g & vbCr
               End If
              If b <> 0 Then
               message = message & "Blue for color 35 should be 0 not: " & b & vbCr
            End If
             CheckColor = message
            Exit Function
            
        Case Else
              CheckColor = ""
        End Select
        
End Function

