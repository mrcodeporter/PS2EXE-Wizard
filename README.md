# PS2EXE Wizard

## Introduction

**PS2EXE Wizard** is a user-friendly graphical application built in PowerShell for converting PowerShell scripts into executable (EXE) files using the PS2EXE module. Whether you're a PowerShell enthusiast or need to distribute your scripts as standalone executables, PS2EXE Converter simplifies the process. This tool is created by **Mr.code.porter**.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Important Notes](#important-notes)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [Author](#author)

## Features

- **User-Friendly GUI**: A simple and intuitive graphical user interface for easy script conversion.

- **Console Control**: Choose to hide or show the console window when running the generated EXE.

- **Install PS2EXE Module**: An option to install the PS2EXE module if it's not already installed.

## Prerequisites

Before using the PS2EXE Converter, make sure you have the following:

- **Windows OS**: The application is designed for Windows systems.

- **PowerShell**: PowerShell should be installed on your system.

- **PS2EXE Module**: The PS2EXE module should be installed. The application can assist with this if needed.

## Usage

1. **Select PowerShell Script**: Click the "Browse" button next to the "PowerShell Script Path" field to choose the script you want to convert.

2. **Specify Output EXE Path**: Click the "Browse" button next to the "Output EXE Path" field to set the location and name for the output EXE file.

3. **Console Options** (Optional):
   - Check the "Hide Console on EXE Run" checkbox if you want to hide the console when running the EXE.

4. **Install PS2EXE Module** (Optional):
   - Click the "Install PS2EXE" button to install the PS2EXE module if it's not already installed.

5. **Convert to EXE**: Click the "Convert to EXE" button to start the conversion process.

6. **Conversion Result**: A message box will display the result. Successful conversion shows a success message; otherwise, an error message appears.

## Important Notes

- Ensure you save your PowerShell script before converting it, as the original script may be overwritten during conversion.

- The application will automatically attempt to install the PS2EXE module if it's not installed. An internet connection is required for this.

- The converted EXE file inherits the icon of the PowerShell script file.

## License

This application is provided under the MIT License. You are free to use, modify, and distribute it as needed. See [LICENSE](LICENSE) for details.

## Acknowledgments

- The PS2EXE module is developed and maintained by the PowerShell community. More information about the module can be found [here](https://github.com/MScholtes/PS2EXE).

## Author

This application is created by **Mr.code.porter** and is open-source. Contributions and feedback are welcome.

Enjoy using the PS2EXE Wizard!
