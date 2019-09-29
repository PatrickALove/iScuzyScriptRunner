
<#
    .NOTES
    ----------------------------------------------------------------------------------
     Code written by:  Patrick Love
     Written on:       9/29/2019 3:26 AM
     Created for:      GTCC IT
    ----------------------------------------------------------------------------------
    .DESCRIPTION
        This program is meant to provide a quick gui interface using powershell script
        as a replacement of the old windows batch scripts. This only replaces the high
        level scripts used in imaging and doesn't replace the sub-scripts called from
        the sub folders.
#>



#region Source: Startup.pss
#----------------------------------------------
#region Import Assemblies
#----------------------------------------------
#endregion Import Assemblies

#Define a Param block to use custom parameters in the project
#Param ($CustomParameter)

function Main {
<#
    .SYNOPSIS
        The Main function starts the project application.
    
    .PARAMETER Commandline
        $Commandline contains the complete argument string passed to the script packager executable.
    
    .NOTES
        Use this function to initialize your script and to call GUI forms.
		
    .NOTES
        To get the console output in the Packager (Forms Engine) use: 
		$ConsoleOutput (Type: System.Collections.ArrayList)
#>
	Param ([String]$Commandline)
		
	#--------------------------------------------------------------------------
	#TODO: Add initialization script here (Load modules and check requirements)
	
	
	#--------------------------------------------------------------------------
	
	if((Show-MainForm_psf) -eq 'OK')
	{
        
		
	}
	
	$script:ExitCode = 0 #Set the exit code for the Packager
}


#endregion Source: Startup.pss

#region Source: Globals.ps1
	#--------------------------------------------
	# Declare Global Variables and Functions here
	#--------------------------------------------
	
	
	#Sample function that provides the location of the script
	function Get-ScriptDirectory
	{
	<#
		.SYNOPSIS
			Get-ScriptDirectory returns the proper location of the script.
	
		.OUTPUTS
			System.String
		
		.NOTES
			Returns the correct path within a packaged executable.
	#>
		[OutputType([string])]
		param ()
		if ($null -ne $hostinvocation)
		{
			Split-Path $hostinvocation.MyCommand.path
		}
		else
		{
			Split-Path $script:MyInvocation.MyCommand.Path
		}
	}
	
	#Sample variable that provides the location of the script
	[string]$ScriptDirectory = Get-ScriptDirectory
	
	
	
#endregion Source: Globals.ps1

#region Source: MainForm.psf
function Show-MainForm_psf
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Design, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$form1 = New-Object 'System.Windows.Forms.Form'
    $progressbar = New-Object 'System.Windows.Forms.Progressbar'
	$radiobuttonFaculty = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonStudent = New-Object 'System.Windows.Forms.RadioButton'
    $grpboxDeviceType = New-Object 'System.Windows.Forms.GroupBox'
	$radiobuttonTablet = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonLaptop = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonDesktop = New-Object 'System.Windows.Forms.RadioButton'
    $grpboxDeviceType = New-Object 'System.Windows.Forms.GroupBox'
    $grpboxWhoDevice = New-Object 'System.Windows.Forms.GroupBox'
    $textboxOutput = New-Object 'System.Windows.Forms.TextBox'
    $buttonCancel = New-Object 'System.Windows.Forms.Button'
    $buttonRunScript = New-Object 'System.Windows.Forms.Button'
	$buttonNETFrameworkFix = New-Object 'System.Windows.Forms.Button'
	$buttonScript3 = New-Object 'System.Windows.Forms.Button'
	$buttonScript2 = New-Object 'System.Windows.Forms.Button'
	$buttonScript1 = New-Object 'System.Windows.Forms.Button'
	$menustrip1 = New-Object 'System.Windows.Forms.MenuStrip'
	$fileToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$exitToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$editToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$copyToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$pasteToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$helpToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
    #################################
	######### CONFIGURATION #########
	#################################
	
	# GTCCAdminKit information
	$ApplicationName		= "iScuzyScriptRunner  "
	$ApplicationVersion		= " Version: 1.0"
	$ApplicationLastUpdate	= "9/29/2019"
	
	# Author Information
	$AuthorName			= "Patrick Love"
	$AuthorEmail 		= "azumatt@azumatt.com"
	$AuthorBlogName 	= "Azumatt.com"
	$AuthorBlogURL 		= "http://www.azumatt.com"
	$AuthorTwitter 		= "@AzumattDev"
	$AuthorTwitterURL	= "http://www.twitter.com/AzumattDev"
	
	$form1_Load={
		#TODO: Initialize Form Controls here
        CheckedRequirementsMet
        $buttonScript3.Enabled = $False; $buttonScript3.BackColor = 'Black'
        $buttonScript1.Enabled = $False; $buttonScript1.BackColor = 'Black'
        $buttonNETFrameworkFix.Enabled = $False; $buttonNETFrameworkFix.BackColor = 'Black'
        
	}

    
    # Button Script 2 Clicked
    $buttonScript2_Click={
		#TODO: Place custom script here
		
        $grpboxDeviceType.Visible = $True
        $grpboxWhoDevice.Visible = $True
        $buttonScript1.Visible = $False
        $buttonScript3.Visible = $False
        $buttonNETFrameworkFix.Visible = $False
          
		
	}
	
	
	$exitToolStripMenuItem_Click={
		#TODO: Place custom script here
		$form1.Close()
	}

    $buttonRunScript_Click = {
        # Begin running your scripts here for Script 2
            #start "C:\windows\temp\bluetoothdisable.bat\"
            if ($radiobuttonStudent.Checked) {
                if ($radiobuttonDesktop.Checked) {
                    $textboxOutput.Visible = $True
                    $textboxOutput.Text = "Desktop, running script..."
                    $progressbar.Value = 100
                    sleep 2
                    start "\\10.10.2.20\apps\0-Installation Scripts\Submit for Approval\10script\tasks\desktop.bat"
                    sleep 2

                }
                if ($radiobuttonLaptop.Checked) {
                    $textboxOutput.Visible = $True
                    $textboxOutput.Text = "Laptop, running script..."
                    
                   $progressbar.Value= 100
                   sleep 2
                   start "\\10.10.2.20\apps\0-Installation Scripts\Submit for Approval\10script\tasks\laptop.bat"
                   sleep 2
                }
                if ($radiobuttonTablet.Checked) {
                    $textboxOutput.Visible = $True
                    $textboxOutput.Text = "Tablet, running script..."
                   $progressbar.Value= 100
                   sleep 2
                   start "\\10.10.2.20\apps\0-Installation Scripts\Submit for Approval\10script\tasks\tablet.bat"
                   sleep 2
                    }
                xcopy "\\10.10.2.20\Apps\0-Installation Scripts\General Installation\Ninite\Ninite Student Computer Installer.exe" C:\windows\temp
                start "C:\windows\temp\Ninite Student Computer Installer.exe"
                start "\\10.10.2.20\apps\0-Installation Scripts\Submit for Approval\10script\tasks\readandwrite.bat"
            } else {
                $progressbar.Visible = $True
                $textboxOutput.Visible = $True
                $textboxOutput.Text = "Faculty, running script..."
                $progressbar.Value = 100
                sleep 2

                start "\\10.10.2.20\apps\0-Installation Scripts\Submit for Approval\10script\tasks\faculty.bat"

            }
            #start "\\10.10.2.20\apps\0-Installation Scripts\Submit for Approval\10script\tasks\readandwrite.bat"
            
            $buttonRunScript.Visible = $False
            $progressbar.Visible = $True
            if ($progressbar.Value = 100) {
                $buttonRunScript.Visible = $False
                $textboxOutput.Visible = $False
                $textboxOutput.Text = ""
                $buttonScript1.Visible = $True
                $buttonScript3.Visible = $True
                $buttonNETFrameworkFix.Visible = $True
                $grpboxDeviceType.Visible = $False
                $grpboxWhoDevice.Visible = $False
            }
    }
	
	$aboutToolStripMenuItem_Click={
		#TODO: Place custom script here
		Call-About_pff
    }

    Function CheckedRequirementsMet  {
        if ($radiobuttonStudent.Checked -or $radiobuttonFaculty.Checked) {
            if($radiobuttonDesktop.Checked -or $radiobuttonLaptop.Checked -or $radiobuttonTablet.Checked) {
                $buttonRunScript.Visible = $True
            }
        
        }
    }

    $form1.Controls | Where {
     $_ -is [System.Windows.Forms.RadioButton]
     } | ForEach {
      $_.Add_Click({
        If(-Not $buttonRunScript.Visible) {
            $buttonRunScript.Visible = $True
        }
        })
}


	
	
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$form1.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$form1.remove_Load($form1_Load)
            $buttonScript2.remove_Click($buttonScript2_Click)
			$exitToolStripMenuItem.remove_Click($exitToolStripMenuItem_Click)
			$helpToolStripMenuItem.remove_Click($aboutToolStripMenuItem_Click)
			$form1.remove_Load($Form_StateCorrection_Load)
			$form1.remove_Closing($Form_StoreValues_Closing)
			$form1.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}

    #region Call-About_pff
function Call-About_pff
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load("System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
	[void][reflection.assembly]::Load("mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
    $progressbar = New-Object 'System.Windows.Forms.ProgressBar'
	$form_Author = New-Object 'System.Windows.Forms.Form'
	$labelLastUpdateApplicatio = New-Object 'System.Windows.Forms.Label'
	$labelAbout = New-Object 'System.Windows.Forms.Label'
	$linklabel_Twitter = New-Object 'System.Windows.Forms.LinkLabel'
	$labelTwitter = New-Object 'System.Windows.Forms.Label'
	$labelGTCCAdminIsAPower = New-Object 'System.Windows.Forms.Label'
	$labelAuthorName = New-Object 'System.Windows.Forms.Label'
	$labelEmail = New-Object 'System.Windows.Forms.Label'
	$linklabel_Blog = New-Object 'System.Windows.Forms.LinkLabel'
	$label_Blog = New-Object 'System.Windows.Forms.Label'
	$linklabel_Email = New-Object 'System.Windows.Forms.LinkLabel'
	$label_Author = New-Object 'System.Windows.Forms.Label'
	$button_AuthorOK = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	function OnApplicationLoad {
		#Note: This function runs before the form is created
		#Note: To get the script directory in the Packager use: Split-Path $hostinvocation.MyCommand.path
		#Note: To get the console output in the Packager (Windows Mode) use: $ConsoleOutput (Type: System.Collections.ArrayList)
		#Important: Form controls cannot be accessed in this function
		#TODO: Add snapins and custom code to validate the application load	
		return $true #return true for success or false for failure
	}
	
	function OnApplicationExit {
		#Note: This function runs after the form is closed
		#TODO: Add custom code to clean up and unload snapins when the application exits
		
		$script:ExitCode = 0 #Set the exit code for the Packager
	}
	
	$FormEvent_Load={
		#TODO: Initialize Form Controls here
		$linklabel_Blog.text = $AuthorBlogName
		$linklabel_Email.Text = $AuthorEmail
	}
	
	$linklabel_AuthorBlog_LinkClicked=[System.Windows.Forms.LinkLabelLinkClickedEventHandler]{
		[System.Diagnostics.Process]::Start("$AuthorBlogURL")
	}
	
	$linklabel_AuthorEmail_LinkClicked=[System.Windows.Forms.LinkLabelLinkClickedEventHandler]{
		[System.Diagnostics.Process]::Start("mailto:$authoremail?subject=$AuthorBlogName")
	}
	
	$linklabel_Twitter_LinkClicked=[System.Windows.Forms.LinkLabelLinkClickedEventHandler]{
		[System.Diagnostics.Process]::Start("$AuthorTwitterURL")
	}	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$form_Author.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$linklabel_Twitter.remove_LinkClicked($linklabel_Twitter_LinkClicked)
			$linklabel_Blog.remove_LinkClicked($linklabel_AuthorBlog_LinkClicked)
			$linklabel_Email.remove_LinkClicked($linklabel_AuthorEmail_LinkClicked)
			$form_Author.remove_Load($FormEvent_Load)
			$form_Author.remove_Load($Form_StateCorrection_Load)
			$form_Author.remove_Closing($Form_StoreValues_Closing)
			$form_Author.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	#
	# form_Author
	#
	$form_Author.Controls.Add($labelLastUpdateApplicatio)
	$form_Author.Controls.Add($labelAbout)
	$form_Author.Controls.Add($linklabel_Twitter)
	$form_Author.Controls.Add($labelTwitter)
	$form_Author.Controls.Add($labelGTCCAdminIsAPower)
	$form_Author.Controls.Add($labelAuthorName)
	$form_Author.Controls.Add($labelEmail)
	$form_Author.Controls.Add($linklabel_Blog)
	$form_Author.Controls.Add($label_Blog)
	$form_Author.Controls.Add($linklabel_Email)
	$form_Author.Controls.Add($label_Author)
	$form_Author.Controls.Add($button_AuthorOK)
	$form_Author.AcceptButton = $button_AuthorOK
    $form_Author.StartPosition = 'CenterScreen'
	$form_Author.ClientSize = '290, 264'
	$form_Author.FormBorderStyle = 'FixedDialog'
    $form_Author.BackColor = 'ControlDarkDark'
    $form_Author.ForeColor = 'Control'
	$form_Author.MaximizeBox = $False
	$form_Author.MinimizeBox = $False
	$form_Author.Name = "form_Author"
	$form_Author.Text = "Author"
	$form_Author.add_Load($FormEvent_Load)
	#
	# labelLastUpdateApplicatio
	#
	$labelLastUpdateApplicatio.Font = "Microsoft Sans Serif, 8.25pt, style=Bold"
	$labelLastUpdateApplicatio.Location = '21, 32'
	$labelLastUpdateApplicatio.Name = "labelLastUpdateApplicatio"
	$labelLastUpdateApplicatio.Size = '242, 23'
	$labelLastUpdateApplicatio.TabIndex = 11
	$labelLastUpdateApplicatio.Text = "Last Update: $ApplicationLastUpdate"
	#
	# labelAbout
	#
	$labelAbout.Font = "Microsoft Sans Serif, 8.25pt, style=Bold"
	$labelAbout.Location = '21, 9'
	$labelAbout.Name = "labelAbout"
	$labelAbout.Size = '242, 23'
	$labelAbout.TabIndex = 10
	$labelAbout.Text = "$ApplicationName $ApplicationVersion"
	#
	# linklabel_Twitter
	#
	$linklabel_Twitter.Location = '78, 206'
	$linklabel_Twitter.Name = "linklabel_Twitter"
	$linklabel_Twitter.Size = '185, 23'
	$linklabel_Twitter.TabIndex = 9
	$linklabel_Twitter.TabStop = $True
	$linklabel_Twitter.Text = "$AuthorTwitter"
	$linklabel_Twitter.add_LinkClicked($linklabel_Twitter_LinkClicked)
	#
	# labelTwitter
	#
	$labelTwitter.Location = '21, 206'
	$labelTwitter.Name = "labelTwitter"
	$labelTwitter.Size = '43, 23'
	$labelTwitter.TabIndex = 8
	$labelTwitter.Text = "Twitter:"
	#
	# labelGTCCAdminIsAPower
	#
	$labelGTCCAdminIsAPower.Location = '21, 61'
	$labelGTCCAdminIsAPower.Name = "labelGTCCAdminIsAPower"
	$labelGTCCAdminIsAPower.Size = '244, 67'
	$labelGTCCAdminIsAPower.TabIndex = 7
	$labelGTCCAdminIsAPower.Text = "GTCC Admin Tool is a PowerShell Script.

The GUI/WinForm was created in order to help ITS run their frequent scripts more easily."
	#
	# labelAuthorName
	#
	$labelAuthorName.Location = '78, 137'
	$labelAuthorName.Name = "labelAuthorName"
	$labelAuthorName.Size = '198, 23'
	$labelAuthorName.TabIndex = 6
	$labelAuthorName.Text = "$AuthorName"
	#
	# labelEmail
	#
	$labelEmail.Location = '21, 160'
	$labelEmail.Name = "labelEmail"
	$labelEmail.Size = '51, 23'
	$labelEmail.TabIndex = 5
	$labelEmail.Text = "Email:"
	#
	# linklabel_Blog
	#
	$linklabel_Blog.Location = '78, 183'
	$linklabel_Blog.Name = "linklabel_Blog"
	$linklabel_Blog.Size = '187, 23'
	$linklabel_Blog.TabIndex = 4
	$linklabel_Blog.TabStop = $True
	$linklabel_Blog.Text = "$AuthorBlogURL"
	$linklabel_Blog.add_LinkClicked($linklabel_AuthorBlog_LinkClicked)
	#
	# label_Blog
	#
	$label_Blog.Location = '21, 183'
	$label_Blog.Name = "label_Blog"
	$label_Blog.Size = '43, 23'
	$label_Blog.TabIndex = 3
	$label_Blog.Text = "Blog:"
	#
	# linklabel_Email
	#
	$linklabel_Email.Location = '78, 160'
	$linklabel_Email.Name = "linklabel_Email"
	$linklabel_Email.Size = '187, 23'
	$linklabel_Email.TabIndex = 1
	$linklabel_Email.TabStop = $True
	$linklabel_Email.Text = "$AuthorEmail"
	$linklabel_Email.add_LinkClicked($linklabel_AuthorEmail_LinkClicked)
	#
	# label_Author
	#
	$label_Author.Location = '21, 137'
	$label_Author.Name = "label_Author"
	$label_Author.Size = '43, 23'
	$label_Author.TabIndex = 2
	$label_Author.Text = "Author:"
	#
	# button_AuthorOK
	#
	$button_AuthorOK.DialogResult = 'OK'
	$button_AuthorOK.Location = '106, 234'
	$button_AuthorOK.Name = "button_AuthorOK"
	$button_AuthorOK.Size = '75, 23'
	$button_AuthorOK.TabIndex = 0
	$button_AuthorOK.Text = "OK"
	$button_AuthorOK.BackColor = 'Control'
    $button_AuthorOK.ForeColor = 'Desktop'
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $form_Author.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$form_Author.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$form_Author.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$form_Author.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $form_Author.ShowDialog()

}
#endregion
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$form1.SuspendLayout()
	$menustrip1.SuspendLayout()
    $grpboxDeviceType.SuspendLayout()
    $grpboxWhoDevice.SuspendLayout()
	#
	# form1
	#
    $form1.Controls.Add($progressbar)
    $form1.Controls.Add($grpboxDeviceType)
    $form1.Controls.Add($grpboxWhoDevice)
    $form1.Controls.Add($textboxOutput)
    $form1.Controls.Add($buttonCancel)
    $form1.Controls.Add($buttonRunScript)
	$form1.Controls.Add($buttonNETFrameworkFix)
	$form1.Controls.Add($buttonScript3)
	$form1.Controls.Add($buttonScript2)
	$form1.Controls.Add($buttonScript1)
	$form1.Controls.Add($menustrip1)
	$form1.AutoScaleDimensions = '6, 13'
	$form1.AutoScaleMode = 'Font'
	$form1.BackColor = 'Desktop'
	$form1.ClientSize = '940, 412'
	$form1.MainMenuStrip = $menustrip1
	$form1.Name = 'form1'
	$form1.StartPosition = 'CenterScreen'
	$form1.Text = 'iScuzyScriptRunner – GTCC'
    $form1.MaximizeBox = $False
	$form1.MinimizeBox = $False
    $form1.AutoSize = $True
	$form1.add_Load($form1_Load)
    	#region Binary Data
	$form1.Icon = [System.Convert]::FromBase64String('
AAABAAEAICAAAAEAIACoEAAAFgAAACgAAAAgAAAAQAAAAAEAIAAAAAAAABAAABILAAASCwAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAAAACQAAAAw
AAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAA
AAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAALwAAACIAAAALAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAkAAAAawAAAI8AAACPAAAAjwAAAI8AAACPAAAAjwAAAI8AAACPAAAAjwAAAI8AAACPAAAA
jwAAAI8AAACPAAAAjwAAAI8AAACPAAAAjwAAAI8AAACPAAAAjwAAAI8AAACNAAAAZwAAACIAAAAA
AAAAAAAAAAAAAAAAAAAAAAig1/8IoNf/CKDX/wig1/8IoNf/CKDX/wig1/8IoNf/CKDX/wig1/8I
oNf/CKDX/wig1/8IoNf/CKDX/wig1/8IoNf/CKDX/wig1/8IoNf/CKDX/wig1/8IoNf/CKDX/wia
zvsAAACKAAAALQAAAAAAAAAAAAAAAAAAAAAAAAAACKDX/ynT/v8q1P7/KtT//yvT//8r1P//K9T/
/yrU//8q0/7/KdP//yfT/v8m0///JNL+/yHS/v8f0f7/HdH+/xrR//8X0P7/Fc/+/xLP/v8Pzv7/
Dc7+/wvO/v8Izf7/CJrO+wAAAIoAAAAtAAAAAAAAAAAAAAAAAAAAAAAAAAAIoNf/LdX//y/V/v8v
1f//MNX+/zDV/v8w1P7/L9T+/y7V//8u1P7/LNT+/yrT/v8o0///JdP+/yTT/v8h0f7/HdH+/xvQ
/v8Y0P7/Fc/+/xLO//8Pzv7/Dc3+/wrN/v8Ims77AAAAigAAAC0AAAAAAAAAAAAAAAAAAAAAAAAA
AAig1/801f7/M9X//zXW/v821v//Ntb+/zbW/v811v7/NNX//zLW//8x1f//L9X+/y3U/v8q0/7/
KNP//yTT//8h0v//HtH+/xvQ//8X0P7/Fc/+/xLP/v8Pzv7/DM3+/wiazvsAAACKAAAALQAAAAAA
AAAAAAAAAAAAAAAAAAAACKDX/0HY//851///Otb+/zvW//871/7/O9f//zrX//851///N9f//zbW
/v8z1f7/MdX//y7U/v8r0/7/KNT+/yXT//8h0v7/H9H//xvR/v8X0P7/FM/+/xHO/v8Ozv7/CJrO
+wAAAIoAAAAtAAAAAAAAAAAAAAAAAAAAAAAAAAAIoNf/VNz+/z/X/v8/2P7/QNj+/0DY//9A2P7/
P9j+/z7X/v891///Otf+/zfX/v811f//M9X+/y/V/v8s1P7/KNT+/yXS/v8h0f3/HdD9/xrP/f8W
0P//E87+/xDP/v8Ims77AAAAigAAAC0AAAAAAAAAAAAAAAAAAAAAAAAAAAig1/9p4P7/Vt3//0TZ
/v9F2f//Rdn//0XZ//9E2f7/Q9n//0HY//8/2P7/PNf+/zrX//821v7/M9b//y/U/v8s1P7/J9H6
/yHD6/8cuuH/GsTv/xnO/f8Wz/7/Es/+/wiazvsAAACKAAAALQAAAAAAAAAAAAAAAAAAAAAAAAAA
CKDX/3Tj//9y4v//Wd3+/0ra/v9K2/7/Sdr//0na/v9I2f7/Rtn//0PZ//9B2P7/Ptf+/zrX/v83
1v7/M9X+/y7S+/8ov+X/IJi3/xV9mP8Xmrr/Gb/p/xjN/P8Uz/7/CJrO+wAAAIoAAAAtAAAAAAAA
AAAAAAAAAAAAAAAAAAAIoNf/geX+/4Hm//924/7/Xd7+/07b//9O2///Ttv//03b//9K2v//SNr+
/0XZ/v9B2f//Ptj//zvX//820/r/LcDm/z+jvv8reUn/IFhm/xBid/8VmLj/F7/p/xXO/P8Ims77
AAAAigAAAC0AAAAAAAAAAAAAAAAAAAAAAAAAAAig1/+M5///i+f//4zo//9/5f//Zd/+/1Tc/v9S
3P//UNv//07b//9M2v//Sdr+/0bZ//9B2P//PdX6/zPC5f9DpLz/D3cX/xWjFf8Paxj/HU9d/w5i
d/8UmLj/Fb/p/wiZzPsAAACKAAAALQAAAAAAAAAAAAAAAAAAAAAAAAAACKDX/5bq//+W6f//lun/
/5Tp/v+K5///b+L//1fc/v9U3P7/U9z//1Db//9N2v7/Sdr//0TW+v87w+b/O6K+/w92F/8YrRj/
GrQa/xerF/8Paxj/HE9d/w1id/8Rl7j/B429+wAAAIsAAAAtAAAAAAAAAAAAAAAAAAAAAAAAAAAI
oNf/oOz//6Hs//+f7P//nuv//5vq//+X6v//feX+/2Pf//9X3P//U9z//1Db//9L2Pv/QcTm/0Sl
vf8Ndhf/GK0Y/xq0Gv8atBr/GrQa/xerF/8Pahf/GU5c/wxid/8GcJT8AAAAlAAAAC8AAAAAAAAA
AAAAAAAAAAAAAAAAAAig1/+q7v//qu7//6rt/v+o7f//pez//6Hs/v+d6///jej//3Xi//9d3f7/
Udn8/0fG5v9Op77/D3cX/xitGP8atBr/GrQa/xq0Gv8atBr/GrQa/xerF/8Oaxf/FE5d/wRHX/0A
AACqAAAAPgAAAAIAAAAAAAAAAAAAAAAAAAAACKDX/7Tw//+z7///su///7Hv//+u7v//qe7+/6Xs
//+f6///mOr//4bm//9p0+7/Xa3C/xZ6HP8YrRj/GrQa/xq0Gv8atBr/GrQa/xq0Gv8atBr/GrQa
/xerF/8Oaxf/EUFQ/gAAAMgAAABnAAAAFQAAAAIAAAAAAAAAAAAAAAAIoNf/meT5/7zx//+68f//
ufH//7bw//+y7///rO7//6bt//+f6///nOv//4DM4f8rhzL/VsNW/xq0Gv8atBr/GrQa/xq0Gv8a
tBr/GrQa/xq0Gv8atBr/GrQa/xerF/8TcR//GSgt0QAAAHYAAAAiAAAABAAAAAAAAAAAAAAAAAmi
1YELotf/etXy/8Hy///B8///vvL//7nx//+z7///re7//6nt//+l7f//IXot/wFmAf8BZgH/AWYB
/wFmAf8BZgH/GrQa/xq0Gv8atBr/AWYB/wFmAf8BZgH/AWYB/wFmAf8dcyP4Q2RsbwAAABAAAAAC
AAAAAAAAAAAAAAAAAAAAAAmp2/8Qqd//UsPq/6/r/P/E8///v/L//7nx//+18P//se///7Du//+v
7v//ru///6/v//+v7v//sO///wFmAf8atBr/GrQa/xq0Gv8BZgH/PWVw/2K5zv9n4P//CJrO+wAA
AIoAAAAtAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACavd/1PX//8xw/r/GK/r/yq05f+Y4/j/s+3+
/6vr/P+58f//t/D//7fx//+48f//uvH//7zx//++8v//AWYB/xq0Gv8atBr/GrQa/wFmAf9FaHD/
crzO/3nk/v8Im8/6AAAAcwAAACIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJrN3/duH//2jb//9M
z///OMP//yO0+v8Tqe//Dqjq/wul4f8Jotn/CKDX/wig1/8IoNf/CKDX/wig1/8BZgH/Xcpd/zu/
O/8ktyT/AWYB/wRGXv8Ggq//CKDX/wibz/kAAABEAAAACwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAms3f+T6f//j+j//4Hl//9w3v//X9j//0rO//86yP7/MMP//yrD/f8kxP3/HsL9/xi+/f8Svf//
DLv9/wFmAf+h4KH/oeCh/6Hgof8BZgH/AVNw/wOezv8IqNv/AAAAXQAAAB8AAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAACazd/6ju//+l7P//n+v//5fq//+M6P7/fuT//2re//8Iptr/B5vL4wie
0NcIoNLUCKHS1Aii0tQJotPUAWYB/6Hgof+h4KH/oeCh/wFmAf8EQVTsB4Cm3Aml1NQAAAAcAAAA
CgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJq9zrYtHx/7fw//+w7///p+3//53r//+M5v//
NMHq/wd/o6sAAAAjAAAABgAAAAAAAAAAAAAAAAAAAAABZgH/oeCh/6Hgof+h4KH/AWYB/wAAAI8A
AAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAmm1RwJqdrACazd/wms
3f8JrN3/Cazd/wms3f8IlL6TAAAAGAAAAAYAAAAAAAAAAAAAAAAAAAAAAAAAAAFmAf+h4KH/oeCh
/6Hgof8BZgH/AAAAjwAAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAWYB/6Hgof+h4KH/oeCh/wFmAf8AAABrAAAAJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAABZgH/AWYB/wFmAf8BZgH/AWYB/wAAACQAAAAMAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////
///////gAAAD4AAAA+AAAAPgAAAD4AAAA+AAAAPgAAAD4AAAA+AAAAPgAAAD4AAAA+AAAAPgAAAD
4AAAA+AAAAHgAAAA4AAAAOAAAADwAAAD8AAAA/AAAAPwAAAH8AAAB/AB4D/wA+A////gP///4D//
//////////////8=')

    #
    # progressbar
    #
    $progressbar.Name = 'progressbar'
    $progressbar.Location = '249,383'
    $progressbar.Size = '443,17'
    $progressbar.Visible = $False

	# textboxOutput
	#
	$textboxOutput.BackColor = 'ControlDarkDark'
	$textboxOutput.ForeColor = 'Control'
	$textboxOutput.Location = '579, 12'
	$textboxOutput.Multiline = $True
	$textboxOutput.Name = 'textboxOutput'
	$textboxOutput.ReadOnly = $True
    $textboxOutput.ScrollBars = 'Vertical'
	$textboxOutput.Size = '349, 362'
    $textboxOutput.Visible = $False
	#
	# buttonNETFrameworkFix
	#
	$buttonNETFrameworkFix.AutoSizeMode = 'GrowAndShrink'
	$buttonNETFrameworkFix.Location = '368, 230'
	$buttonNETFrameworkFix.Name = 'buttonNETFrameworkFix'
	$buttonNETFrameworkFix.Size = '205, 25'
	$buttonNETFrameworkFix.TabIndex = 4
	$buttonNETFrameworkFix.Text = '.NET Framework Fix'
	$buttonNETFrameworkFix.UseCompatibleTextRendering = $True
	$buttonNETFrameworkFix.UseVisualStyleBackColor = $True
    #
	# buttonRunScript
	#
	$buttonRunScript.BackColor = 'DarkGreen'
	$buttonRunScript.ForeColor = 'Control'
	$buttonRunScript.Location = '775, 377'
	$buttonRunScript.Name = 'buttonRunScript'
	$buttonRunScript.Size = '75, 23'
	$buttonRunScript.TabIndex = 5
	$buttonRunScript.Text = '&Run Script'
	$buttonRunScript.UseCompatibleTextRendering = $True
	$buttonRunScript.UseVisualStyleBackColor = $False
    $buttonRunScript.Visible = $False
    $buttonRunScript.add_Click($buttonRunScript_Click)
    #
	# buttonCancel
	#
	$buttonCancel.Location = '853, 377'
	$buttonCancel.Name = 'buttonCancel'
	$buttonCancel.Size = '75, 23'
	$buttonCancel.TabIndex = 4
	$buttonCancel.Text = 'Cancel'
	$buttonCancel.UseCompatibleTextRendering = $True
	$buttonCancel.UseVisualStyleBackColor = $True
    $buttonCancel.add_Click($exitToolStripMenuItem_Click)
    #
	# grpboxWhoDevice
	#
	$grpboxWhoDevice.Controls.Add($radiobuttonFaculty)
	$grpboxWhoDevice.Controls.Add($radiobuttonStudent)
	$grpboxWhoDevice.ForeColor = 'Control'
	$grpboxWhoDevice.Location = '12, 95'
	$grpboxWhoDevice.Name = 'grpboxWhoDevice'
	$grpboxWhoDevice.Size = '150, 115'
	$grpboxWhoDevice.TabIndex = 4
	$grpboxWhoDevice.TabStop = $False
	$grpboxWhoDevice.Text = 'Who''s Device will this be?'
	$grpboxWhoDevice.UseCompatibleTextRendering = $True
    $grpboxWhoDevice.Visible = $False
    #
	# grpboxDeviceType
	#
    $grpboxDeviceType.Controls.Add($radiobuttonTablet)
	$grpboxDeviceType.Controls.Add($radiobuttonLaptop)
	$grpboxDeviceType.Controls.Add($radiobuttonDesktop)
	$grpboxDeviceType.ForeColor = 'Control'
	$grpboxDeviceType.Location = '189, 95'
	$grpboxDeviceType.Name = 'grpboxDeviceType'
	$grpboxDeviceType.Size = '155, 115'
	$grpboxDeviceType.TabIndex = 4
	$grpboxDeviceType.TabStop = $False
	$grpboxDeviceType.Text = 'What kind of device is this?'
	$grpboxDeviceType.UseCompatibleTextRendering = $True
    $grpboxDeviceType.Visible = $False
    #
	# radiobuttonTablet
	#
	$radiobuttonTablet.Location = '7, 82'
	$radiobuttonTablet.Name = 'radiobuttonTablet'
	$radiobuttonTablet.Size = '104, 24'
	$radiobuttonTablet.TabIndex = 2
	$radiobuttonTablet.TabStop = $True
	$radiobuttonTablet.Text = 'Tablet'
	$radiobuttonTablet.UseCompatibleTextRendering = $True
	$radiobuttonTablet.UseVisualStyleBackColor = $True
    $radiobuttonTablet.Add_Click({ CheckedRequirementsMet })
	#
	# radiobuttonLaptop
	#
	$radiobuttonLaptop.Location = '7, 51'
	$radiobuttonLaptop.Name = 'radiobuttonLaptop'
	$radiobuttonLaptop.Size = '104, 24'
	$radiobuttonLaptop.TabIndex = 1
	$radiobuttonLaptop.TabStop = $True
	$radiobuttonLaptop.Text = 'Laptop'
	$radiobuttonLaptop.UseCompatibleTextRendering = $True
	$radiobuttonLaptop.UseVisualStyleBackColor = $True
    $radiobuttonLaptop.Add_Click({ CheckedRequirementsMet })
	#
	# radiobuttonDesktop
	#
	$radiobuttonDesktop.Location = '7, 20'
	$radiobuttonDesktop.Name = 'radiobuttonDesktop'
	$radiobuttonDesktop.Size = '104, 24'
	$radiobuttonDesktop.TabIndex = 0
	$radiobuttonDesktop.TabStop = $True
	$radiobuttonDesktop.Text = 'Desktop'
	$radiobuttonDesktop.UseCompatibleTextRendering = $True
	$radiobuttonDesktop.UseVisualStyleBackColor = $True
    $radiobuttonDesktop.Add_Click({ CheckedRequirementsMet })
	#
	# buttonScript3
	#
	$buttonScript3.AutoSizeMode = 'GrowAndShrink'
	$buttonScript3.Location = '368, 185'
	$buttonScript3.Name = 'buttonScript3'
	$buttonScript3.Size = '205, 25'
	$buttonScript3.TabIndex = 3
	$buttonScript3.Text = 'Script 3'
	$buttonScript3.UseCompatibleTextRendering = $True
	$buttonScript3.UseVisualStyleBackColor = $True
	#
	# buttonScript2
	#
	$buttonScript2.AutoSizeMode = 'GrowAndShrink'
	$buttonScript2.Location = '368, 140'
	$buttonScript2.Name = 'buttonScript2'
	$buttonScript2.Size = '205, 25'
	$buttonScript2.TabIndex = 2
	$buttonScript2.Text = 'Script 2'
	$buttonScript2.UseCompatibleTextRendering = $True
	$buttonScript2.UseVisualStyleBackColor = $True
    $buttonScript2.add_Click($buttonScript2_Click)
	#
	# buttonScript1
	#
	$buttonScript1.AutoSizeMode = 'GrowAndShrink'
	$buttonScript1.Location = '368, 95'
	$buttonScript1.Name = 'buttonScript1'
	$buttonScript1.Size = '205, 25'
	$buttonScript1.TabIndex = 1
	$buttonScript1.Text = 'Script 1'
	$buttonScript1.UseCompatibleTextRendering = $True
	$buttonScript1.UseVisualStyleBackColor = $True
	#
	# radiobuttonFaculty
	#
	$radiobuttonFaculty.Location = '7, 66'
	$radiobuttonFaculty.Name = 'radiobuttonFaculty'
	$radiobuttonFaculty.Size = '104, 24'
	$radiobuttonFaculty.TabIndex = 1
	$radiobuttonFaculty.TabStop = $True
	$radiobuttonFaculty.Text = 'Faculty'
	$radiobuttonFaculty.UseCompatibleTextRendering = $True
    $radiobuttonFaculty.Add_Click({ CheckedRequirementsMet })
	#
	# radiobuttonStudent
	#
	$radiobuttonStudent.Location = '7, 20'
	$radiobuttonStudent.Name = 'radiobuttonStudent'
	$radiobuttonStudent.Size = '104, 24'
	$radiobuttonStudent.TabIndex = 0
	$radiobuttonStudent.TabStop = $True
	$radiobuttonStudent.Text = 'Student'
	$radiobuttonStudent.UseCompatibleTextRendering = $True
	$radiobuttonStudent.UseVisualStyleBackColor = $True
    $radiobuttonStudent.Add_Click({ CheckedRequirementsMet })
    
	#
	# menustrip1
	#
	$menustrip1.BackColor = 'Desktop'
	[void]$menustrip1.Items.Add($fileToolStripMenuItem)
	[void]$menustrip1.Items.Add($editToolStripMenuItem)
	[void]$menustrip1.Items.Add($helpToolStripMenuItem)
	$menustrip1.Location = '0, 0'
	$menustrip1.Name = 'menustrip1'
	$menustrip1.Size = '940, 24'
	$menustrip1.TabIndex = 0
	$menustrip1.Text = 'menustrip1'
	#
	# fileToolStripMenuItem
	#
	[void]$fileToolStripMenuItem.DropDownItems.Add($exitToolStripMenuItem)
	$fileToolStripMenuItem.ForeColor = 'Control'
    #region Binary Data
	$fileToolStripMenuItem.Image = [System.Convert]::FromBase64String('
iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATcSURBVFhHxZVLTxtXGIaj/oF2kXVVQbrqqn8g
aoIqVVV3raoumkVrkSySbroJqpRFZdpFFAk1gCihFylVWwdCgNZRMMVgAwZsMBhjYzDmZowhxgYb
m3Dx5e33nfGMx4wnoRJJR3o4SmK+9znvOeOce95TV1eHs6A47r8//MsmkwkdHR3o7OxET3c3zGYz
enst6O+3wm63weFwwOV0we12Y8YzA7/Ph0AggGAwiFAodHqBty41XKy63HRYXdMEGUWgvb1MwNLb
WybgdDqFQEtLC+qNRtTW1pYJqGdWXW48PP/2lQ8p8g3iNRF+4eKdd6tqGo/bHgcQiO5jflOiJCA3
0KM0YCUBm80uCbikBljAWF8Pg6FcYDaSgbfIHdMUqi79cPz6mx9cpejzQqC6pvGgucsrwtUoAh1y
A0UBiyRgt0sCrhc04F3PYIYJZ+AJp3H1uz5Uv3c3R9HvFwWaMBfNCPwyGxlFoF05AknAwg1Y+ysL
1BthqDWUCUxTKDPFrBGrabzz0T2+G98oAhzop4p49dHKKA3oHYEs4CoJGKkBw4kG3BSoZpLgTIpu
UASUc6KqvOtpQUlAaqBbaYAuoU4DQsBQ3oBrZU9imUnBSWgEZqgehs9IRhEovobdymvYW/EIPPQa
+iq8huMUyIyFUhhdImjVCEzz2azt0fnsUU0S/MtngWMxiZFQEsO0Dgd3ad3VCkyupAQThIts1XBl
ArIfW0rSTpK0i9LKOBgaPMIBJxgqYl/YhY2ZryAgh4xzgCqkxK4IENCwk0EigJACdjCoJrCDAcIa
SAj6CY2AEkBDRsp2soNhGsrrEK1DNJADbPMJMXiQB84l8NgbR7cnhoeTMfzpeorfxrfw6+gWfh7d
RNtIFPeINkeU/hwVszQCwwscsAM7Df/8F89LoXV4Az8ObQhpjcAA7WIgEKc1Lj581g/PbLZF0GyP
4B9/XCvQ59uGZVZCLVAoAHn6kc0XcJQr4DBbwP5RAenDAlIHeew+yyOeySOWziOayiGym8XaThbL
iSxC21ksxI7FHJ55dzAseOKNaQXMdH7mGYJWWUAKhwg/LoY/Oy4gQwKpQyk8UQzf2sthI5lDmARW
KXwpnkUwlkXgaUmgwbom4AyNQJd7C4+KyAIcnqMfYvcUflAM36PwJIfv57FNAhzOuy8Lp93P0+79
WyWB232rAs7QCDxwRWFyRnF/NKISKMAZSmBsMYHRYJzejDhd1ji9CXG6SBL9dJ59BB/dE+82zMTf
nm300C67pmOY3TwSs3jm973LAs7SCHBwqz2M25ZlRaBS9bx7vepXTlTPu/dGSwLfmkMCzqooYKR/
vPXXYpmAuvr0KapfVFU/S+GejZLArZ5Fga5A3aMgbhKyAN/6StUPnKL6zinCHcNUpCTAs292BfUF
vn4YEMgCp731etVP0+7dKgF5vq7ADdMcbjzwKwIVb30xXHPrKVyunsO5et79RLgkwLO/Mvn1Ba79
7sO1P3yKAH/hyNXbirfeesrq2wkT/b/gUgmI+YSuwBf3vQJZIEM7f9EXTug51XO4UyXwJc1mdAX4
Q1cIWeA0t179hSNXz+ET65LA+NqhmCXPZnQFPvtpWiALnOXDM3n2p4SuwCetbgF/+GXwceuUQFfg
VaIR+D9QBOi5QFwn+C9eIeeu/wuEgX3xzdbjxQAAAABJRU5ErkJggg==')
	#endregion
	$fileToolStripMenuItem.Name = 'fileToolStripMenuItem'
	$fileToolStripMenuItem.Size = '37, 20'
	$fileToolStripMenuItem.Text = 'File'
	#
	# exitToolStripMenuItem
	#
	$exitToolStripMenuItem.BackColor = 'Desktop'
	$exitToolStripMenuItem.ForeColor = 'Control'
	$exitToolStripMenuItem.Name = 'exitToolStripMenuItem'
	$exitToolStripMenuItem.Size = '152, 22'
	$exitToolStripMenuItem.Text = 'Exit'
	$exitToolStripMenuItem.add_Click($exitToolStripMenuItem_Click)
	#
	# editToolStripMenuItem
	#
	[void]$editToolStripMenuItem.DropDownItems.Add($copyToolStripMenuItem)
	[void]$editToolStripMenuItem.DropDownItems.Add($pasteToolStripMenuItem)
	$editToolStripMenuItem.ForeColor = 'Control'
    	#region Binary Data
	$editToolStripMenuItem.Image = [System.Convert]::FromBase64String('
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')
	#endregion
	$editToolStripMenuItem.Name = 'editToolStripMenuItem'
	$editToolStripMenuItem.Size = '39, 20'
	$editToolStripMenuItem.Text = 'Edit'
	#
	# copyToolStripMenuItem
	#
	$copyToolStripMenuItem.BackColor = 'Desktop'
	$copyToolStripMenuItem.ForeColor = 'Control'
	$copyToolStripMenuItem.Name = 'copyToolStripMenuItem'
	$copyToolStripMenuItem.ShortcutKeys = [System.Windows.Forms.Keys]::C -bor [System.Windows.Forms.Keys]::Control 
	$copyToolStripMenuItem.Size = '152, 22'
	$copyToolStripMenuItem.Text = 'Copy'
	#
	# pasteToolStripMenuItem
	#
	$pasteToolStripMenuItem.BackColor = 'Desktop'
	$pasteToolStripMenuItem.ForeColor = 'Control'
	$pasteToolStripMenuItem.Name = 'pasteToolStripMenuItem'
	$pasteToolStripMenuItem.ShortcutKeys = [System.Windows.Forms.Keys]::V -bor [System.Windows.Forms.Keys]::Control 
	$pasteToolStripMenuItem.Size = '152, 22'
	$pasteToolStripMenuItem.Text = 'Paste'
	#
	# helpToolStripMenuItem
	#
	$helpToolStripMenuItem.ForeColor = 'Control'
    	#region Binary Data
	$helpToolStripMenuItem.Image = [System.Convert]::FromBase64String('
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')
	#endregion
	$helpToolStripMenuItem.Name = 'helpToolStripMenuItem'
	$helpToolStripMenuItem.Size = '52, 20'
	$helpToolStripMenuItem.Text = 'About'
	$helpToolStripMenuItem.add_Click($aboutToolStripMenuItem_Click)
    $grpboxWhoDevice.ResumeLayout()
    $grpboxDeviceType.ResumeLayout()
	$menustrip1.ResumeLayout()
	$form1.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $form1.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$form1.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$form1.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$form1.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $form1.ShowDialog()

}
#endregion Source: MainForm.psf

#Start the application
Main ($CommandLine)
