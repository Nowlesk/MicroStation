VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmButtons 
   Caption         =   "Buttons"
   ClientHeight    =   1380
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   9735
   OleObjectBlob   =   "frmButtons.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "frmButtons"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub cmbCloudEl_Click()
 ' MsgBox "hello world"
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "ACTIVE LEVEL ""Backcircle"""

    CadInputQueue.SendCommand "ACTIVE WEIGHT 3"
'   Set a variable associated with a dialog box
    SetCExpressionValue "tcb->symbology.color", 1, "MGDSHOOK"

    
'   Start a command
    CadInputQueue.SendCommand "PLACE REVCLOUD ELEMENT"
            
'    SetCExpressionValue "cloudParams.radius", (ActiveModelReference.UORsPerMasterUnit * 0.1), "COMPCURV"

End Sub

Private Sub cmbCloudPt_Click()
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "ACTIVE LEVEL ""Backcircle"""

    CadInputQueue.SendCommand "ACTIVE WEIGHT 3"
   
'   Set a variable associated with a dialog box
    SetCExpressionValue "tcb->symbology.color", 1, "MGDSHOOK"

'    SetCExpressionValue "cloudParams.radius", (ActiveModelReference.UORsPerMasterUnit * 0.1), "COMPCURV"
    

'   Start a command
    CadInputQueue.SendCommand "PLACE REVCLOUD POINTS"

End Sub

Private Sub cmbComprLevels_Click()
Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "MDL KEYIN COMPRESSOPTIONS DIALOG COMPRESSOPTIONS"

    CadInputQueue.SendCommand "COMPRESS OPTIONS COMPRESS"

'   Remove the following line to let the user close the dialog box.
    DialogResult = msdDialogBoxResultOK

    'End If  ' Compress Options

    CadInputQueue.SendCommand "ACTIVE LEVEL ""Level 1"""

    CadInputQueue.SendCommand "MDL KEYIN lvlmangr levelmanager dialog open"

'   The following statement opens modal dialog "Level/Filter Import"

    Dim modalHandler As New Macro1ModalHandler2
    AddModalDialogEventsHandler modalHandler

'   The following statement opens modal dialog "Import Levels"

    CadInputQueue.SendCommand "LEVELMANAGER LIBRARY IMPORT"

    RemoveModalDialogEventsHandler modalHandler
    CommandState.StartDefaultCommand
End Sub

Private Sub cmbDataFieldsOffView5_Click()
  Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Coordinates are in master units
    startPoint.x = -2.38719521710856
    startPoint.Y = 5.40902255639098
    startPoint.Z = 0#

'   Send a data point to the current command
    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 5

'   Send a keyin that can be a command string
    CadInputQueue.SendKeyin "dialog viewsettings popup"

    CadInputQueue.SendKeyin "MDL KEYIN BENTLEY.VIEWATTRIBUTESDIALOG,VAD VIEWATTRIBUTESDIALOG SETATTRIBUTE 4 DataFields False"

    CommandState.StartDefaultCommand

End Sub

Private Sub cmbExistingLevel_Click()
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "ACTIVE LEVEL ""Existing"""

'   Set a variable associated with a dialog box
    SetCExpressionValue "tcb->symbology.color", 0, "MGDSHOOK"

    CadInputQueue.SendCommand "ACTIVE STYLE 0"

    CadInputQueue.SendCommand "ACTIVE WEIGHT 1"

    CommandState.StartDefaultCommand
End Sub

Private Sub cmbDFence_Click()
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "INPUTMANAGER MENU -705,2"

    CadInputQueue.SendCommand "PLACE FENCE ICON"

'   Send a tentative point
'   Coordinates are in master units
    CadInputQueue.SendTentativePoint Point3dFromXYZ(0.023591, 21.978293, 0#), 1

'   Coordinates are in master units
    startPoint.x = 0#
    startPoint.Y = 22#
    startPoint.Z = 0#

'   Send a data point to the current command
    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

'   Set a variable associated with a dialog box
    SetCExpressionValue "tcb->msToolSettings.fence.placeMode", 0, ""

    CadInputQueue.SendCommand "PLACE FENCE ICON"

    CadInputQueue.SendTentativePoint Point3dFromXYZ(0.005714, 21.91996, 0#), 1

    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendTentativePoint Point3dFromXYZ(33.960146, 0.004824, 0#), 1

    point.x = startPoint.x + 34#
    point.Y = startPoint.Y - 22#
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendCommand "WINDOW AREA EXTENDED 1"

    point.x = startPoint.x + 32.745686
    point.Y = startPoint.Y - 12.483273
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 32.803723
    point.Y = startPoint.Y - 22.152551
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendCommand "FIT VIEW EXTENDED 5"
    
    CadInputQueue.SendCommand "DIALOG PLOT"
    
    '   Set a variable associated with a dialog box
    SetCExpressionValue "plotUI.uiPlotArea", 2, "PLOTDLG"
           
    '   Set a variable associated with a dialog box TO MONOCHROME
    SetCExpressionValue "plotUI.uiColorMode", 0, "PLOTDLG"
    
    ' Set raster quality to 100%
    
        
    
    'Done with raster quality set to 100%
    
    'MACRO 6 TURNS LINE WEIGHTS OFF
    'MsgBox ("MACRO 6 NEXT")
    Macro8
        
    'CadInputQueue.SendCommand "PRINT MAXIMIZE"
    
    CadInputQueue.SendKeyin "LOCK SNAP KEYpoint"

    CadInputQueue.SendCommand "LOCK SNAP ON"

    CadInputQueue.SendCommand "LOCK UNIT ON"
    
    CadInputQueue.SendCommand "LOCK AXIS OFF"
    
    CadInputQueue.SendCommand "CHOOSE ELEMENT"

    CommandState.StartDefaultCommand

End Sub

Private Sub cmdBlueRev1_Click()

    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Coordinates are in master units
    startPoint.x = 32.5918877528005
    startPoint.Y = 12.4385990697246
    startPoint.Z = 0#

'   Send a data point to the current command
    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

'   Send a message string to an application
'   Content is defined by the application
    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 17"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 17"

    point.x = startPoint.x - 1.30742656678038E-02
    point.Y = startPoint.Y - 2.26741425634707E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 9.58779482305516E-03
    point.Y = startPoint.Y + 2.52903897823344E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x - 8.71617711190709E-04
    point.Y = startPoint.Y + 8.7208240628911E-04
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 6.97294168949014E-03
    point.Y = startPoint.Y - 4.36041203143667E-03
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 2.09188250684775E-02
    point.Y = startPoint.Y - 6.10457684400956E-03
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 1.74323542237289E-02
    point.Y = startPoint.Y - 2.18020601571833E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x - 2.26620604908589E-02
    point.Y = startPoint.Y - 2.61624721886182E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x - 4.61957386929015E-02
    point.Y = startPoint.Y - 2.18020601571833E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x - 2.70201490467983E-02
    point.Y = startPoint.Y + 4.36041203143684E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x - 1.22026479566202E-02
    point.Y = startPoint.Y + 5.75574388149658E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x - 4.35808855593933E-03
    point.Y = startPoint.Y + 7.93594989721509E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 1.74323542237431E-03
    point.Y = startPoint.Y + 4.36041203143667E-03
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 2.26620604908518E-02
    point.Y = startPoint.Y - 2.00578953446087E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 16"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 16"

    point.x = startPoint.x + 5.66551512271403E-02
    point.Y = startPoint.Y + 8.63361582224496E-02
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 6.12311442108719E-02
    point.Y = startPoint.Y + 0.22020080758756
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 27"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 27"

    point.x = startPoint.x - 9.72058033375589E-03
    point.Y = startPoint.Y + 1.05078094842259
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 83"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 83"

    point.x = startPoint.x + 0.118407223210703
    point.Y = startPoint.Y + 1.18966007162385
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 0.026733830289345
    point.Y = startPoint.Y + 7.14537627062998
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    point.x = startPoint.x + 4.14151411121395E-02
    point.Y = startPoint.Y + 7.54758340166723
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    point.x = startPoint.x + 6.88710990145225E-02
    point.Y = startPoint.Y + 7.50942979639216
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 2.72785913588223E-02
    point.Y = startPoint.Y + 7.94079718288965
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    point.x = startPoint.x + 8.74202134307112E-02
    point.Y = startPoint.Y + 8.00097086892347
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 4.08431419891642E-02
    point.Y = startPoint.Y + 8.33546897688507
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    point.x = startPoint.x + 0.110572558884108
    point.Y = startPoint.Y + 8.31715524635304
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 5.35360749083154E-02
    point.Y = startPoint.Y + 8.74431210998267
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 setColor 7"

    CadInputQueue.SendMessageToApplication "WORDPROC", "1 selection 13 18"

    point.x = startPoint.x + 7.00968114208607E-02
    point.Y = startPoint.Y + 8.69983590726201
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CommandState.StartDefaultCommand



End Sub

Private Sub cmdEsizeFence_Click()
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "PLACE FENCE ICON"

'   Send a tentative point
'   Coordinates are in master units
    CadInputQueue.SendTentativePoint Point3dFromXYZ(0.493826490298015, 30.0246028833885, 0#), 1

'   Coordinates are in master units
    startPoint.x = 0#
    startPoint.Y = 30#
    startPoint.Z = 0#

'   Send a data point to the current command
    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    CadInputQueue.SendTentativePoint Point3dFromXYZ(41.97131768619, 1.17293206833481E-02, 0#), 1

    point.x = startPoint.x + 42.0000000000001
    point.Y = startPoint.Y - 30#
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    point.x = startPoint.x + 1.79290742839691
    point.Y = startPoint.Y + 3.46071529917275
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 5

    CadInputQueue.SendCommand "PRINT MAXIMIZE"

    CadInputQueue.SendCommand "WINDOW AREA EXTENDED 1"

    point.x = startPoint.x + 40.9646372074583
    point.Y = startPoint.Y - 30.3439460111004
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 40.801902248909
    point.Y = startPoint.Y - 20.3922465283965
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CommandState.StartDefaultCommand
End Sub

Private Sub cmdFence18000_Click()
  Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "PLACE FENCE ICON"

'   Send a tentative point
'   Coordinates are in master units
    CadInputQueue.SendTentativePoint Point3dFromXYZ(0.098639241090924, 14.4992497162524, 1.4111111111138), 1

'   Coordinates are in master units
    startPoint.x = 0#
    startPoint.Y = 14.6666666666666
    startPoint.Z = 0#

'   Send a data point to the current command
    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    CadInputQueue.SendTentativePoint Point3dFromXYZ(22.6630469909838, -4.14684863753751E-03, 1.41111111111402), 1

    point.x = startPoint.x + 22.6666666666667
    point.Y = startPoint.Y - 14.6666666666666
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    point.x = startPoint.x + 23.1448617967697
    point.Y = startPoint.Y - 6.5622857142857
    point.Z = startPoint.Z + 1.4111111111123
    CadInputQueue.SendDataPoint point, 5

    CadInputQueue.SendCommand "FIT VIEW EXTENDED 5"

    CadInputQueue.SendCommand "WINDOW AREA EXTENDED 1"

    point.x = startPoint.x + 21.7245776434224
    point.Y = startPoint.Y - 8.34410349586891
    point.Z = startPoint.Z + 1.41111111111421
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 21.6370483654411
    point.Y = startPoint.Y - 14.7128887948723
    point.Z = startPoint.Z + 1.41111111111426
    CadInputQueue.SendDataPoint point, 1

    CommandState.StartDefaultCommand

End Sub

Private Sub cmdFence6000_Click()
  
    CommandState.StartDefaultCommand
 
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "PLACE FENCE ICON"

'   Send a tentative point
'   Coordinates are in master units
    CadInputQueue.SendTentativePoint Point3dFromXYZ(0.365598749417673, 43.5815800805484, 4.23333333333436), 1

    CadInputQueue.SendTentativePoint Point3dFromXYZ(0.102272749327261, 44.0333269768638, 4.23333333333436), 1

'   Coordinates are in master units
    startPoint.x = 0#
    startPoint.Y = 43.9999999999999
    startPoint.Z = 0#

'   Send a data point to the current command
    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    CadInputQueue.SendTentativePoint Point3dFromXYZ(67.9812786286272, 3.29940720802703E-02, 4.23333333333444), 1

    point.x = startPoint.x + 68#
    point.Y = startPoint.Y - 43.9999999999999
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    point.x = startPoint.x + 8.83333333333333
    point.Y = startPoint.Y + 56.1666666666667
    point.Z = startPoint.Z + 4.23333333333333
    CadInputQueue.SendDataPoint point, 5

    CadInputQueue.SendCommand "FIT VIEW EXTENDED 5"

    CadInputQueue.SendCommand "WINDOW AREA EXTENDED 1"

    point.x = startPoint.x + 65.6749694500775
    point.Y = startPoint.Y - 24.7501961741185
    point.Z = startPoint.Z + 4.23333333333444
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 65.7208898602495
    point.Y = startPoint.Y - 44.117079717327
    point.Z = startPoint.Z + 4.23333333333444
    CadInputQueue.SendDataPoint point, 1

    CommandState.StartDefaultCommand

End Sub



Private Sub cmdFenceDonE_Click()
   Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "PLACE FENCE ICON"

'   Send a tentative point
'   Coordinates are in master units
    CadInputQueue.SendTentativePoint Point3dFromXYZ(-7.68330441137402, 29.5718401832303, 0#), 1

'   Coordinates are in master units
    startPoint.x = -8.00000000000005
    startPoint.Y = 30#
    startPoint.Z = 0#

'   Send a data point to the current command
    point.x = startPoint.x
    point.Y = startPoint.Y
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    CadInputQueue.SendTentativePoint Point3dFromXYZ(33.9605377145485, 2.06433146363044E-02, 0#), 1

    point.x = startPoint.x + 42#
    point.Y = startPoint.Y - 30#
    point.Z = startPoint.Z
    CadInputQueue.SendAdjustedDataPoint point, 1

    point.x = startPoint.x - 4.59999999999996
    point.Y = startPoint.Y - 14.05
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 5

    CadInputQueue.SendCommand "FIT VIEW EXTENDED 5"

    CadInputQueue.SendCommand "WINDOW AREA EXTENDED 1"

    point.x = startPoint.x + 40.7100968867561
    point.Y = startPoint.Y - 20.425106943707
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    point.x = startPoint.x + 40.9609209462061
    point.Y = startPoint.Y - 30.0283192740974
    point.Z = startPoint.Z
    CadInputQueue.SendDataPoint point, 1

    CommandState.StartDefaultCommand

End Sub

Private Sub cmdNewOrRevLevel_Click()
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "ACTIVE LEVEL ""New or Revisions"""
    
    CadInputQueue.SendCommand "ACTIVE STYLE 0"

    CadInputQueue.SendCommand "ACTIVE WEIGHT 1"

'   Set a variable associated with a dialog box
    SetCExpressionValue "tcb->symbology.color", 7, "MGDSHOOK"
    
    CommandState.StartDefaultCommand
End Sub

Private Sub cmdSetRadius_Click()
 Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "PLACE REVCLOUD POINTS"

'   Set a variable associated with a dialog box
    SetCExpressionValue "cloudParams.flags.lockRadius", 1, "COMPCURV"

    SetCExpressionValue "cloudParams.radius", (ActiveModelReference.UORsPerMasterUnit * 0.1), "COMPCURV"

    CommandState.StartDefaultCommand
End Sub

Private Sub cmdTextDialog_Click()
    Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

    Dim modalHandler As New Macro1ModalHandler5
    AddModalDialogEventsHandler modalHandler

'   The following statement opens modal dialog "Preferences [descartes]"

'   Start a command
    CadInputQueue.SendCommand "MDL SILENTLOAD USERPREF"

    CadInputQueue.SendCommand "MDL SILENTUNLOAD SPELLCHECK"

    RemoveModalDialogEventsHandler modalHandler
    CommandState.StartDefaultCommand
End Sub

Private Sub cmdTitleBlock_Click()
  Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    
    CadInputQueue.SendCommand "ACTIVE LEVEL ""Border-titleblock"""

'   Set a variable associated with a dialog box
   ' SetCExpressionValue "tcb->symbology.color", -1, "MGDSHOOK"

    'CadInputQueue.SendCommand "ACTIVE WEIGHT 0"

    CommandState.StartDefaultCommand
End Sub




Private Sub cmdWordProcessor_Click()
  Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

    Dim modalHandler As New Macro2ModalHandler1
    AddModalDialogEventsHandler modalHandler

'   The following statement opens modal dialog "Preferences [descartes]"

'   Start a command
    CadInputQueue.SendCommand "MDL SILENTLOAD USERPREF"

    CadInputQueue.SendCommand "MDL SILENTUNLOAD SPELLCHECK"

    RemoveModalDialogEventsHandler modalHandler
    CommandState.StartDefaultCommand
End Sub


Private Sub CommandButton1_Click()
 Dim startPoint As Point3d
    Dim point As Point3d, point2 As Point3d
    Dim lngTemp As Long

'   Start a command
    CadInputQueue.SendCommand "ACTIVE LEVEL ""Notes and Reference"""

'   Set a variable associated with a dialog box
    SetCExpressionValue "tcb->symbology.color", 7, "MGDSHOOK"

    CommandState.StartDefaultCommand
End Sub



Private Sub UserForm_Click()

End Sub
