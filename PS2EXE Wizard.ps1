# Load the necessary assemblies for creating a GUI and working with JSON.
Add-Type -AssemblyName System.Windows.Forms

# Create the main GUI form.
$form = New-Object System.Windows.Forms.Form
$form.Text = 'PS2EXE GUI'
$form.Size = New-Object System.Drawing.Size(400,250)
$form.StartPosition = "CenterScreen"

# Label and textbox for PowerShell script path.
$PowerShellLabel = New-Object System.Windows.Forms.Label
$PowerShellLabel.Location = New-Object System.Drawing.Point(10,20)
$PowerShellLabel.Size = New-Object System.Drawing.Size(150,20)
$PowerShellLabel.Text = "PowerShell Script Path:"
$form.Controls.Add($PowerShellLabel)

$PowerShellPathTextBox = New-Object System.Windows.Forms.TextBox
$PowerShellPathTextBox.Location = New-Object System.Drawing.Point(170,20)
$PowerShellPathTextBox.Size = New-Object System.Drawing.Size(150,20)
$form.Controls.Add($PowerShellPathTextBox)

# Button to open file dialog for PowerShell script.
$BrowsePSButton = New-Object System.Windows.Forms.Button
$BrowsePSButton.Location = New-Object System.Drawing.Point(330,20)
$BrowsePSButton.Text = "Browse"
$BrowsePSButton.Add_Click({
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.Filter = "PowerShell Script (*.ps1)|*.ps1"
    if ($OpenFileDialog.ShowDialog() -eq "OK") {
        $PowerShellPathTextBox.Text = $OpenFileDialog.FileName
    }
})
$form.Controls.Add($BrowsePSButton)

# Label and textbox for the desired EXE output path.
$EXELabel = New-Object System.Windows.Forms.Label
$EXELabel.Location = New-Object System.Drawing.Point(10,60)
$EXELabel.Size = New-Object System.Drawing.Size(150,20)
$EXELabel.Text = "Output EXE Path:"
$form.Controls.Add($EXELabel)

$EXEPathTextBox = New-Object System.Windows.Forms.TextBox
$EXEPathTextBox.Location = New-Object System.Drawing.Point(170,60)
$EXEPathTextBox.Size = New-Object System.Drawing.Size(150,20)
$form.Controls.Add($EXEPathTextBox)

# Button to open file dialog for EXE output path.
$BrowseEXEButton = New-Object System.Windows.Forms.Button
$BrowseEXEButton.Location = New-Object System.Drawing.Point(330,60)
$BrowseEXEButton.Text = "Browse"
$BrowseEXEButton.Add_Click({
    $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
    $SaveFileDialog.Filter = "Executable (*.exe)|*.exe"
    if ($SaveFileDialog.ShowDialog() -eq "OK") {
        $EXEPathTextBox.Text = $SaveFileDialog.FileName
    }
})
$form.Controls.Add($BrowseEXEButton)

# Button to install the necessary PS2EXE module.
$InstallButton = New-Object System.Windows.Forms.Button
$InstallButton.Location = New-Object System.Drawing.Point(10,110)
$InstallButton.Size = New-Object System.Drawing.Size(120,30)
$InstallButton.Text = "Install PS2EXE"
$InstallButton.Add_Click({
    # Ask for confirmation before proceeding with installation.
    $result = [System.Windows.Forms.MessageBox]::Show("Do you want to install the PS2EXE module?", "Confirmation", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    # If user confirms (clicks 'Yes'), proceed with the installation.
    if ($result -eq "Yes") {
        try {
            Install-Module -Name PS2EXE -Scope CurrentUser -Force
            [System.Windows.Forms.MessageBox]::Show("PS2EXE module successfully installed!", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Failed to install PS2EXE module. Error: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
})
$form.Controls.Add($InstallButton)

# Add a CheckBox for the NoConsole option.
$HideConsoleCheckBox = New-Object System.Windows.Forms.CheckBox
$HideConsoleCheckBox.Location = New-Object System.Drawing.Point(10, 150)
$HideConsoleCheckBox.Size = New-Object System.Drawing.Size(200, 20)
$HideConsoleCheckBox.Text = "Hide Console on EXE Run"
$form.Controls.Add($HideConsoleCheckBox)

# Button to convert the PowerShell script to an EXE.
$ConvertButton = New-Object System.Windows.Forms.Button
$ConvertButton.Location = New-Object System.Drawing.Point(140,110)
$ConvertButton.Size = New-Object System.Drawing.Size(120,30)
$ConvertButton.Text = "Convert to EXE"
$ConvertButton.Add_Click({
    if (-not $PowerShellPathTextBox.Text -or -not $EXEPathTextBox.Text) {
        [System.Windows.Forms.MessageBox]::Show("Please select both PowerShell script and EXE output paths!", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    try {
        # Check if user wants to hide console and adjust command accordingly.
        if ($HideConsoleCheckBox.Checked) {
            # Assuming Invoke-PS2EXE accepts -NoConsole to hide the console.
            Invoke-PS2EXE -InputFile $PowerShellPathTextBox.Text -OutputFile $EXEPathTextBox.Text -NoConsole
        } else {
            Invoke-PS2EXE -InputFile $PowerShellPathTextBox.Text -OutputFile $EXEPathTextBox.Text
        }
        [System.Windows.Forms.MessageBox]::Show("Conversion Successful!", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Conversion Failed. Error: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})
$form.Controls.Add($ConvertButton)

# Display the form.
$form.ShowDialog()
