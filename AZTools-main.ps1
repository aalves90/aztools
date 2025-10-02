# ===============================================================# ===================================================================================
# Automacao - Pos-Instalacao para Windows 11 - AZCorp
# ===================================================================================

# --- BLOCO DE CONFIGURACAO CENTRAL ---
$script:config = @{
	LogoUrl               = "https://i.postimg.cc/mgwTK81L/favicon-48x48.png"
	WallpapersUrl         = "https://azcorp.tech/img-public/wallpapers/"
    TeamsBackgroundsUrl   = "https://azcorp.tech/img-public/teams/"
    OneDriveUrl           = "https://go.microsoft.com/fwlink/p/?linkid=844652"
    TargetReleaseVersion  = "24H2"

    Softphone = @{
        InstallerUrl    = "https://github.com/foriptecnologia/softphone/releases/download/v1.0.9/softphone.Setup.1.0.9.exe"
        InstallerHash   = "COLOQUE_O_HASH_SHA256_DO_INSTALADOR_AQUI"
        Executable      = "softphone.exe"
    }
    
    # Aplicativos padrao recomendados pela AZCorp
    RecommendedApps = @(
        @{ Name = "7-Zip";                           ChocoPackage = "7zip";                           Executable = "7zFM.exe" },
        @{ Name = "Microsoft Edge";                  ChocoPackage = "microsoft-edge";                  Executable = "msedge.exe" },
        @{ Name = "Microsoft Teams";                 ChocoPackage = "microsoft-teams-work-or-school"; Executable = "ms-teams.exe" },
        @{ Name = "Power BI Desktop";                ChocoPackage = "powerbi-desktop";                Executable = "PBIDesktop.exe" },
        @{ Name = "Zoom";                            ChocoPackage = "zoom";                           Executable = "Zoom.exe" },
        @{ Name = "AnyDesk";                         ChocoPackage = "anydesk.install";                Executable = "AnyDesk.exe" },
        @{ Name = "TeamViewer";                      ChocoPackage = "teamviewer";                     Executable = "TeamViewer.exe" }
    )
    
    # Aplicativos opcionais para usuarios avancados, desenvolvedores, etc.
    OptionalApps = @(
        @{ Name = "Google Chrome";                   ChocoPackage = "googlechrome";                   Executable = "chrome.exe" },
        @{ Name = "Visual Studio Code";  ChocoPackage = "vscode"; Executable = "code.exe" },
        @{ Name = "Git";                 ChocoPackage = "git" },
        @{ Name = "Node.js LTS";         ChocoPackage = "nodejs-lts" },
        @{ Name = "Python 3";            ChocoPackage = "python" },
        @{ Name = "OpenJDK (Java)";      ChocoPackage = "openjdk" },
        @{ Name = "Docker Desktop";      ChocoPackage = "docker-desktop" },
        @{ Name = "Postman";             ChocoPackage = "postman" },
        @{ Name = "Windows Terminal";    ChocoPackage = "microsoft-windows-terminal" },
        @{ Name = "LibreOffice";         ChocoPackage = "libreoffice-fresh" },
        @{ Name = "Microsoft PowerToys"; ChocoPackage = "powertoys" },
        @{ Name = "VLC Media Player";    ChocoPackage = "vlc" },
        @{ Name = "Spotify";             ChocoPackage = "spotify" },
        @{ Name = "GIMP";                ChocoPackage = "gimp" },
        @{ Name = "OBS Studio";          ChocoPackage = "obs-studio" },
        @{ Name = "TreeSize Free";       ChocoPackage = "treesizefree" },
        @{ Name = "PuTTY";               ChocoPackage = "putty" },
        @{ Name = "WinDirStat";          ChocoPackage = "windirstat" },
        @{ Name = "Greenshot";           ChocoPackage = "greenshot" }
    )

    WebShortcuts = @(
        @{ Name = "Outlook Web"; Url = "https://outlook.office.com/" },
        @{ Name = "Atender AZCorp"; Url = "https://atender.azcorp.tech/" }
    )
    
    CacheDatabase = @{
        # --- Navegadores ---
        "*Google Chrome*" = @{
            Processes = @("chrome");
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache", "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache\js") }
            "Historico de Navegacao" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History") }
            "Cookies" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Network\Cookies") }
        }
        "*Microsoft Edge*" = @{
            Processes = @("msedge");
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache") }
            "Historico de Navegacao" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History") }
            "Cookies" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Network\Cookies") }
        }
        "*Mozilla Firefox*" = @{
            Processes = @("firefox");
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*\cache2", "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*\startupCache") }
        }
        "*Opera*" = @{
            Processes = @("opera");
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Opera Software\Opera Stable\Cache") }
            "Historico de Navegacao" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Opera Software\Opera Stable\History") }
            "Cookies" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Opera Software\Opera Stable\Network\Cookies") }
        }
        # --- Comunicacao e Produtividade ---
        "*Microsoft Teams*" = @{
            Processes = @("ms-teams", "msteams");
            "Cache Geral (Novo Teams)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams") }
            "Cache Geral (Teams Classico)" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Microsoft\Teams\Cache", "$env:APPDATA\Microsoft\Teams\Code Cache", "$env:APPDATA\Microsoft\Teams\GPUCache") }
        }
        "*Zoom*" = @{
            Processes = @("Zoom");
            "Cache de Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Zoom\data\Cache") }
        }
        "*Slack*" = @{
            Processes = @("slack");
            "Cache de Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Slack\Cache", "$env:APPDATA\Slack\Code Cache", "$env:APPDATA\Slack\GPUCache") }
        }
        "*Discord*" = @{
             Processes = @("Discord");
             "Cache de Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\discord\Cache", "$env:APPDATA\discord\Code Cache", "$env:APPDATA\discord\GPUCache") }
        }
        "*Telegram*" = @{
            Processes = @("Telegram");
            "Cache de Midia e Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Telegram Desktop\tdata") }
        }
        "*WhatsApp*" = @{
            Processes = @("WhatsApp");
            "Cache de Midia e Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\WhatsApp\Cache", "$env:APPDATA\WhatsApp\Code Cache", "$env:APPDATA\WhatsApp\GPUCache") }
        }
        # --- Acesso Remoto ---
        "*TeamViewer*" = @{
            Processes = @("TeamViewer");
            "Logs e Cache de Conexao" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\TeamViewer") }
        }
        "*AnyDesk*" = @{
            Processes = @("AnyDesk");
            "Logs e Cache de Conexao" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\AnyDesk\ad_cache", "$env:APPDATA\AnyDesk\ad_logs") }
        }
        # --- Sistema e Desenvolvimento ---
        "*Visual Studio Code*" = @{
            Processes = @("Code");
            "Cache de Codigo" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Code\Cache", "$env:APPDATA\Code\CachedData", "$env:APPDATA\Code\GPUCache") }
        }
        "*Spotify*" = @{
            Processes = @("Spotify");
            "Cache de Midia" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Spotify\Data") }
        }
        "Windows Defender" = @{
            Processes = @();
            "Logs de Verificacao" = @{ Type = "FolderContent"; Path = @("$env:ProgramData\Microsoft\Windows Defender\Scans\History\Service") }
        }
    }

    BloatwareApps = [ordered]@{
        "Microsoft.549981C3F5F10"                  = @{ FriendlyName = "Cortana (Assistente)";                  WingetId = "9N2L52R72P9D" }
        "Microsoft.WindowsStore"                  = @{ FriendlyName = "Microsoft Store (Loja)";                WingetId = "9WZDNCRFJBMP" }
        "Microsoft.WindowsFeedbackHub"            = @{ FriendlyName = "Hub de Feedback";                       WingetId = "9NBLGGH4R32N" }
        "Microsoft.GetHelp"                       = @{ FriendlyName = "Obter Ajuda";                           WingetId = "9PKB9M2G2GC6" }
        "Microsoft.Getstarted"                    = @{ FriendlyName = "Introducao (Dicas)";                    WingetId = "9NBLGGH4V3X3" }
        "Microsoft.MicrosoftSolitaireCollection"    = @{ FriendlyName = "Paciencia (Colecao de Jogos)";        WingetId = "9WZDNCRFHWD2" }
        "Microsoft.People"                        = @{ FriendlyName = "Pessoas (Contatos)";                    WingetId = "9NBLGGH10PG8" }
        "Microsoft.Wallet"                        = @{ FriendlyName = "Carteira";                              WingetId = "9NBLGGH62K36" }
        "Microsoft.WindowsAlarms"                 = @{ FriendlyName = "Alarmes e Relogio";                     WingetId = "9WZDNCRFBLM0" }
        "Microsoft.WindowsCamera"                 = @{ FriendlyName = "Camera";                                WingetId = "9WZDNCRFJBBG" }
        "microsoft.windowscommunicationsapps"     = @{ FriendlyName = "Email e Calendario";                    WingetId = "9WZDNCRFHVQM" }
        "Microsoft.WindowsMaps"                   = @{ FriendlyName = "Mapas";                                 WingetId = "9WZDNCRDTBVB" }
        "Microsoft.WindowsSoundRecorder"          = @{ FriendlyName = "Gravador de Voz";                       WingetId = "9WZDNCRFHWKN" }
        "Microsoft.Xbox.TCUI"                     = @{ FriendlyName = "Interface de Jogo Xbox";                WingetId = "9NTN0S632258" } 
        "Microsoft.XboxApp"                       = @{ FriendlyName = "Aplicativo Xbox";                       WingetId = "9MV0B5HZVK9Z" }
        "Microsoft.XboxGameOverlay"               = @{ FriendlyName = "Barra de Jogo Xbox";                    WingetId = "9N0P1P2327D5" }
        "Microsoft.XboxGamingOverlay"             = @{ FriendlyName = "Overlay de Jogo Xbox";                  WingetId = "9N0P1P2327D5" }
        "Microsoft.XboxSpeechToTextOverlay"       = @{ FriendlyName = "Legendas de Jogo Xbox";                 WingetId = "9N138V43T07Z" }
        "Microsoft.YourPhone"                     = @{ FriendlyName = "Vincular ao Celular";                   WingetId = "9NMPJ99VBFV3" }
        "Microsoft.ZuneMusic"                     = @{ FriendlyName = "Groove Musica";                         WingetId = "9WZDNCRFJ3PT" }
        "Microsoft.ZuneVideo"                     = @{ FriendlyName = "Filmes e TV";                           WingetId = "9WZDNCRFJ3P2" }
        "Microsoft.MixedReality.Portal"           = @{ FriendlyName = "Portal de Realidade Mista";             WingetId = "9NG1H8B3ZC7M" }
        "Microsoft.BingWeather"                   = @{ FriendlyName = "Clima";                                 WingetId = "9WZDNCRFJ3Q2" }
        "Microsoft.BingNews"                      = @{ FriendlyName = "Noticias";                              WingetId = "9WZDNCRFHVFW" }
    }
}

# --- PREPARACAO DO AMBIENTE ---
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
Add-Type -AssemblyName Microsoft.VisualBasic, System.Windows.Forms, System.Drawing, System.Web, System.Collections

# Adiciona codigo C# para interagir com a API do Windows
$csharpDwmApi = @"
using System;
using System.Runtime.InteropServices;
public class DwmApi {
    [DllImport("dwmapi.dll")]
    public static extern int DwmSetWindowAttribute(IntPtr hwnd, int attr, ref int attrValue, int attrSize);
}
"@
Add-Type -TypeDefinition $csharpDwmApi -ErrorAction SilentlyContinue

$csharpCode = @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
Add-Type -TypeDefinition $csharpCode -ErrorAction SilentlyContinue

# --- Bloco de Verificacao de Administrador ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    $powershellArgs = "-ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Definition)`""
    Start-Process powershell.exe -ArgumentList $powershellArgs -Verb RunAs
    exit
}

# --- Tema e Variaveis Globais ---
$script:themeColors = @{
    FormBackground      = [System.Drawing.Color]::FromArgb(45, 45, 48)
    ControlBackground   = [System.Drawing.Color]::FromArgb(62, 62, 66)
    ControlBorder       = [System.Drawing.Color]::FromArgb(85, 85, 85)
    Foreground          = [System.Drawing.Color]::FromArgb(241, 241, 241)
    Accent              = [System.Drawing.Color]::FromArgb(109, 0, 239)
    ForegroundButton    = [System.Drawing.Color]::White
}

$script:logQueue = New-Object System.Collections.Concurrent.ConcurrentQueue[string]
$script:logJob = $null
$script:stopLogJob = $false
$script:taskResults = [ordered]@{}
$script:rebootRequired = $false
$script:hostname = [System.Net.Dns]::GetHostName()
$script:foundCaches = @{}
$script:isUpdatingChecks = $false
$script:dismRepairSuggested = $false
$script:cleanupTabHasBeenAnalyzed = $false
$script:initialScanTimer = New-Object System.Windows.Forms.Timer

$script:executionJob = $null
$script:loadingOverlay = $null
$script:progressTimer = New-Object System.Windows.Forms.Timer
$script:progressTimer.Interval = 500 # Verifica o progresso 2 vezes por segundo

# --- Configuracao do Log ---
$logFile = Join-Path -Path (Split-Path $MyInvocation.MyCommand.Definition) -ChildPath "AZTools-Install-Log_$($script:hostname).txt"
try {
"--- Log de Execucao AZTools v2 - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') ---" | Out-File -FilePath $logFile -Encoding utf8 -Append} catch {
    [System.Windows.Forms.MessageBox]::Show("ERRO CRITICO: Nao foi possivel criar o arquivo de log em '$logFile'. Verifique as permissoes da pasta.", "Erro de Log", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit
}

$script:logJob = Start-Job -ScriptBlock {
    param($logQueue, $logFile, $stopSignal)
    while (-not $stopSignal.Value) {
        $message = $null
        if ($logQueue.TryDequeue([ref]$message)) {
            try { Add-Content -Path $logFile -Value $message -Encoding utf8 } catch {}
        } else {
            Start-Sleep -Milliseconds 100
        }
    }
} -ArgumentList $script:logQueue, $logFile, ([ref]$script:stopLogJob)


# #############################################################################
# ####### INICIO DE TODAS AS DEFINICOES DE FUNCOES #######
# #############################################################################

# --- Funcoes Auxiliares de UI ---
function Add-ListViewColumns {
    param(
        [System.Windows.Forms.ListView]$ListView,
        [string[]]$Columns
    )
    $ListView.Columns.Clear()
    foreach ($col in $Columns) {
        $ListView.Columns.Add($col, -2) | Out-Null
    }
}

function Create-TitledControlPanel {
    param(
        [System.Windows.Forms.Control]$ParentControl,
        [string]$Title,
        [System.Windows.Forms.Control]$Control,
        [string]$ExtraButtonText = "",
        [scriptblock]$ExtraButtonAction = $null
    )
    $group = New-Object System.Windows.Forms.GroupBox; $group.Text = $Title; $group.Dock = "Fill"
    
    $Control.Dock = "Fill"
    $Control.BorderStyle = [System.Windows.Forms.BorderStyle]::None
    
    $buttonPanel = New-Object System.Windows.Forms.Panel; $buttonPanel.Height = 30; $buttonPanel.Dock = "Bottom"
    $selectAllBtn = New-Object System.Windows.Forms.Button; $selectAllBtn.Text = "Marcar Todos"; $selectAllBtn.Dock = "Left"; $selectAllBtn.Width = 120
    $deselectAllBtn = New-Object System.Windows.Forms.Button; $deselectAllBtn.Text = "Desmarcar Todos"; $deselectAllBtn.Dock = "Left"; $deselectAllBtn.Width = 120
    
    $selectAllBtn.Add_Click({ 
        $targetControl = $this.Parent.Parent.Controls | Where-Object { $_ -isnot [System.Windows.Forms.Panel] }
        if ($targetControl) { Set-CheckedStateOnControl -Control $targetControl -State $true }
    })
    $deselectAllBtn.Add_Click({ 
        $targetControl = $this.Parent.Parent.Controls | Where-Object { $_ -isnot [System.Windows.Forms.Panel] }
        if ($targetControl) { Set-CheckedStateOnControl -Control $targetControl -State $false }
    })
    
    $buttonPanel.Controls.AddRange(@($deselectAllBtn, $selectAllBtn))

    if (-not [string]::IsNullOrWhiteSpace($ExtraButtonText) -and $ExtraButtonAction) {
        $extraBtn = New-Object System.Windows.Forms.Button
        $extraBtn.Text = $ExtraButtonText
        $extraBtn.Dock = "Right"
        $extraBtn.Width = 200
        $extraBtn.Add_Click($ExtraButtonAction)
        $buttonPanel.Controls.Add($extraBtn)
    }

    $group.Controls.AddRange(@($Control, $buttonPanel))
    $ParentControl.Controls.Add($group)
    
    return $Control
}

function Create-ListViewManagementPanel {
    param(
        [string]$Title,
        [string]$AnalyzeButtonText,
        [string]$CleanButtonText
    )
    $group = New-Object System.Windows.Forms.GroupBox; $group.Text = $Title; $group.Dock = "Fill"
    $listView = New-Object System.Windows.Forms.ListView; $listView.Dock = "Fill"; $listView.View = "Details"; $listView.CheckBoxes = $true
    
    $buttonPanel = New-Object System.Windows.Forms.Panel; $buttonPanel.Height = 30; $buttonPanel.Dock = "Bottom"
    $analyzeButton = New-Object System.Windows.Forms.Button; $analyzeButton.Text = $AnalyzeButtonText; $analyzeButton.Dock = "Left"; $analyzeButton.Width = 120
    $cleanButton = New-Object System.Windows.Forms.Button; $cleanButton.Text = $CleanButtonText; $cleanButton.Dock = "Right"; $cleanButton.Width = 150; $cleanButton.Enabled = $false
    
    $buttonPanel.Controls.AddRange(@($analyzeButton, $cleanButton))
    $group.Controls.AddRange(@($listView, $buttonPanel))
    
    return @{
        Group = $group
        Control = $listView
        AnalyzeButton = $analyzeButton
        CleanButton = $cleanButton
    }
}

function Create-TreeViewAnalysisPanel {
    param(
        [string]$Title,
        [string]$AnalyzeButtonText,
        [string]$CleanButtonText
    )
    $group = New-Object System.Windows.Forms.GroupBox; $group.Text = $Title; $group.Dock = "Fill"
    $treeView = New-Object System.Windows.Forms.TreeView; $treeView.Dock = "Fill"; $treeView.CheckBoxes = $true
    
    $summaryLabel = New-Object System.Windows.Forms.Label; $summaryLabel.Dock = "Bottom"; $summaryLabel.Text = "Total a ser limpo: 0 B"; $summaryLabel.TextAlign = "MiddleRight"
    
    $buttonPanel = New-Object System.Windows.Forms.Panel; $buttonPanel.Height = 30; $buttonPanel.Dock = "Bottom"
    $analyzeButton = New-Object System.Windows.Forms.Button; $analyzeButton.Text = $AnalyzeButtonText; $analyzeButton.Dock = "Left"; $analyzeButton.Width = 120
    $cleanButton = New-Object System.Windows.Forms.Button; $cleanButton.Text = $CleanButtonText; $cleanButton.Dock = "Right"; $cleanButton.Width = 150; $cleanButton.Enabled = $false
    
    $buttonPanel.Controls.AddRange(@($analyzeButton, $cleanButton))
    $group.Controls.AddRange(@($treeView, $summaryLabel, $buttonPanel))
    
    return @{
        Group = $group
        Control = $treeView
        AnalyzeButton = $analyzeButton
        CleanButton = $cleanButton
        SummaryLabel = $summaryLabel
    }
}

function Enable-FormDragging {
    param(
        [System.Windows.Forms.Control]$Control,
        [System.Windows.Forms.Form]$Form
    )
    $script:isMouseDown = $false
    $script:mouseOffset = $null

    $Control.add_MouseDown({
        param($sender, $e)
        if ($e.Button -eq 'Left') {
            $script:isMouseDown = $true
            $script:mouseOffset = $e.Location
        }
    })
    $Control.add_MouseMove({
        param($sender, $e)
        if ($script:isMouseDown) {
            $newLocation = New-Object System.Drawing.Point -ArgumentList @(
                ($Form.Location.X + $e.X - $script:mouseOffset.X),
                ($Form.Location.Y + $e.Y - $script:mouseOffset.Y)
            )
            $Form.Location = $newLocation
        }
    })
    $Control.add_MouseUp({
        $script:isMouseDown = $false
    })
}

function Apply-DarkTheme {
    param(
        [System.Windows.Forms.Control]$Control
    )
    $Control.BackColor = $script:themeColors.FormBackground
    $Control.ForeColor = $script:themeColors.Foreground

    if ($Control -is [System.Windows.Forms.Button]) {
        $Control.FlatStyle = 'Flat'
        $Control.BackColor = $script:themeColors.Accent
        $Control.ForeColor = $script:themeColors.ForegroundButton
        $Control.FlatAppearance.BorderColor = $script:themeColors.ControlBorder
        $Control.FlatAppearance.BorderSize = 1
    }
    elseif ($Control -is [System.Windows.Forms.TextBox]) {
        $Control.BackColor = $script:themeColors.ControlBackground
        $Control.ForeColor = $script:themeColors.Foreground
        $Control.BorderStyle = 'FixedSingle'
    }
    elseif ($Control -is [System.Windows.Forms.ListView]) {
        $Control.BackColor = $script:themeColors.ControlBackground
        $Control.ForeColor = $script:themeColors.Foreground
    }
    elseif ($Control -is [System.Windows.Forms.TreeView] -or $Control -is [System.Windows.Forms.CheckedListBox]) {
        $Control.BackColor = $script:themeColors.ControlBackground
        $Control.ForeColor = $script:themeColors.Foreground
        $Control.BorderStyle = 'FixedSingle'
    }
    elseif ($Control -is [System.Windows.Forms.GroupBox]) {
        $Control.ForeColor = $script:themeColors.Foreground
    }
    elseif ($Control -is [System.Windows.Forms.TabControl]) {
        foreach ($tabPage in $Control.TabPages) {
            Apply-DarkTheme -Control $tabPage
        }
    }

    if ($Control.Controls.Count -gt 0) {
        foreach ($childControl in $Control.Controls) {
            Apply-DarkTheme -Control $childControl
        }
    }
}

function Set-FormTitleBarColor {
    param(
        [System.Windows.Forms.Form]$Form,
        [System.Drawing.Color]$TitleBarBackgroundColor,
        [System.Drawing.Color]$TitleBarTextColor
    )
    try {
        $darkModeValue = 1
        [DwmApi]::DwmSetWindowAttribute($Form.Handle, 20, [ref]$darkModeValue, 4) | Out-Null
        $bgColorRef = ($TitleBarBackgroundColor.B -shl 16) + ($TitleBarBackgroundColor.G -shl 8) + $TitleBarBackgroundColor.R
        [DwmApi]::DwmSetWindowAttribute($Form.Handle, 35, [ref]$bgColorRef, 4) | Out-Null
        $fgColorRef = ($TitleBarTextColor.B -shl 16) + ($TitleBarTextColor.G -shl 8) + $TitleBarTextColor.R
        [DwmApi]::DwmSetWindowAttribute($Form.Handle, 36, [ref]$fgColorRef, 4) | Out-Null
    } catch {
        Update-Status "AVISO: Nao foi possivel definir a cor da barra de titulo."
    }
}

function Update-Status($message) {
    if ([string]::IsNullOrWhiteSpace($message)) { return }
    $logLine = "[$(Get-Date -Format 'HH:mm:ss')] $message"
    if ($form.IsHandleCreated) {
        $form.Invoke([Action]{
            if ($statusBox.Lines.Count > 500) {
                $statusBox.Select(0, $statusBox.GetFirstCharIndexFromLine(1))
                $statusBox.SelectedText = ""
            }
            $statusBox.AppendText("$logLine`r`n")
            $statusBox.ScrollToCaret()
        })
    }
    $script:logQueue.Enqueue($logLine)
}

function Run-Task($description, $action) {
    try {
        Update-Status ">> Iniciando: $description..."
        try {
            $result = & $action
            if ($result -is [string]) {
                $script:taskResults[$description] = $result.ToUpper()
                Update-Status "$($result.ToUpper()): $description."
            } else {
                $script:taskResults[$description] = "SUCESSO"
                Update-Status "OK: $description."
            }
        } catch {
            $script:taskResults[$description] = "FALHA"
            $errorMessage = "ERRO em '$description': $($_.Exception.Message.Trim())"
            Update-Status $errorMessage
            
            $errorDetails = "--- ERRO DETALHADO ---`n" + ($_ | Out-String) + "--- FIM DO ERRO ---`n"
            Update-Status $errorDetails
            throw
        }
    } finally {}
}

function Confirm-Action($message, $title = "Confirmacao") {
    $result = [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    return $result -eq [System.Windows.Forms.DialogResult]::Yes
}

function Stop-Process-AndWait {
    param([string]$processName, [int]$timeoutSeconds = 10)
    $allProcesses = Get-Process -Name $processName -ErrorAction SilentlyContinue
    if (-not $allProcesses) { return }
    Update-Status "... Tentando finalizar o(s) processo(s) '$processName'..."
    $allProcesses | Stop-Process -ErrorAction SilentlyContinue
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    while ($stopwatch.Elapsed.TotalSeconds -lt $timeoutSeconds) {
        if (-not (Get-Process -Name $processName -ErrorAction SilentlyContinue)) {
            $stopwatch.Stop()
            Update-Status "... Processo(s) '$processName' finalizado(s)."
            return
        }
        Start-Sleep -Seconds 1
    }
    Update-Status "AVISO: '$processName' nao finalizou a tempo. Forcando o encerramento..."
    Get-Process -Name $processName -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    if (Get-Process -Name $processName -ErrorAction SilentlyContinue) {
        Update-Status "ERRO CRITICO: Nao foi possivel finalizar '$processName' mesmo forcando."
    } else {
        Update-Status "... Processo(s) '$processName' forcado(s) a fechar com sucesso."
    }
}

function Test-NetConnectionSafe($hostname = "8.8.8.8") {
    if (-not (Test-Connection -ComputerName $hostname -Count 1 -Quiet)) {
        throw "Sem conexao com a internet ou o host '$hostname' nao esta alcancavel."
    }
}

function Download-File-Robust {
    param([string]$Url, [string]$OutFile)
    $webClient = New-Object System.Net.WebClient
    $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36")
    $webClient.DownloadFile($Url, $OutFile)
}

function Get-Image-List-From-Url {
    param([string]$Url)
    Update-Status "... Buscando lista de imagens em '$Url'..."
    try {
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 20
        $regex = '<a\s+(?:[^>]*?\s+)?href="([^"]*?\.(?:png|jpg|jpeg|bmp|gif))"'
        $matches = [regex]::Matches($response.Content, $regex, "IgnoreCase")
        if ($matches.Count -eq 0) {
            Update-Status "AVISO: Nenhuma imagem encontrada no diretorio '$Url'."
            return @()
        }
        $fileNames = $matches.ForEach({ ($_.Groups[1].Value | Split-Path -Leaf) }) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
        Update-Status "... Encontradas $($fileNames.Count) imagens."
        return $fileNames
    } catch {
        Update-Status "ERRO: Falha ao buscar a lista de imagens de '$Url'. Motivo: $($_.Exception.Message.Trim())"
        return @()
    }
}

function Get-DownloadsPath {
    $userShellFoldersPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    $downloadsGuid = "{374DE290-123F-4565-9164-39C4925E467B}"
    $path = (Get-ItemProperty -Path $userShellFoldersPath -Name $downloadsGuid -ErrorAction SilentlyContinue).$downloadsGuid
    if ($path) { return [System.Environment]::ExpandEnvironmentVariables($path) }
    return [System.IO.Path]::Combine([System.Environment]::GetFolderPath('UserProfile'), 'Downloads')
}

function Get-And-Convert-ShortcutIcon {
    param([string]$IconUrl, [string]$ShortcutName, [string]$IconCachePath)
    $tempIconPath = Join-Path $env:TEMP "$($ShortcutName -replace '[^a-zA-Z0-9]', '_')_temp_download"
    $finalIconPath = Join-Path $IconCachePath "$($ShortcutName -replace '[^a-zA-Z0-9]', '_').ico"
    try {
        Update-Status "... Baixando icone de '$IconUrl'."
        Download-File-Robust -Url $IconUrl -OutFile $tempIconPath
    } catch {
        Update-Status "AVISO: Falha ao baixar o icone de '$IconUrl'. Erro: $($_.Exception.Message.Trim())"
        return $null
    }
    try {
        $iconTest = New-Object System.Drawing.Icon($tempIconPath); [void]$iconTest.Dispose()
        Update-Status "... O icone baixado e um .ico valido."
        Move-Item -Path $tempIconPath -Destination $finalIconPath -Force | Out-Null
        return $finalIconPath
    } catch { Update-Status "... O arquivo baixado nao e um .ico. Tentando converter..." }
    try {
        Add-Type -AssemblyName System.Drawing
        $sourceImage = [System.Drawing.Image]::FromFile($tempIconPath)
        $newBitmap = New-Object System.Drawing.Bitmap($sourceImage, (New-Object System.Drawing.Size(32, 32))); [void]$sourceImage.Dispose()
        $iconHandle = $newBitmap.GetHicon(); $finalIcon = [System.Drawing.Icon]::FromHandle($iconHandle)
        $fileStream = New-Object System.IO.FileStream($finalIconPath, [System.IO.FileMode]::Create)
        [void]$finalIcon.Save($fileStream); [void]$fileStream.Close(); [void]$newBitmap.Dispose()
        Update-Status "... Conversao para .ico bem-sucedida."
        return $finalIconPath
    } catch {
        Update-Status "ERRO: Falha ao converter o arquivo de imagem para .ico. Detalhes: $($_.Exception.Message.Trim())"
        return $null
    } finally {
        if (Test-Path $tempIconPath) { Remove-Item $tempIconPath -Force }
    }
}

function Find-ExecutablePath {
    param ([string]$ExecutableName)
    $searchPaths = @(
        (Join-Path $env:ProgramFiles $ExecutableName),
        (Join-Path ${env:ProgramFiles(x86)} $ExecutableName),
        (Join-Path -Path (Join-Path $env:LOCALAPPDATA "Programs") -ChildPath $ExecutableName)
    )
    $recursiveSearchPaths = @( $env:ProgramFiles, ${env:ProgramFiles(x86)}, (Join-Path $env:LOCALAPPDATA "Programs") )
    foreach ($path in $recursiveSearchPaths) {
        if (Test-Path $path) {
            $found = Get-ChildItem -Path $path -Filter $ExecutableName -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($found) {
                Update-Status "... Executavel '$ExecutableName' encontrado em: $($found.FullName)"
                return $found.FullName
            }
        }
    }
    Update-Status "AVISO: Nao foi possivel encontrar o executavel '$ExecutableName' nas pastas padrao."
    return $null
}

function Ensure-ChocolateyIsInstalled {
    $chocoExe = "$env:ProgramData\chocolatey\bin\choco.exe"
    if (Test-Path $chocoExe) { return $true }
    $message = "O Chocolatey (gerenciador de pacotes) nao esta instalado, mas e necessario para esta tarefa.`n`nDeseja instala-lo agora automaticamente?"
    $title = "Chocolatey Nao Encontrado"
    if (Confirm-Action $message $title) {
        try {
            Install-Chocolatey
            if (Test-Path $chocoExe) {
                Update-Status "Chocolatey instalado com sucesso."; return $true
            } else { throw "A instalacao do Chocolatey parece ter falhado." }
        } catch { throw "ERRO CRITICO ao tentar instalar o Chocolatey: $($_.Exception.Message)" }
    } else { throw "Acao cancelada pelo usuario. O Chocolatey e necessario para continuar." }
    return $false
}

function Handle-Hostname {
    Run-Task "Validar/Alterar Nome da Maquina" {
        $currentHost = $script:hostname
        $newHost = [Microsoft.VisualBasic.Interaction]::InputBox("Valide ou altere o nome da maquina:", "Definir Hostname", $currentHost)
        if ($newHost -and $newHost -ne $currentHost) {
            Rename-Computer -NewName $newHost -Force
            $script:hostname = $newHost
            $script:rebootRequired = $true
            Update-Status "Hostname alterado para '$newHost'. Reinicializacao necessaria."
        } else { Update-Status "Hostname '$currentHost' mantido." }
    }
}

function Activate-Windows {
    Run-Task "Ativar o Windows" {
        $activationStatus = (Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%' and LicenseStatus=1").LicenseStatus
        if ($activationStatus -eq 1) {
            Update-Status "O Windows ja esta ativado."
            [System.Windows.Forms.MessageBox]::Show("O Windows ja se encontra ativado.", "Ativacao do Windows", "OK", "Information")
            return "SUCESSO"
        }
        $productKey = [Microsoft.VisualBasic.Interaction]::InputBox("O Windows nao esta ativado.`nPor favor, insira a chave do produto (Product Key):", "Ativacao do Windows")
        if ([string]::IsNullOrWhiteSpace($productKey)) {
            Update-Status "Nenhuma chave de produto inserida. Ativacao cancelada."
            return "CANCELADO"
        }
        Update-Status "... Instalando a chave de produto: $productKey"
        Start-Process "cscript.exe" -ArgumentList "//B //Nologo C:\Windows\System32\slmgr.vbs /ipk $productKey" -Wait
        Update-Status "... Tentando ativar o Windows online..."
        Start-Process "cscript.exe" -ArgumentList "//B //Nologo C:\Windows\System32\slmgr.vbs /ato" -Wait
        Update-Status "Processo de ativacao finalizado. Verifique o status da ativacao nas configuracoes do Windows."
    }
}

function Install-Chocolatey {
    Run-Task "Instalar Gerenciador de Pacotes Chocolatey" {
        $chocoExe = "$env:ProgramData\chocolatey\bin\choco.exe"
        if (-not (Test-Path $chocoExe)) {
            Update-Status "... Instalando Chocolatey. Isso pode levar alguns minutos."
            Test-NetConnectionSafe; Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            & "$env:ProgramData\chocolatey\bin\refreshenv.cmd"
        } else { Update-Status "... Chocolatey ja esta instalado." }
    }
}

function Install-VCRedist {
    Run-Task "Instalar Microsoft Visual C++ Runtimes" {
        Ensure-ChocolateyIsInstalled | Out-Null
        Update-Status "... Usando Chocolatey para instalar/atualizar os runtimes do Visual C++..."
        & "$env:ProgramData\chocolatey\bin\choco.exe" upgrade vcredist140 -y
    }
}

function Install-DotNetFX {
    Run-Task "Instalar .NET Framework" {
        Ensure-ChocolateyIsInstalled | Out-Null
        Update-Status "... Usando Chocolatey para instalar/atualizar o .NET Framework..."
        & "$env:ProgramData\chocolatey\bin\choco.exe" upgrade dotnetfx -y
    }
}

function Configure-System-ThemeAndTaskbar {
    Run-Task "Configurar Tema e Barra de Tarefas" {
        Update-Status "... Aplicando tema escuro."
        Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "AppsUseLightTheme" 0 -Force
        Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "SystemUsesLightTheme" 0 -Force
        Update-Status "... Limpando icones da Barra de Tarefas."
        $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Set-ItemProperty -Path $regPath -Name "SearchboxTaskbarMode" -Value 1 -Force
        Set-ItemProperty -Path $regPath -Name "ShowTaskViewButton" -Value 0 -Force
        Stop-Process-AndWait -processName "explorer"
    }
}

function Configure-System-Wallpaper { 
    Run-Task "Configurar Wallpaper do Windows (com Selecao)" { 
        Test-NetConnectionSafe
        $imageLinks = Get-Image-List-From-Url -Url $script:config.WallpapersUrl
        if ($imageLinks.Count -eq 0) { throw "Nenhum wallpaper foi encontrado." }
        $tempThumbDir = Join-Path $env:TEMP "WallpaperThumbs_$(Get-Random)"; New-Item -Path $tempThumbDir -ItemType Directory -Force | Out-Null
        $selectionForm = New-Object System.Windows.Forms.Form; $selectionForm.Text = "Selecione o Wallpaper Padrao"; $selectionForm.Size = New-Object System.Drawing.Size(640, 520); $selectionForm.StartPosition = "CenterParent"
        $flowLayoutPanel = New-Object System.Windows.Forms.FlowLayoutPanel; $flowLayoutPanel.Dock = "Fill"; $flowLayoutPanel.AutoScroll = $true
        $okButton = New-Object System.Windows.Forms.Button; $okButton.Text = "Aplicar Wallpaper Selecionado"; $okButton.Dock = "Bottom"
        $radioButtons = @()
        foreach ($imageFile in $imageLinks) { 
            if ([string]::IsNullOrWhiteSpace($imageFile)) { continue }
            $encodedImageFile = [System.Web.HttpUtility]::UrlPathEncode($imageFile); $imageUrl = "$($script:config.WallpapersUrl.TrimEnd('/'))/$encodedImageFile"; $thumbPath = Join-Path $tempThumbDir $imageFile
            try { Download-File-Robust -Url $imageUrl -OutFile $thumbPath } catch { continue }
            $groupBox = New-Object System.Windows.Forms.GroupBox; $groupBox.Size = New-Object System.Drawing.Size(180, 140)
            $pictureBox = New-Object System.Windows.Forms.PictureBox; $pictureBox.Dock = "Fill"; $pictureBox.SizeMode = "Zoom"
            $imageBytes = [System.IO.File]::ReadAllBytes($thumbPath); $memoryStream = New-Object System.IO.MemoryStream(,$imageBytes); $pictureBox.Image = [System.Drawing.Image]::FromStream($memoryStream)
            $decodedImageFile = [System.Web.HttpUtility]::UrlDecode($imageFile)
            $friendlyName = ($decodedImageFile -replace '\.(png|jpg|jpeg|bmp|gif)$', '') -replace '[-_]', ' '
            $radioButton = New-Object System.Windows.Forms.RadioButton; $radioButton.Text = $friendlyName; $radioButton.Dock = "Bottom"; $radioButton.Tag = $imageFile
            $radioButtons += $radioButton; $groupBox.Controls.AddRange(@($pictureBox, $radioButton)); $flowLayoutPanel.Controls.Add($groupBox) 
        }
        if ($radioButtons.Count > 0) { $radioButtons[0].Checked = $true }
        $okButton.Add_Click({ $selectionForm.DialogResult = [System.Windows.Forms.DialogResult]::OK; $selectionForm.Close() }); $selectionForm.Controls.AddRange(@($flowLayoutPanel, $okButton)); $result = $selectionForm.ShowDialog(); $selectionForm.Dispose()
        if ($result -ne [System.Windows.Forms.DialogResult]::OK) { Remove-Item -Path $tempThumbDir -Recurse -Force; return "CANCELADO" }
        $selectedImage = $null; foreach ($radioButton in $radioButtons) { if ($radioButton.Checked) { $selectedImage = $radioButton.Tag; break } }
        if (-not $selectedImage) { Remove-Item -Path $tempThumbDir -Recurse -Force; return "CANCELADO" }
        Remove-Item -Path $tempThumbDir -Recurse -Force
        $encodedImageFile = [System.Web.HttpUtility]::UrlPathEncode($selectedImage); $imageUrl = "$($script:config.WallpapersUrl.TrimEnd('/'))/$encodedImageFile"; $wallpaperPath = Join-Path $env:TEMP $selectedImage; Download-File-Robust -Url $imageUrl -OutFile $wallpaperPath
        [Wallpaper]::SystemParametersInfo(20, 0, $wallpaperPath, 3) | Out-Null
    }
}

function Configure-Teams-Backgrounds { 
    Run-Task "Instalar Fundos do Microsoft Teams" {
        Test-NetConnectionSafe
        Stop-Process-AndWait -processName "msteams"; Stop-Process-AndWait -processName "ms-teams"
        $imageLinks = Get-Image-List-From-Url -Url $script:config.TeamsBackgroundsUrl
        if ($imageLinks.Count -eq 0) { throw "Nenhuma imagem de fundo para o Teams foi encontrada." }
        $tempThumbDir = Join-Path $env:TEMP "TeamsThumbs_$(Get-Random)"; New-Item -Path $tempThumbDir -ItemType Directory -Force | Out-Null
        $installForm = New-Object System.Windows.Forms.Form; $installForm.Text = "Selecione os Fundos de Tela para Instalar"; $installForm.Size = New-Object System.Drawing.Size(640, 520); $installForm.StartPosition = "CenterParent"
        $flowInstall = New-Object System.Windows.Forms.FlowLayoutPanel; $flowInstall.Dock = "Fill"; $flowInstall.AutoScroll = $true
        $panelButtons = New-Object System.Windows.Forms.Panel; $panelButtons.Height = 30; $panelButtons.Dock = "Bottom"
        $installButton = New-Object System.Windows.Forms.Button; $installButton.Text = "Instalar Selecionados"; $installButton.Dock = "Fill"
        $selectAllButton = New-Object System.Windows.Forms.Button; $selectAllButton.Text = "Marcar Todos"; $selectAllButton.Dock = "Left"
        $panelButtons.Controls.AddRange(@($selectAllButton, $installButton))
        $allCheckBoxes = @()
        foreach ($imageFile in $imageLinks) {
            if ([string]::IsNullOrWhiteSpace($imageFile)) { continue }
            $encodedImageFileForUrl = [System.Web.HttpUtility]::UrlPathEncode($imageFile); $imageUrl = "$($script:config.TeamsBackgroundsUrl.TrimEnd('/'))/$encodedImageFileForUrl"; $thumbPath = Join-Path $tempThumbDir $imageFile
            try { Download-File-Robust -Url $imageUrl -OutFile $thumbPath } catch { continue }
            $groupBox = New-Object System.Windows.Forms.GroupBox; $groupBox.Size = New-Object System.Drawing.Size(180, 140)
            $pictureBox = New-Object System.Windows.Forms.PictureBox; $pictureBox.Dock = "Fill"; $pictureBox.SizeMode = "Zoom"
            $imageBytes = [System.IO.File]::ReadAllBytes($thumbPath); $memoryStream = New-Object System.IO.MemoryStream(,$imageBytes); $pictureBox.Image = [System.Drawing.Image]::FromStream($memoryStream)
            $decodedImageFile = [System.Web.HttpUtility]::UrlDecode($imageFile)
            $friendlyName = ($decodedImageFile -replace '\.(png|jpg|jpeg|bmp|gif)$', '') -replace '[-_]', ' '
            $checkBox = New-Object System.Windows.Forms.CheckBox; $checkBox.Text = $friendlyName; $checkBox.Dock = "Bottom"; $checkBox.Tag = $imageFile
            $allCheckBoxes += $checkBox; $groupBox.Controls.AddRange(@($pictureBox, $checkBox)); $flowInstall.Controls.Add($groupBox)
        }
        $selectAllButton.Add_Click({ $allCheckBoxes.ForEach({$_.Checked = $true}) }); $installButton.Add_Click({ $installForm.DialogResult = [System.Windows.Forms.DialogResult]::OK; $installForm.Close() }); $installForm.Controls.AddRange(@($flowInstall, $panelButtons))
        if ($installForm.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) { Remove-Item -Path $tempThumbDir -Recurse -Force; return "CANCELADO" }
        $selectedImagesToInstall = $allCheckBoxes | Where-Object { $_.Checked } | ForEach-Object { $_.Tag }; $installForm.Dispose()
        if ($selectedImagesToInstall.Count -eq 0) { Remove-Item -Path $tempThumbDir -Recurse -Force; return "CANCELADO" }
        $classicTeamsBgPath = Join-Path $env:APPDATA "Microsoft\Teams\Backgrounds\Uploads"; $newTeamsPackage = Get-AppxPackage -Name "MSTeams" | Select-Object -First 1; $newTeamsBgPath = if ($newTeamsPackage) { Join-Path $env:LOCALAPPDATA "Packages\$($newTeamsPackage.PackageFamilyName)\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads" } else { $null }
        New-Item -Path $classicTeamsBgPath -ItemType Directory -Force | Out-Null; if ($newTeamsBgPath) { New-Item -Path $newTeamsBgPath -ItemType Directory -Force | Out-Null }
        Update-Status "Instalando $($selectedImagesToInstall.Count) imagens de fundo..."; foreach ($imageFile in $selectedImagesToInstall) { $sourcePath = Join-Path $tempThumbDir $imageFile; if (-not (Test-Path $sourcePath)) { continue }; try { if (Test-Path $classicTeamsBgPath) { Copy-Item -Path $sourcePath -Destination (Join-Path $classicTeamsBgPath $imageFile) -Force; Update-Status "--> '$imageFile' instalado para Teams Classico." }; if ($newTeamsBgPath -and (Test-Path $newTeamsBgPath)) { Copy-Item -Path $sourcePath -Destination (Join-Path $newTeamsBgPath $imageFile) -Force; Update-Status "--> '$imageFile' instalado para Novo Teams." } } catch { Update-Status "ERRO: Falha ao copiar '$imageFile'. Motivo: $($_.Exception.Message.Trim())" } }
        Update-Status "Instalacao concluida. Reinicie o Microsoft Teams."; $script:rebootRequired = $true; Remove-Item -Path $tempThumbDir -Recurse -Force
    }
}

function Force-WindowsUpdates {
    Run-Task "Forcar Todas as Atualizacoes do Windows" {
        Update-Status "Instalando 'PSWindowsUpdate'..."
        if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
            Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Confirm:$false
            Install-Module PSWindowsUpdate -Force -Confirm:$false -Scope AllUsers
        }
        Import-Module PSWindowsUpdate -Force
        Update-Status "Buscando e instalando TODAS as atualizacoes..."
        Get-WindowsUpdate -Install -AcceptAll -ForceDownload -Verbose
        $script:rebootRequired = $true
    }
}

function Create-SingleWebShortcut {
    param(
        [string]$ShortcutName
    )
    Run-Task "Criar Atalho: $ShortcutName" {
        $sInfo = $script:config.WebShortcuts | Where-Object { $_.Name -eq $ShortcutName }
        if (-not $sInfo) { throw "Configuracao para o atalho '$ShortcutName' nao encontrada." }
        $edgePaths = @((Join-Path ${env:ProgramFiles} "Microsoft\Edge\Application\msedge.exe"), (Join-Path ${env:ProgramFiles(x86)} "Microsoft\Edge\Application\msedge.exe"))
        $edgePath = $edgePaths | Where-Object { Test-Path $_ } | Select-Object -First 1
        if (-not $edgePath) { throw "Microsoft Edge nao encontrado." }
        $desktopPath = [System.Environment]::GetFolderPath('Desktop'); $iconCachePath = Join-Path $env:LOCALAPPDATA "AZCorp\Icons"
        if (-not (Test-Path $iconCachePath)) { New-Item -Path $iconCachePath -ItemType Directory -Force | Out-Null }
        $shell = New-Object -ComObject WScript.Shell; $sUrl = $sInfo.Url; $sPath = Join-Path $desktopPath "$($sInfo.Name).lnk"
        $s = $shell.CreateShortcut($sPath); $s.TargetPath = $edgePath; $s.Arguments = "--app=$sUrl"; $s.IconLocation = "$edgePath,0"; [void]$s.Save()
        $iconUrl = $null; $uri = [System.Uri]$sUrl; $webClient = New-Object System.Net.WebClient; $webClient.Headers.Add("User-Agent", "Mozilla/5.0")
        try {
            $rootFaviconUrl = "$($uri.Scheme)://$($uri.Host)/favicon.ico"; $webClient.DownloadData($rootFaviconUrl); $iconUrl = $rootFaviconUrl
        } catch {
            $ddgUrl = "https://icons.duckduckgo.com/ip3/$($uri.Host).ico"; try { $webClient.DownloadData($ddgUrl); $iconUrl = $ddgUrl } catch {}
        }
        if ($iconUrl) {
             $iconDestPath = Get-And-Convert-ShortcutIcon -IconUrl $iconUrl -ShortcutName $sInfo.Name -IconCachePath $iconCachePath
            if ($iconDestPath -is [string] -and (Test-Path $iconDestPath)) {
                $s = $shell.CreateShortcut($sPath); $s.IconLocation = $iconDestPath; [void]$s.Save()
            }
        }
    }
}

function Install-App($appInfo) {
    Run-Task "Instalar $($appInfo.Name)" {
        Ensure-ChocolateyIsInstalled | Out-Null; Test-NetConnectionSafe
        & "$env:ProgramData\chocolatey\bin\choco.exe" install $appInfo.ChocoPackage -y
        if ($appInfo.Executable) {
            Start-Sleep -Seconds 5; $exePath = Find-ExecutablePath -ExecutableName $appInfo.Executable
            if ($exePath) { Start-Process $exePath }
        }
    }
}

function Install-Softphone {
    Run-Task "Instalar Softphone" {
        Test-NetConnectionSafe; $softphone = $script:config.Softphone; $installerPath = Join-Path $env:TEMP "softphone_installer.exe"
        Download-File-Robust -Url $softphone.InstallerUrl -OutFile $installerPath
        if ($softphone.InstallerHash -and $softphone.InstallerHash -ne "COLOQUE_O_HASH_SHA256_DO_INSTALADOR_AQUI") {
            $fileHash = (Get-FileHash $installerPath -Algorithm SHA256).Hash.ToUpper()
            if ($fileHash -ne $softphone.InstallerHash.ToUpper()) { throw "Falha na verificacao de checksum!" }
        }
        Start-Process $installerPath -ArgumentList "/S" -Wait
        if ($softphone.Executable) {
            Start-Sleep -Seconds 3; $exePath = Find-ExecutablePath -ExecutableName $softphone.Executable
            if ($exePath) { Start-Process -FilePath $exePath }
        }
    }
}

function Install-OneDrive {
    Run-Task "Instalar OneDrive" {
        if (Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue) { return "CANCELADO" }
        Test-NetConnectionSafe; $installerPath = Join-Path $env:TEMP "OneDriveSetup.exe"; Download-File-Robust -Url $script:config.OneDriveUrl -OutFile $installerPath
        Start-Process -FilePath $installerPath -Wait; Start-Process "$env:LOCALAPPDATA\Microsoft\OneDrive\OneDrive.exe" -ErrorAction SilentlyContinue
    }
}

function Validate-And-Repair-OneDrive {
    Run-Task "Manutencao OneDrive (Limpeza e Reinstalacao)" {
        function Test-OD { (Get-Process -Name "OneDrive" -EA SilentlyContinue) -and (Get-ChildItem -Path $env:USERPROFILE -Directory -Filter "OneDrive*" -EA SilentlyContinue) }
        function Wait-OD($t) { $sw = [System.Diagnostics.Stopwatch]::StartNew(); while ($sw.Elapsed.TotalSeconds -lt $t) { if (Test-OD) { $sw.Stop(); return $true }; Start-Sleep -Seconds 10 }; $sw.Stop(); return $false }
        function Find-OD($t=30) { $paths = @("$env:LOCALAPPDATA\Microsoft\OneDrive", "$env:ProgramFiles\Microsoft OneDrive", "$env:ProgramFiles(x86)\Microsoft OneDrive"); $sw = [System.Diagnostics.Stopwatch]::StartNew(); while ($sw.Elapsed.TotalSeconds -lt $t) { $exe = Get-ChildItem -Path $paths -Filter "OneDrive.exe" -Recurse -EA SilentlyContinue | Select -First 1; if ($exe) { $sw.Stop(); return $exe.FullName }; Start-Sleep -Seconds 5 }; $sw.Stop(); return $null }
        function Clean-OD { try { "OneDrive", "WINWORD", "EXCEL", "POWERPNT", "explorer" | % { Stop-Process-AndWait -processName $_ }; Get-ScheduledTask | ? { $_.TaskPath -like "\OneDrive*" } | % { Unregister-ScheduledTask -TaskName $_.TaskName -Confirm:$false -EA SilentlyContinue }; $regPaths = "HKCU:\Software\Microsoft\OneDrive", "HKLM:\SOFTWARE\Microsoft\OneDrive", "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive"; $regPaths | ? { Test-Path $_ } | % { Remove-Item $_ -Recurse -Force -EA SilentlyContinue }; $runKeys = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run", "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; foreach ($k in $runKeys) { if (Test-Path $k) { $key = Get-Item -Path $k; ($key.GetValueNames()) | % { if (($key.GetValue($_)) -is [string] -and ($key.GetValue($_)) -like "*OneDrive*") { Remove-ItemProperty -Path $k -Name $_ -Force -EA SilentlyContinue } } } }; $filePaths = "$env:LOCALAPPDATA\Microsoft\OneDrive", "$env:PROGRAMDATA\Microsoft OneDrive", "$env:APPDATA\Microsoft\OneDrive", "$env:ProgramFiles\Microsoft OneDrive", "$env:ProgramFiles(x86)\Microsoft OneDrive"; $filePaths | ? { Test-Path $_ } | % { Remove-Item $_ -Recurse -Force -EA SilentlyContinue }; Get-ChildItem -Path $env:USERPROFILE -Directory -Filter "OneDrive*" -EA SilentlyContinue | % { $bak = "$($_.Name)_BAK_$(Get-Date -f 'yyyyMMddHHmmss')"; try { Move-Item $_.FullName -Destination (Join-Path $env:USERPROFILE $bak) -Force -EA Stop } catch {} } } finally { if (-not (Get-Process -Name "explorer" -EA SilentlyContinue)) { Start-Process "explorer.exe" } } }
        if (Test-OD) { if (-not (Confirm-Action "O OneDrive parece estar funcional. Deseja mesmo assim executar a limpeza completa e reinstalar?")) { return "CANCELADO" } }
        Clean-OD; Start-Sleep -s 5; Test-NetConnectionSafe; $installerPath = Join-Path $env:TEMP "OneDriveSetup.exe"; Download-File-Robust -Url $script:config.OneDriveUrl -OutFile $installerPath; Start-Process -FilePath $installerPath -Wait
        $exePath = Find-OD; if (-not $exePath) { throw "OneDrive.exe nao foi encontrado." }; Start-Process -FilePath $exePath
        if (-not (Wait-OD -t 120)) { $err = "Falha na validacao pos-instalacao."; if (-not (Get-Process -Name "OneDrive" -EA SilentlyContinue)) { $err += " Processo nao ativo." }; if (-not (Get-ChildItem -Path $env:USERPROFILE -Directory -Filter "OneDrive*" -EA SilentlyContinue)) { $err += " Pasta nao criada." }; throw $err }
    }
}

function Disable-Telemetry { Run-Task "Desativar Telemetria" { if (-not (Confirm-Action "Isso desativara a coleta de dados de telemetria. Deseja continuar?")) { return "CANCELADO" }; Stop-Service DiagTrack -EA SilentlyContinue; Set-Service DiagTrack -StartupType Disabled; $p = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"; if (-not (Test-Path $p)) { New-Item -Path $p -Force | Out-Null }; Set-ItemProperty -Path $p -Name "AllowTelemetry" -Value 0 -Type DWord -Force } }
function Adjust-For-Performance { Run-Task "Ajustar para Melhor Desempenho" { if (-not (Confirm-Action "Isso desativara efeitos visuais. Deseja continuar?")) { return "CANCELADO" }; $p1 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"; Set-ItemProperty -Path $p1 -Name "VisualFXSetting" -Value 2 -Type DWord -Force; $p2 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Set-ItemProperty -Path $p2 -Name "TaskbarAnimations" -Value 0 -Type DWord -Force; Set-ItemProperty -Path $p2 -Name "ListviewAlphaSelect" -Value 0 -Type DWord -Force } }
function Clean-Prefetch { Run-Task "Limpar Prefetch do Windows" { if (-not (Confirm-Action "Isso removera os arquivos de prefetch. Deseja continuar?")) { return "CANCELADO" }; $p = "$env:windir\Prefetch"; if (Test-Path $p) { if (Get-ChildItem -Path $p -File) { Remove-Item -Path "$p\*" -Force -Recurse -EA SilentlyContinue } } } }
function Empty-RecycleBin { Run-Task "Esvaziar Lixeira" { if (-not (Confirm-Action "ATENCAO: TODOS os arquivos da Lixeira serao apagados permanentemente. Deseja continuar?")) { return "CANCELADO" }; Clear-RecycleBin -Force -EA SilentlyContinue } }
function Disk-Cleanup { Run-Task "Executar Limpeza de Disco Avancada" { if (-not (Confirm-Action "Isso executara a Limpeza de Disco. Pode demorar. Deseja continuar?")) { return "CANCELADO" }; $p = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"; Get-ChildItem -Path $p | % { Set-ItemProperty -Path $_.PSPath -Name "StateFlags0001" -Value 2 -Type DWord -Force -EA SilentlyContinue }; Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait } }
function Clean-TempFiles { Run-Task "Limpar Arquivos Temporarios de Instalacao" { if (-not (Confirm-Action "Isso removera os instaladores baixados. Deseja continuar?")) { return "CANCELADO" }; $files = @((Join-Path $env:TEMP "wallpaper.png"), (Join-Path $env:TEMP "softphone.exe"), (Join-Path $env:TEMP "OneDriveSetup.exe")); $files | % { if (Test-Path $_) { Remove-Item -Path $_ -Force -EA SilentlyContinue } } } }
function Install-TrendMicroAgent { param([string]$SubscriptionType, [string]$ActivationUrl) Run-Task "Instalar Trend Micro ($SubscriptionType)" { Start-Process $ActivationUrl; $msg = "A pagina de download do Trend Micro foi aberta.`n`n1. Baixe o instalador (.msi) para a pasta de 'Downloads'.`n2. Aguarde o download ser concluido.`n3. Clique em 'OK' para continuar."; [System.Windows.Forms.MessageBox]::Show($msg, "Acao Manual Necessaria", "OK", "Information"); $dlPath = Get-DownloadsPath; $installer = Get-ChildItem -Path $dlPath -Filter "*.msi" | Sort-Object LastWriteTime -Descending | Select -First 1; if (-not $installer) { throw "Nenhum .msi foi encontrado." }; if (-not (Confirm-Action "Executar:`n$($installer.FullName)`n`nDeseja continuar?")) { throw "Cancelado." }; Start-Process msiexec.exe -ArgumentList "/i `"$($installer.FullName)`" /qn" -Wait } }
function Get-InstalledApps { $apps = @{}; $paths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"); foreach ($p in $paths) { Get-ChildItem -Path $p -EA SilentlyContinue | % { $name = $_.GetValue("DisplayName"); if ($name -and -not $apps.ContainsKey($name) -and $_.GetValue("SystemComponent") -ne 1) { $apps[$name] = $_ } } }; return $apps.Keys | Sort-Object }
function Get-DirectorySize-Formatted { param($InputObject); $totalSize = 0; if ($InputObject -is [string] -or $InputObject -is [System.Management.Automation.PathInfo]) { try { $Path = [string]$InputObject; if (-not (Test-Path -LiteralPath $Path)) { return @{ Bytes = 0; Formatted = "0 B" } }; $item = Get-Item -LiteralPath $Path -EA Stop; if ($item.PSIsContainer) { $stack = [System.Collections.Stack]::new(); $stack.Push($item.FullName); while ($stack.Count -gt 0) { $currentPath = $stack.Pop(); try { $files = [System.IO.Directory]::GetFiles($currentPath); $dirs = [System.IO.Directory]::GetDirectories($currentPath); foreach ($file in $files) { try { $fileInfo = New-Object System.IO.FileInfo($file); $totalSize += $fileInfo.Length } catch {} }; foreach ($dir in $dirs) { $stack.Push($dir) } } catch {} } } else { $totalSize = $item.Length } } catch { $totalSize = 0 } } else { $totalSize = $InputObject }; $sizeInBytes = [long]$totalSize; if ($sizeInBytes -ge 1GB) { return @{ Bytes = $sizeInBytes; Formatted = "{0:N2} GB" -f ($sizeInBytes / 1GB) } } elseif ($sizeInBytes -ge 1MB) { return @{ Bytes = $sizeInBytes; Formatted = "{0:N2} MB" -f ($sizeInBytes / 1MB) } } elseif ($sizeInBytes -ge 1KB) { return @{ Bytes = $sizeInBytes; Formatted = "{0:N2} KB" -f ($sizeInBytes / 1KB) } } else { return @{ Bytes = $sizeInBytes; Formatted = "$sizeInBytes B" } } }
function Analyze-CleanableFiles { $filesPanel.AnalyzeButton.Enabled = $false; $filesPanel.CleanButton.Enabled = $false; $filesPanel.Control.Nodes.Clear(); Run-Task "analise de Arquivos para Limpeza" { $filesPanel.Control.BeginUpdate(); $foundItems = [System.Collections.Generic.List[object]]::new(); try { $sysOpts = [ordered]@{ "Esvaziar Lixeira" = @{ T = "Action"; A = { Clear-RecycleBin -Force -EA SilentlyContinue }; GS = { try { return ((New-Object -ComObject Shell.Application).NameSpace(0x0a).Items() | Measure-Object -Property Size -Sum -EA Stop).Sum } catch { return 0 } } }; "Arquivos Temporarios" = @{ T = "FolderContent"; P = @("$env:TEMP", "$env:windir\Temp") }; "Area de Transferencia" = @{ T = "Action"; A = { Set-Clipboard -Value $null }; GS = { return 0 } }; "Despejos de Memória" = @{ T = "File"; P = @("$env:windir\Minidump\*.*", "$env:windir\MEMORY.DMP") }; "Relatorios do Windows" = @{ T = "FolderContent"; P = @("$env:ProgramData\Microsoft\Windows\WER\ReportArchive", "$env:ProgramData\Microsoft\Windows\WER\ReportQueue", "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportArchive", "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportQueue") }; "Cache DNS" = @{ T = "Action"; A = { ipconfig /flushdns }; GS = { return 0 } }; "Cache de Otimizacao de Entrega" = @{ T = "FolderContent"; P = @("$env:windir\SoftwareDistribution\DeliveryOptimization"); Pre = { Stop-Service DoSvc -Force -EA SilentlyContinue }; Post = { Start-Service DoSvc -EA SilentlyContinue } } }; foreach ($opt in $sysOpts.GetEnumerator()) { $name = $opt.Name; $details = $opt.Value; $size = 0; if ($details.ContainsKey("GS")) { $size = try { & $details.GS } catch { 0 } } elseif ($details.P) { foreach ($p in $details.P) { $rPaths = try { $ExecutionContext.InvokeCommand.ExpandString($p) | % { Resolve-Path -Path $_ -EA SilentlyContinue } } catch { $null }; foreach ($path in $rPaths) { if (Test-Path -LiteralPath $path) { $pSize = Get-DirectorySize-Formatted $path; if ($pSize.Bytes -gt 0) { $size += $pSize.Bytes } } } } }; if ($size -gt 0 -or $details.T -eq "Action") { $details.Size = $size; $foundItems.Add(@{ G = "Sistema"; IN = $name; D = $details }) } }; $installed = Get-InstalledApps; $installed += "Windows Defender"; $db = $script:config.CacheDatabase; foreach ($app in $installed) { foreach ($dbEntry in $db.GetEnumerator()) { if ($app -like $dbEntry.Name) { $procs = if ($dbEntry.Value.ContainsKey("Processes")) { $dbEntry.Value.Processes } else { @() }; foreach ($cacheType in $dbEntry.Value.GetEnumerator()) { if ($cacheType.Name -eq "Processes") { continue }; $details = $cacheType.Value; $cSize = 0; $paths = $details.Path | % { try { $ExecutionContext.InvokeCommand.ExpandString($_) | Resolve-Path -EA SilentlyContinue } catch { $null } } | ? { $_ -and (Test-Path -LiteralPath $_) }; if ($paths.Count -gt 0) { $paths | % { $pSize = Get-DirectorySize-Formatted $_; if ($pSize.Bytes -gt 0) { $cSize += $pSize.Bytes } } }; if ($cSize -gt 0) { $details.Size = $cSize; $foundItems.Add(@{ G = $app; IN = $cacheType.Name; D = $details; P = $procs }) } } } } }; if ($foundItems.Count -eq 0) { Update-Status "Nenhum arquivo para limpeza foi encontrado." } else { $grouped = $foundItems | Group-Object -Property G; foreach ($group in $grouped) { $pNode = New-Object System.Windows.Forms.TreeNode($group.Name); if ($group.Group[0].P) { $pNode.Tag = $group.Group[0].P }; foreach ($item in $group.Group) { $fSize = (Get-DirectorySize-Formatted $item.D.Size).Formatted; $cNode = New-Object System.Windows.Forms.TreeNode("$($item.IN) ($fSize)"); $cNode.Tag = $item.D; $pNode.Nodes.Add($cNode) | Out-Null }; $filesPanel.Control.Nodes.Add($pNode) | Out-Null }; $filesPanel.CleanButton.Enabled = $true; $filesPanel.Control.ExpandAll(); $filesPanel.Control.Nodes | % { $_.Checked = $true; $_.Nodes | % { $_.Checked = $true } } } } catch { Update-Status "ERRO durante a analise: $($_.Exception.Message)" } finally { $filesPanel.Control.EndUpdate() } }; $filesPanel.AnalyzeButton.Enabled = $true }

function Clean-SelectedFiles {
    $filesPanel.AnalyzeButton.Enabled = $false
    $filesPanel.CleanButton.Enabled = $false
    $treeView = $filesPanel.Control

    function Get-CheckedChildNodes($nodeCollection) {
        foreach ($node in $nodeCollection) {
            if ($node.Nodes.Count -gt 0) {
                Get-CheckedChildNodes($node.Nodes)
            }
            elseif ($node.Checked) {
                $node
            }
        }
    }
    $nodesToClean = @(Get-CheckedChildNodes($treeView.Nodes))

    if ($nodesToClean.Count -eq 0) { 
        Update-Status "Nenhum item selecionado para limpeza."
        $filesPanel.AnalyzeButton.Enabled = $true
        return 
    }
    if (-not (Confirm-Action "Os dados de $($nodesToClean.Count) itens serao apagados permanentemente. Deseja continuar?")) { 
        Update-Status "Limpeza cancelada."
        $filesPanel.AnalyzeButton.Enabled = $true
        $filesPanel.CleanButton.Enabled = $true
        return 
    }
    
    $processesToClose = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $nodesToClean | ForEach-Object {
        if ($_.Parent -and $_.Parent.Tag -is [array]) {
            $_.Parent.Tag | ForEach-Object { $processesToClose.Add($_) | Out-Null }
        }
    }

    if ($processesToClose.Count -gt 0) {
        $processList = [string]::Join(", ", $processesToClose)
        $message = "Os seguintes aplicativos estao em execucao e precisam ser fechados para a limpeza:`n`n$processList`n`nDeseja fecha-los agora para continuar?"
        if (Confirm-Action $message "Aplicativos Abertos Detectados") {
            $processesToClose | ForEach-Object { Stop-Process-AndWait -processName $_ }
        } else {
            Update-Status "Limpeza cancelada pelo usuario devido a aplicativos abertos."
            $filesPanel.AnalyzeButton.Enabled = $true; $filesPanel.CleanButton.Enabled = $true; return
        }
    }
    
    Run-Task "Limpeza de Arquivos Selecionados" {
        foreach ($node in $nodesToClean) {
            $details = $node.Tag
            $parentName = if ($node.Parent) { $node.Parent.Text } else { "Sistema" }
            $itemName = $node.Text.Split('(')[0].Trim()
            Update-Status "Limpando: $parentName - $itemName"
            
            try {
                if ($details.PreAction) { Update-Status "... Executando pre-acao."; & $details.PreAction }

                switch ($details.Type) {
                    "File" {
                        $details.Path | ForEach-Object {
                            $expandedPath = $ExecutionContext.InvokeCommand.ExpandString($_)
                            if (Test-Path $expandedPath) {
                                Remove-Item -Path $expandedPath -Force -ErrorAction SilentlyContinue
                            }
                        }
                    }
                    "FolderContent" {
                         $details.Path | ForEach-Object {
                            $expandedPath = $ExecutionContext.InvokeCommand.ExpandString($_)
                            if (Test-Path $expandedPath -PathType Container) {
                                Get-ChildItem -Path $expandedPath -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
                            }
                         }
                    }
                    "Action" {
                        & $details.Action
                    }
                }
            } catch {
                Update-Status "AVISO: Falha ao limpar '$itemName'. Erro: $($_.Exception.Message)"
            } finally {
                 if ($details.PostAction) { Update-Status "... Executando pós-acao."; & $details.PostAction }
            }
        }
        Update-Status "Limpeza de arquivos concluida. Re-analisando para confirmar..."
        Analyze-CleanableFiles
    }
}
function Analyze-CleanableFiles {
    $filesPanel.AnalyzeButton.Enabled = $false
    $filesPanel.CleanButton.Enabled = $false
    $filesPanel.Control.Nodes.Clear()

    Run-Task "analise de Arquivos para Limpeza" {
        
        $filesPanel.Control.BeginUpdate()
        $foundItems = [System.Collections.Generic.List[object]]::new()
        
        try {
            # ETAPA 1: Coleta de itens de limpeza do Sistema (Versao Completa)
            $systemCleanOptions = [ordered]@{
                "Esvaziar Lixeira" = @{ Type = "Action"; Action = [scriptblock]{ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }; GetSize = [scriptblock]{ try { return ((New-Object -ComObject Shell.Application).NameSpace(0x0a).Items() | Measure-Object -Property Size -Sum -ErrorAction Stop).Sum } catch { return 0 } } }
                "Arquivos Temporarios" = @{ Type = "FolderContent"; Path = @("$env:TEMP", "$env:windir\Temp") }
                "Area de Transferencia" = @{ Type = "Action"; Action = [scriptblock]{ Set-Clipboard -Value $null }; GetSize = { return 0 } }
                "Despejos de Memória" = @{ Type = "File"; Path = @("$env:windir\Minidump\*.*", "$env:windir\MEMORY.DMP") }
                "Fragmentos do verificador de disco" = @{ Type = "File"; Path = @("$($env:SystemDrive)\*.chk") }
                "Relatorios do Windows" = @{ Type = "FolderContent"; Path = @("$env:ProgramData\Microsoft\Windows\WER\ReportArchive", "$env:ProgramData\Microsoft\Windows\WER\ReportQueue", "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportArchive", "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportQueue") }
                "Registros de rastreamento de eventos do Windows" = @{ Type = "File"; Path = @("$env:windir\Logs\*.etl") }
                "Cache DNS" = @{ Type = "Action"; Action = [scriptblock]{ ipconfig /flushdns }; GetSize = { return 0 } }
                "Arquivos de otimizacao de entrega do Windows" = @{ Type = "FolderContent"; Path = @("$env:windir\SoftwareDistribution\DeliveryOptimization"); PreAction = { Stop-Service DoSvc -Force -EA SilentlyContinue }; PostAction = { Start-Service DoSvc -EA SilentlyContinue } }
                "Cache web do Windows" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Windows\INetCache") }
				"Registros de eventos do Windows" = @{ Type = "Action"; Action = [scriptblock]{ (wevtutil el) | ForEach-Object { wevtutil cl $_ 2>$null } }; GetSize = { return 0 } } 
				"Dados do Prefetch antigos" = @{ Type = "FolderContent"; Path = @("$env:windir\Prefetch") }
                "OneDrive (Arquivos de cache)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\OneDrive\cache", "$env:LOCALAPPDATA\Microsoft\OneDrive\logs") }
                "Itens do Office 365 (Itens de cache e update que nao precisam mais)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache", "$env:LOCALAPPDATA\Microsoft\Office\OTele") }
            }

            foreach ($option in $systemCleanOptions.GetEnumerator()) {
                $optionName = $option.Name; $optionDetails = $option.Value; $totalSize = 0
                if ($optionDetails.ContainsKey("GetSize")) { $totalSize = try { & $optionDetails.GetSize } catch { 0 } }
                elseif ($optionDetails.Path) {
                    foreach ($pathPattern in $optionDetails.Path) {
                        $resolvedPaths = try { $ExecutionContext.InvokeCommand.ExpandString($pathPattern) | ForEach-Object { Resolve-Path -Path $_ -ErrorAction SilentlyContinue } } catch { $null }
                        foreach ($path in $resolvedPaths) { 
                            if (Test-Path -LiteralPath $path) { 
                                $pathSize = Get-DirectorySize-Formatted $path
                                if ($pathSize.Bytes -gt 0) { $totalSize += $pathSize.Bytes }
                            } 
                        }
                    }
                }
                if ($totalSize -gt 0 -or $optionDetails.Type -eq "Action") {
                    $optionDetails.Size = $totalSize
                    $foundItems.Add([pscustomobject]@{ Group = "Sistema"; ItemName = $optionName; Details = $optionDetails })
                }
            }

            # ETAPA 2: Coleta de itens de Aplicativos
            $installed = Get-InstalledApps; $installed += "Windows Defender"
            $db = $script:config.CacheDatabase
            foreach ($app in $installed) {
                foreach ($dbEntry in $db.GetEnumerator()) {
                    if ($app -like $dbEntry.Name) {
                        $appProcesses = if ($dbEntry.Value.ContainsKey("Processes")) { $dbEntry.Value.Processes } else { @() }
                        foreach ($cacheType in $dbEntry.Value.GetEnumerator()) {
                            if ($cacheType.Name -eq "Processes") { continue }
                            $details = $cacheType.Value; $totalCacheSize = 0
                            $pathsToVerify = $details.Path | ForEach-Object { try { $ExecutionContext.InvokeCommand.ExpandString($_) | Resolve-Path -ErrorAction SilentlyContinue } catch { $null } } | Where-Object { $_ -and (Test-Path -LiteralPath $_) }
                            if ($pathsToVerify.Count -gt 0) { 
                                $pathsToVerify | ForEach-Object { 
                                    $pathSize = Get-DirectorySize-Formatted $_
                                    if ($pathSize.Bytes -gt 0) { $totalCacheSize += $pathSize.Bytes }
                                } 
                            }
                            if ($totalCacheSize -gt 0) {
                                $details.Size = $totalCacheSize
                                $foundItems.Add([pscustomobject]@{ Group = $app; ItemName = $cacheType.Name; Details = $details; Processes = $appProcesses })
                            }
                        }
                    }
                }
            }

            # ETAPA 3: Popular a interface
            if ($foundItems.Count -eq 0) {
                Update-Status "Nenhum arquivo para limpeza foi encontrado."
            } else {
                $groupedItems = $foundItems | Group-Object -Property Group
                foreach ($group in $groupedItems) {
                    $parentNode = New-Object System.Windows.Forms.TreeNode($group.Name)
                    if ($group.Group[0].Processes) { $parentNode.Tag = $group.Group[0].Processes }
                    foreach ($item in $group.Group) {
                        $formattedSize = (Get-DirectorySize-Formatted $item.Details.Size).Formatted
                        $childNode = New-Object System.Windows.Forms.TreeNode("$($item.ItemName) ($formattedSize)")
                        $childNode.Tag = $item.Details
                        $parentNode.Nodes.Add($childNode) | Out-Null
                    }
                    $filesPanel.Control.Nodes.Add($parentNode) | Out-Null
                }
                Update-Status "$($filesPanel.Control.Nodes.Count) categorias com arquivos para limpeza encontradas."
                $filesPanel.CleanButton.Enabled = $true
                $filesPanel.Control.ExpandAll()
                $filesPanel.Control.Nodes | ForEach-Object { $_.Checked = $true; $_.Nodes | ForEach-Object { $_.Checked = $true } }
            }
        }
        catch { Update-Status "ERRO CRITICO durante a analise de arquivos: $($_.Exception.Message)" }
        finally { $filesPanel.Control.EndUpdate() }
    }
    $filesPanel.AnalyzeButton.Enabled = $true
}function Run-SFC-Scan { Run-Task "Verificar Integridade (SFC)" { $proc = Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -PassThru -WindowStyle Hidden; if ($proc.ExitCode -ne 0) { Update-Status "SFC encontrou problemas." } } }
function Run-DISM-Repair { Run-Task "Reparar Imagem (DISM)" { Test-NetConnectionSafe; $proc = Start-Process -FilePath "dism.exe" -ArgumentList "/Online /Cleanup-Image /RestoreHealth" -Wait -PassThru -WindowStyle Hidden; if ($proc.ExitCode -ne 0) { Update-Status "DISM falhou." } } }
function Run-Chkdsk { Run-Task "Verificar Disco (Chkdsk)" { if (-not (Confirm-Action "Agendar verificacao de disco na proxima reinicializacao?")) { return "CANCELADO" }; chkdsk C: /f /r; fsutil dirty set C:; $script:rebootRequired = $true } }
function Flush-DNS-Cache { Run-Task "Limpar Cache de DNS" { ipconfig /flushdns } }
function Reset-Winsock { Run-Task "Redefinir Catalogo Winsock" { netsh winsock reset; $script:rebootRequired = $true } }
function Scan-OutdatedChocoApps { $scanChocoButton.Enabled = $false; $updateChocoButton.Enabled = $false; $chocoUpdatesListView.Items.Clear(); Run-Task "Verificar Desatualizados (Choco)" { Ensure-ChocolateyIsInstalled | Out-Null; $choco = "$env:ProgramData\chocolatey\bin\choco.exe"; $out = & $choco outdated -r 2>&1 | Out-String; if ($LASTEXITCODE -ne 0 -and ($out -notlike "*outdated*") -and ($out -notlike "*determined*")) { throw "choco outdated falhou: $out" }; $lines = $out.Split([Environment]::NewLine) | ? { $_ -match '\|' -and $_ -notlike 'Output is id*' }; $c = 0; $i = 1; foreach ($line in $lines) { $parts = $line.Split('|') | % { $_.Trim() }; if ($parts.Length -ge 3 -and -not [string]::IsNullOrWhiteSpace($parts[0])) { $c++; $item = New-Object System.Windows.Forms.ListViewItem($i.ToString()); $item.SubItems.Add($parts[0]); $item.SubItems.Add($parts[1]); $item.SubItems.Add($parts[2]); $item.Checked = $true; $chocoUpdatesListView.Items.Add($item) | Out-Null; $i++ } }; if ($c -gt 0) { $updateChocoButton.Enabled = $true } }; $chocoUpdatesListView.AutoResizeColumns(1); $scanChocoButton.Enabled = $true }
function Update-RegisteredAppsList {
    $regUpdatesListView.Items.Clear()
    $paths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
        "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
    )
    
    $uniqueApps = [System.Collections.Generic.Dictionary[string,object]]::new([System.StringComparer]::OrdinalIgnoreCase)

    foreach ($p in $paths) {
        Get-ChildItem -Path $p -ErrorAction SilentlyContinue | ForEach-Object {
            $name = $_.GetValue("DisplayName")
            $uninstallString = $_.GetValue("UninstallString")

            # Filtro principal: Deve ter um nome de exibicao e uma string de desinstalacao.
            # Ignora componentes do sistema e atualizacoes sem nome.
            if (-not [string]::IsNullOrWhiteSpace($name) -and -not [string]::IsNullOrWhiteSpace($uninstallString) -and ($_.GetValue("SystemComponent") -ne 1)) {
                
                # Adiciona a lista apenas se o nome ainda nao existir, evitando duplicatas.
                if (-not $uniqueApps.ContainsKey($name)) {
                    $uniqueApps[$name] = @{
                        Name            = $name
                        Version         = $_.GetValue("DisplayVersion")
                        Publisher       = $_.GetValue("Publisher")
                        UninstallString = $uninstallString
                    }
                }
            }
        }
    }

    # Ordena a lista final pelo nome do aplicativo
    $sortedApps = $uniqueApps.Values | Sort-Object Name

    $regUpdatesListView.BeginUpdate()
    $i = 1
    foreach ($app in $sortedApps) {
        if ([string]::IsNullOrWhiteSpace($app.Name)) { continue }
        $item = New-Object System.Windows.Forms.ListViewItem($i.ToString())
        $item.SubItems.Add($app.Name)
        $item.SubItems.Add($(if ($app.Version) { $app.Version } else { "N/D" }))
        $item.SubItems.Add($(if ($app.Publisher) { $app.Publisher } else { "N/D" }))
        $item.Tag = $app.UninstallString
        $regUpdatesListView.Items.Add($item) | Out-Null
        $i++
    }
    $regUpdatesListView.EndUpdate()
    $regUpdatesListView.AutoResizeColumns(1)
}
function Update-SelectedChocoApps {
    $scanChocoButton.Enabled = $false
    $updateChocoButton.Enabled = $false
    $selectedItems = $chocoUpdatesListView.CheckedItems
    if ($selectedItems.Count -eq 0) {
        Update-Status "Nenhum aplicativo selecionado para atualizar."
        $scanChocoButton.Enabled = $true
        return
    }

    # Garante que o Chocolatey está instalado antes de criar as tarefas
    try {
        Ensure-ChocolateyIsInstalled | Out-Null
    } catch {
        Update-Status "ERRO: Chocolatey nao está instalado ou falhou ao instalar. A atualizacao foi cancelada."
        $scanChocoButton.Enabled = $true
        $updateChocoButton.Enabled = $true
        return
    }
    
    $chocoExePath = "'$env:ProgramData\chocolatey\bin\choco.exe'"
    
    # Cria uma lista de tarefas customizada, uma para cada app
    $customTasksToRun = [System.Collections.ArrayList]::new()
    $selectedItems | ForEach-Object {
        $appName = $_.SubItems[1].Text
        $actionBlock = [scriptblock]::Create("& $chocoExePath upgrade $appName -y -r")
        $customTasksToRun.Add(@{ N = "Atualizando $appName (Choco)"; A = $actionBlock }) | Out-Null
    }

    # Chama a funcao de execucao principal, passando a lista de tarefas customizada
    Start-Execution -CustomTasks $customTasksToRun
}
function Scan-RegistryApps { $scanRegButton.Enabled = $false; $searchForUpdateButton.Enabled = $false; $uninstallRegButton.Enabled = $false; Run-Task "Verificar Apps Instalados (Registro)" { Update-RegisteredAppsList }; $scanRegButton.Enabled = $true }
function Uninstall-SelectedApps { $uninstallRegButton.Enabled = $false; $toUninstall = $regUpdatesListView.CheckedItems; if ($toUninstall.Count -eq 0) { $uninstallRegButton.Enabled = $true; return }; if (-not (Confirm-Action "Desinstalar $($toUninstall.Count) app(s)?")) { $uninstallRegButton.Enabled = $true; return }; foreach ($item in $toUninstall) { $appName = $item.SubItems[1].Text; $unStr = $item.Tag; Run-Task "Desinstalar $appName" { if ([string]::IsNullOrWhiteSpace($unStr)) { throw "String de desinstalacao nao encontrada." }; $cmd = ""; $args = ""; if ($unStr.StartsWith('"')) { $end = $unStr.IndexOf('"', 1); if ($end -ne -1) { $cmd = $unStr.Substring(1, $end - 1); $args = $unStr.Substring($end + 1).Trim() } }; if (-not $cmd) { $parts = $unStr -split ' ', 2; $cmd = $parts[0]; if ($parts.Count -gt 1) { $args = $parts[1] } }; $cmd = $cmd.Replace('"', ''); $silent = ""; if ($cmd -match 'msiexec' -and $args -notmatch '/qn') { $args = $args.Replace("/I", "/X"); $silent = "/qn /norestart" } elseif ($args -notmatch '(/S|/silent|/quiet)') { $silent = "/S" }; $finalArgs = "$args $silent".Trim(); Start-Process -FilePath $cmd -ArgumentList $finalArgs -Wait -EA Stop } }; Scan-RegistryApps }

function Analyze-Bloatware { $panel = $bloatwarePanel; $panel.AnalyzeButton.Enabled = $false; $panel.CleanButton.Enabled = $false; $panel.Control.Items.Clear(); Run-Task "Verificar Apps Nativos (Winget)" { $upg = @{}; try { $out = winget upgrade --include-unknown --accept-source-agreements; $out | Select-Object -Skip 2 | % { $line = $_ -split '\s{2,}'; if ($line.Count -ge 4) { $id = $line[1].Trim(); $ver = $line[3].Trim(); if (-not [string]::IsNullOrEmpty($id)) { $upg[$id] = $ver } } } } catch {}; $all = $script:config.BloatwareApps; $panel.Control.BeginUpdate(); $i = 1; foreach ($e in $all.GetEnumerator()) { $tech = $e.Name; $friendly = $e.Value.FriendlyName; $wid = $e.Value.WingetId; $app = Get-AppxPackage -AllUsers -Name $tech -EA SilentlyContinue | Select -First 1; $item = New-Object System.Windows.Forms.ListViewItem($i.ToString()); $item.SubItems.Add($friendly) | Out-Null; if ($app) { if ($wid -and $upg.ContainsKey($wid)) { $item.SubItems.Add("Atualizacao Disponivel") | Out-Null; $item.Tag = @{ A = "Upgrade"; W = $wid; P = $app.PackageFullName } } else { $item.SubItems.Add("Instalado") | Out-Null; $item.Tag = @{ A = "Remove"; P = $app.PackageFullName } } } else { $item.SubItems.Add("Nao Encontrado") | Out-Null; $item.ForeColor = [System.Drawing.Color]::DarkGray; if (-not [string]::IsNullOrWhiteSpace($wid)) { $item.Tag = @{ A = "Install"; W = $wid } } else { $item.Tag = @{ A = "None" } } }; $panel.Control.Items.Add($item) | Out-Null; $i++ }; $panel.Control.EndUpdate(); $panel.Control.AutoResizeColumns(1); $panel.CleanButton.Enabled = $true }; $panel.AnalyzeButton.Enabled = $true }
function Apply-BloatwareActions { $panel = $bloatwarePanel; $panel.CleanButton.Enabled = $false; $items = $panel.Control.CheckedItems; if ($items.Count -eq 0) { $panel.AnalyzeButton.Enabled = $true; return }; if (-not (Confirm-Action "Aplicar acoes em $($items.Count) apps?")) { $panel.AnalyzeButton.Enabled = $true; $panel.CleanButton.Enabled = $true; return }; Run-Task "Aplicar Acoes nos Apps Nativos" { foreach ($item in $items) { $info = $item.Tag; $name = $item.SubItems[1].Text; $action = $info.A; try { switch ($action) { "Remove" { Remove-AppxPackage -Package $info.P -AllUsers -EA Stop } "Install" { $args = "install --id $($info.W) -e --silent --force --disable-interactivity --accept-package-agreements --accept-source-agreements"; Start-Process winget.exe -ArgumentList $args -Wait -PassThru -WindowStyle Hidden } "Upgrade" { $args = "upgrade --id $($info.W) -e --silent --force --disable-interactivity --accept-package-agreements --accept-source-agreements --include-unknown"; Start-Process winget.exe -ArgumentList $args -Wait -PassThru -WindowStyle Hidden } } } catch {}; Start-Sleep -Seconds 2 } }; Analyze-Bloatware; $panel.AnalyzeButton.Enabled = $true }
function Analyze-RegistryIssues { $analyzeRegButton.Enabled = $false; $backupRegButton.Enabled = $false; $cleanRegButton.Enabled = $false; $regCleanerListView.Items.Clear(); Run-Task "Analisando Problemas no Registro" { $res = [System.Collections.Generic.List[object]]::new(); $regCleanerListView.BeginUpdate(); try { $uninst = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"); foreach ($p in $uninst) { Get-ChildItem -Path $p -EA SilentlyContinue | % { $loc = $_.GetValue("InstallLocation"); if ($loc -and -not (Test-Path $loc)) { $res.Add(@{ Type = "Desinstalador Orfao"; Path = $_.PSPath; DisplayPath = $_.Name; Location = "Pasta: $loc"; Tag = $_.PSPath }) } } }; $run = @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Run", "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"); foreach ($p in $run) { $key = Get-Item -Path $p -EA SilentlyContinue; if ($key) { foreach ($val in $key.GetValueNames()) { $cmd = $key.GetValue($val); if ($cmd -is [string]) { $cmdStr = $cmd.Trim(); $exe = $cmdStr; $match = [regex]::Match($cmdStr, '(\s[/-].*)'); if ($match.Success) { $exe = $cmdStr.Substring(0, $match.Index).Trim() }; $exe = $exe.Trim('"'); if ($exe -and -not (Test-Path $exe)) { $res.Add(@{ Type = "Inicializacao Invalida"; Path = $key.PSPath; DisplayPath = $key.Name; Location = "Valor: $val"; Tag = @{ Path = $key.PSPath; ValueName = $val } }) } } } } }; $mui = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache"; if (Test-Path $mui) { $key = Get-Item -Path $mui; foreach ($val in $key.GetValueNames()) { if ($val -like "*:\*") { $exe = $val.Split(',')[0]; if (-not (Test-Path $exe)) { $res.Add(@{ Type = "Cache MUI Obsoleto"; Path = $key.PSPath; DisplayPath = $key.Name; Location = "Executavel: $exe"; Tag = @{ Path = $key.PSPath; ValueName = $val } }) } } } }; $i = 1; foreach($issue in $res) { $item = New-Object System.Windows.Forms.ListViewItem($i.ToString()); $item.SubItems.Add($issue.Type) | Out-Null; $item.SubItems.Add($issue.DisplayPath) | Out-Null; $item.SubItems.Add($issue.Location) | Out-Null; $item.Tag = $issue.Tag; $item.Checked = $true; $regCleanerListView.Items.Add($item) | Out-Null; $i++ } } finally { $regCleanerListView.EndUpdate(); $regCleanerListView.AutoResizeColumns(1) }; if ($regCleanerListView.Items.Count -gt 0) { $backupRegButton.Enabled = $true; $cleanRegButton.Enabled = $true }; $analyzeRegButton.Enabled = $true; $count = $regCleanerListView.CheckedItems.Count; $regCleanerSummaryLabel.Text = "Total de itens selecionados: $count" }; $analyzeRegButton.Enabled = $true }
function Backup-SelectedRegistryIssues { $items = $regCleanerListView.CheckedItems; if ($items.Count -eq 0) { return }; $dlg = New-Object System.Windows.Forms.SaveFileDialog; $dlg.Filter = "Arquivo de Registro (*.reg)|*.reg"; $dlg.FileName = "AZTools_RegBackup_$(Get-Date -f 'yyyy-MM-dd_HHmmss').reg"; if ($dlg.ShowDialog() -ne "OK") { return }; $file = $dlg.FileName; Run-Task "Backup de Chaves do Registro" { $keys = $items | % { if ($_.Tag -is [string]) { $_.Tag } elseif ($_.Tag -is [hashtable]) { $_.Tag.Path } } | Select -Unique; "Windows Registry Editor Version 5.00`r`n" | Out-File -FilePath $file -Encoding Unicode; foreach ($key in $keys) { $keyPath = $key.Replace("HKEY_CURRENT_USER", "HKCU").Replace("HKEY_LOCAL_MACHINE", "HKLM").Replace("Microsoft.PowerShell.Core\Registry::", ""); $tmp = "$env:TEMP\reg_temp.reg"; Start-Process reg -ArgumentList "export `"$keyPath`" `"$tmp`" /y" -Wait -NoNewWindow; Get-Content $tmp | Select-Object -Skip 2 | Add-Content -Path $file -Encoding Unicode; Remove-Item $tmp -Force -EA SilentlyContinue } } }
function Clean-SelectedRegistryIssues { $items = $regCleanerListView.CheckedItems; if ($items.Count -eq 0) { return }; if (-not (Confirm-Action "Apagar $($items.Count) itens do registro?")) { return }; $cleanRegButton.Enabled = $false; Run-Task "Limpeza de Itens do Registro" { foreach ($item in ($items | Sort-Object { $_.SubItems[2].Text.Length } -Descending)) { try { if ($item.Tag -is [string]) { Remove-Item -Path $item.Tag -Recurse -Force -EA Stop } elseif ($item.Tag -is [hashtable]) { Remove-ItemProperty -Path $item.Tag.Path -Name $item.Tag.ValueName -Force -EA Stop } } catch {} }; Analyze-RegistryIssues }; $cleanRegButton.Enabled = $true }
function Populate-AppsTreeView { $appsTreeView.Nodes.Clear(); $internal = New-Object System.Windows.Forms.TreeNode("Aplicativos Internos"); $recomm = New-Object System.Windows.Forms.TreeNode("Aplicativos Recomendados"); $optional = New-Object System.Windows.Forms.TreeNode("Aplicativos Opcionais"); $shortcuts = New-Object System.Windows.Forms.TreeNode("Atalhos da Web"); $internal.Nodes.Add("Instalar Softphone") | Out-Null; $internal.Nodes.Add("Instalar OneDrive") | Out-Null; $script:config.RecommendedApps | % { $c = New-Object System.Windows.Forms.TreeNode("Instalar $($_.Name)"); $recomm.Nodes.Add($c) | Out-Null }; $script:config.OptionalApps | % { $c = New-Object System.Windows.Forms.TreeNode("Instalar $($_.Name)"); $optional.Nodes.Add($c) | Out-Null }; $script:config.WebShortcuts | % { $t = "Criar Atalho: $($_.Name)"; $c = New-Object System.Windows.Forms.TreeNode($t); $shortcuts.Nodes.Add($c) | Out-Null }; $appsTreeView.Nodes.AddRange(@($internal, $recomm, $optional, $shortcuts)); $appsTreeView.ExpandAll() }
function Populate-GodModeList { $script:godModeItems = @(); $path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace"; Get-ChildItem $path -EA SilentlyContinue | % { $name = (Get-ItemProperty -Path $_.PSPath -Name '(default)' -EA SilentlyContinue).'(default)'; $cmd = "explorer.exe shell:::$($_.PSChildName)"; if (-not [string]::IsNullOrWhiteSpace($name)) { $script:godModeItems += @{ Name = $name; Command = $cmd } } }; $script:godModeItems = $script:godModeItems | Sort-Object Name; $godModeListView.Items.Clear(); $script:godModeItems.ForEach({ $item = New-Object System.Windows.Forms.ListViewItem($_.Name); $item.SubItems.Add($_.Command) | Out-Null; $godModeListView.Items.Add($item) | Out-Null }); $godModeListView.AutoResizeColumns(1); $godModeListView.Add_MouseDoubleClick({ if ($this.SelectedItems.Count -gt 0) { $cmd = $this.SelectedItems[0].SubItems[1].Text; try { $parts = $cmd -split ' ', 2; $exe = $parts[0]; $args = if ($parts.Count -gt 1) { $parts[1] } else { "" }; Start-Process -FilePath $exe -ArgumentList $args } catch {} } }); $godModeSearchBox.Add_TextChanged({ $text = $this.Text; $godModeListView.BeginUpdate(); $godModeListView.Items.Clear(); $script:godModeItems | ? { $_.Name -like "*$text*" } | % { $item = New-Object System.Windows.Forms.ListViewItem($_.Name); $item.SubItems.Add($_.Command) | Out-Null; $godModeListView.Items.Add($item) | Out-Null }; $godModeListView.EndUpdate() }) }
function Set-CheckedStateOnControl { param($Control, $State); if ($Control -is [System.Windows.Forms.CheckedListBox]) { for ($i = 0; $i -lt $Control.Items.Count; $i++) { $Control.SetItemChecked($i, $State) } } elseif ($Control -is [System.Windows.Forms.TreeView]) { function Set-Node($nodes, $check) { foreach ($n in $nodes) { $n.Checked = $check; if ($n.Nodes.Count -gt 0) { Set-Node $n.Nodes $check } } }; Set-Node $Control.Nodes $State } elseif ($Control -is [System.Windows.Forms.ListView]) { $Control.Items | % { $_.Checked = $State } } }

function Start-Execution {
    param(
        [bool]$AllTabs = $false,
        [System.Collections.ArrayList]$CustomTasks = $null
    )
    $tasksToRun = [System.Collections.ArrayList]::new()

    if ($CustomTasks) {
        $tasksToRun = $CustomTasks
    } else {
        $tabs = if ($AllTabs) { $tabControl.TabPages } else { @($tabControl.SelectedTab) }
        foreach ($tab in $tabs) {
            switch ($tab.Text) {
                "Sistema e Manutencao" {
                    $systemCheckedListBox.CheckedItems | ForEach-Object { $tasksToRun.Add(@{ N = $_; A = $systemTasks[$_] }) | Out-Null }
                    $maintenanceCheckedListBox.CheckedItems | ForEach-Object { $tasksToRun.Add(@{ N = $_; A = $maintenanceTasks[$_] }) | Out-Null }
                }
                "Personalizacao" {
                    $personalizationCheckedListBox.CheckedItems | ForEach-Object { $tasksToRun.Add(@{ N = $_; A = $personalizationTasks[$_] }) | Out-Null }
                }
                "Softwares" {
                    function Get-CheckedTreeNodes($nodes) { foreach ($node in $nodes) { if ($node.Checked -and $node.Nodes.Count -eq 0) { $node }; if ($node.Nodes.Count -gt 0) { Get-CheckedTreeNodes $node.Nodes } } }
                    Get-CheckedTreeNodes $appsTreeView.Nodes | ForEach-Object {
                        $taskName = $_.Text
                        if ($appTasks.Keys -contains $taskName) { $tasksToRun.Add(@{ N = $taskName; A = $appTasks[$taskName] }) | Out-Null }
                        elseif ($shortcutTasks.Keys -contains $taskName) { $tasksToRun.Add(@{ N = $taskName; A = $shortcutTasks[$taskName] }) | Out-Null }
                    }
                }
                "Otimizacao e Bloatware" {
                    $debloatCheckedListBox.CheckedItems | ForEach-Object { $tasksToRun.Add(@{ N = $_; A = $debloatTasks[$_] }) | Out-Null }
                }
                "Endpoint Security" {
                    $endpointSecurityCheckedListBox.CheckedItems | ForEach-Object { $tasksToRun.Add(@{ N = $_; A = $endpointSecurityTasks[$_] }) | Out-Null }
                }
            }
        }
    }

    if ($tasksToRun.Count -eq 0) { return }

    # UI e Pop-up
    $script:controlsToToggle.ForEach({ if ($_.IsHandleCreated) { $_.Enabled = $false } })
    $script:loadingOverlay = New-Object System.Windows.Forms.Form
    $script:loadingOverlay.FormBorderStyle = 'None'; $script:loadingOverlay.Size = New-Object System.Drawing.Size(400, 150); $script:loadingOverlay.StartPosition = 'CenterParent'
    $script:loadingOverlay.BackColor = $script:themeColors.FormBackground; $script:loadingOverlay.Opacity = 0.95
    $lbl = New-Object System.Windows.Forms.Label; $lbl.Text = "Iniciando..."; $lbl.Dock = 'Top'; $lbl.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold); $lbl.ForeColor = $script:themeColors.Foreground; $lbl.TextAlign = 'MiddleCenter'; $lbl.Height = 50
    $prog = New-Object System.Windows.Forms.ProgressBar; $prog.Maximum = 100; $prog.Value = 0; $prog.Dock = 'Fill'
    $script:loadingOverlay.Controls.AddRange(@($prog, $lbl))
    $script:loadingOverlay.Show($form)
    $form.Refresh()

    # Pacote de funcoes para garantir que o job seja auto-suficiente
    # Dentro da funcao Start-Execution

$requiredFunctions = @(
    'Run-Task', 'Ensure-ChocolateyIsInstalled', 'Install-Chocolatey', 'Test-NetConnectionSafe',
    'Install-App', 'Install-Softphone', 'Create-SingleWebShortcut', 'Handle-Hostname', 'Activate-Windows',
    'Install-VCRedist', 'Install-DotNetFX', 'Force-WindowsUpdates', 'Configure-System-ThemeAndTaskbar',
    'Configure-System-Wallpaper', 'Configure-Teams-Backgrounds', 'Install-OneDrive', 'Disable-Telemetry',
    'Adjust-For-Performance', 'Clean-Prefetch', 'Empty-RecycleBin', 'Disk-Cleanup', 'Clean-TempFiles',
    'Install-TrendMicroAgent', 'Run-SFC-Scan', 'Run-DISM-Repair', 'Run-Chkdsk', 'Flush-DNS-Cache', 'Reset-Winsock',
    'Validate-And-Repair-OneDrive', 'Stop-Process-AndWait', 'Get-Image-List-From-Url', 'Download-File-Robust',
    'Find-ExecutablePath', 'Get-DownloadsPath', 'Get-And-Convert-ShortcutIcon'
)
   $functionDefinitions = @{}
    $requiredFunctions | ForEach-Object { if(Test-Path "function:$_") { $functionDefinitions[$_] = (Get-Content "function:$_") } }
    
    # Bloco de script do Job
    $sb = {
        param($tasksToRun, $functionDefinitions)
        
        # 1. Recria todas as funcoes necessarias dentro do escopo do job
        foreach ($funcName in $functionDefinitions.Keys) {
            ${function:$funcName} = $functionDefinitions[$funcName]
        }

        # 2. Redefine Update-Status para comunicacao de log
        function Update-Status($message) { Write-Output "LOG:$message" }
        
        # 3. Importa variaveis necessarias
        $script:config = $using:script:config
        $script:rebootRequired = $false
        
        # 4. Loop de execucao principal
        $total = $tasksToRun.Count; $c = 0; $failed = $false
        foreach ($task in $tasksToRun) {
            try { Run-Task -description $task.N -action $task.A } catch { $failed = $true }
            $c++; $p = [int](($c / $total) * 100)
            Write-Output ("PROGRESS:{0}:{1}" -f $p, $task.N)
        }
        
        # 5. Comunica o status final de volta para a janela principal
        Write-Output "REBOOT_REQUIRED:$($script:rebootRequired)"
        Write-Output "COMPLETE:$failed"
    }
    
    # Inicia o Job
    $args = @( $tasksToRun, $functionDefinitions )
    $script:executionJob = Start-Job -ScriptBlock $sb -ArgumentList $args
    $script:progressTimer.Start()
}
# --- CRIAcaO DO FORMULaRIO (continuacao) ---
$form = New-Object System.Windows.Forms.Form
$form.Text = "AZTools v2. Build02102025"
$form.Size = New-Object System.Drawing.Size(900, 700) 
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = 'None'
$form.Padding = New-Object System.Windows.Forms.Padding(1)
$form.BackColor = $script:themeColors.Accent

# -- Barra de Titulo Personalizada --
$titleBar = New-Object System.Windows.Forms.Panel
$titleBar.Height = 32
$titleBar.Dock = "Top"
$titleBar.BackColor = $script:themeColors.FormBackground

$titleIcon = New-Object System.Windows.Forms.PictureBox
$titleIcon.Size = New-Object System.Drawing.Size(16, 16)
$titleIcon.Location = New-Object System.Drawing.Point(8, 8)
$titleIcon.SizeMode = 'StretchImage'

$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = $form.Text
$titleLabel.Location = New-Object System.Drawing.Point(32, 8)
$titleLabel.AutoSize = $true
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)

$closeButtonTitle = New-Object System.Windows.Forms.Button
$closeButtonTitle.Text = "X"
$closeButtonTitle.Size = New-Object System.Drawing.Size(45, $titleBar.Height)
$closeButtonTitle.Dock = "Right"

$maximizeButton = New-Object System.Windows.Forms.Button
$maximizeButton.Text = "[ ]"
$maximizeButton.Size = New-Object System.Drawing.Size(45, $titleBar.Height)
$maximizeButton.Dock = "Right"

$minimizeButton = New-Object System.Windows.Forms.Button
$minimizeButton.Text = "_"
$minimizeButton.Size = New-Object System.Drawing.Size(45, $titleBar.Height)
$minimizeButton.Dock = "Right"

@($closeButtonTitle, $maximizeButton, $minimizeButton) | ForEach-Object {
    $_.FlatStyle = 'Flat'
    $_.ForeColor = $script:themeColors.Foreground
    $_.FlatAppearance.BorderSize = 0
    $_.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
}
$closeButtonTitle.add_Click({ $form.Close() })
$minimizeButton.add_Click({ $form.WindowState = 'Minimized' })
$maximizeButton.add_Click({ if ($form.WindowState -eq 'Normal') { $form.WindowState = 'Maximized' } else { $form.WindowState = 'Normal' } })
$closeButtonTitle.add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(232, 17, 35) })
$closeButtonTitle.add_MouseLeave({ $this.BackColor = $script:themeColors.FormBackground })

@($maximizeButton, $minimizeButton) | ForEach-Object {
    $_.add_MouseEnter({ $this.BackColor = $script:themeColors.ControlBackground })
    $_.add_MouseLeave({ $this.BackColor = $script:themeColors.FormBackground })
}

$titleBar.Controls.AddRange(@($minimizeButton, $maximizeButton, $closeButtonTitle, $titleIcon, $titleLabel))

# Habilita o Arraste da Janela (Agora as funcoes existem)
Enable-FormDragging -Control $titleBar -Form $form
Enable-FormDragging -Control $titleLabel -Form $form

# --- Criacao das Abas ---
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Multiline = $true
$systemTabPage = New-Object System.Windows.Forms.TabPage; $systemTabPage.Text = "Sistema e Manutencao"
$filesTabPage = New-Object System.Windows.Forms.TabPage; $filesTabPage.Text = "Limpeza de Arquivos e Registros"
$personalizationTabPage = New-Object System.Windows.Forms.TabPage; $personalizationTabPage.Text = "Personalizacao"
$softwaresTabPage = New-Object System.Windows.Forms.TabPage; $softwaresTabPage.Text = "Softwares"
# A linha que criava $windowsFeaturesTabPage foi removida
$debloatTabPage = New-Object System.Windows.Forms.TabPage; $debloatTabPage.Text = "Otimizacao e Bloatware"
$endpointSecurityTabPage = New-Object System.Windows.Forms.TabPage; $endpointSecurityTabPage.Text = "Endpoint Security"
$godModeTabPage = New-Object System.Windows.Forms.TabPage; $godModeTabPage.Text = "God Mode"

$tabControl.TabPages.AddRange(@($systemTabPage, $filesTabPage, $personalizationTabPage, $softwaresTabPage, $debloatTabPage, $endpointSecurityTabPage, $godModeTabPage))

# --- Criacao e Populacao dos Controles das Abas ---

# Aba Sistema e Manutencao
$systemMaintenanceTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $systemMaintenanceTablePanel.Dock = "Fill"; $systemMaintenanceTablePanel.ColumnCount = 2; $systemMaintenanceTablePanel.RowCount = 2
$systemMaintenanceTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$systemMaintenanceTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$systemMaintenanceTablePanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$systemMaintenanceTablePanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$systemTabPage.Controls.Add($systemMaintenanceTablePanel)

# Adiciona os paineis originais na linha de cima
$systemCheckedListBox = Create-TitledControlPanel $systemMaintenanceTablePanel "Tarefas de Sistema e Configuracao" (New-Object System.Windows.Forms.CheckedListBox)
$maintenanceCheckedListBox = Create-TitledControlPanel $systemMaintenanceTablePanel "Tarefas de Manutencao e Reparacao" (New-Object System.Windows.Forms.CheckedListBox)

# Aba Personalizacao
$personalizationCheckedListBox = Create-TitledControlPanel $personalizationTabPage "Tarefas de Personalizacao" (New-Object System.Windows.Forms.CheckedListBox)

# Aba Otimizacao e Bloatware
$debloatTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $debloatTablePanel.Dock = "Fill"; $debloatTablePanel.ColumnCount = 2
$debloatTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$debloatTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$debloatTabPage.Controls.Add($debloatTablePanel)
$debloatCheckedListBox = Create-TitledControlPanel $debloatTablePanel "Tarefas de Otimizacao" (New-Object System.Windows.Forms.CheckedListBox)
$bloatwarePanel = Create-ListViewManagementPanel "Gerenciar apps nativos" "Verificar Status" "Aplicar Acoes"
$debloatTablePanel.Controls.Add($bloatwarePanel.Group, 1, 0)

# Aba Limpeza de Arquivos e Registros
$filesAndRegTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $filesAndRegTablePanel.Dock = "Fill"; $filesAndRegTablePanel.ColumnCount = 2
$filesAndRegTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$filesAndRegTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$filesTabPage.Controls.Add($filesAndRegTablePanel)

# Cria o painel de Limpeza de Arquivos (usando a funcao corrigida)
$filesPanel = Create-TreeViewAnalysisPanel "Limpeza de Arquivos" "Analisar Arquivos" "Limpar Selecionados"
# Adiciona o painel criado na coluna da esquerda
$filesAndRegTablePanel.Controls.Add($filesPanel.Group, 0, 0)

# Cria o painel de Limpeza de Registro e o adiciona na coluna da direita
$regCleanerGroup = New-Object System.Windows.Forms.GroupBox; $regCleanerGroup.Text = "Limpeza de Registro"; $regCleanerGroup.Dock = "Fill"
$regCleanerListView = New-Object System.Windows.Forms.ListView; $regCleanerListView.Dock = "Fill"; $regCleanerListView.View = "Details"; $regCleanerListView.CheckBoxes = $true
Add-ListViewColumns $regCleanerListView @("(#)", "Tipo", "Registro", "Localizacao")

# AJUSTE: Criacao do novo label para a contagem
$regCleanerSummaryLabel = New-Object System.Windows.Forms.Label
$regCleanerSummaryLabel.Dock = "Bottom"
$regCleanerSummaryLabel.Text = "Total de itens selecionados: 0"
$regCleanerSummaryLabel.TextAlign = "MiddleRight"
$regCleanerSummaryLabel.Padding = New-Object System.Windows.Forms.Padding(0,0,5,5)

$regCleanerButtonPanel = New-Object System.Windows.Forms.Panel; $regCleanerButtonPanel.Height = 30; $regCleanerButtonPanel.Dock = "Bottom"
$analyzeRegButton = New-Object System.Windows.Forms.Button; $analyzeRegButton.Text = "Analisar"; $analyzeRegButton.Dock = "Left"; $analyzeRegButton.Width = 100
$backupRegButton = New-Object System.Windows.Forms.Button; $backupRegButton.Text = "Fazer Backup"; $backupRegButton.Dock = "Left"; $backupRegButton.Width = 120; $backupRegButton.Enabled = $false
$cleanRegButton = New-Object System.Windows.Forms.Button; $cleanRegButton.Text = "Limpar Selecionados"; $cleanRegButton.Dock = "Right"; $cleanRegButton.Width = 150; $cleanRegButton.Enabled = $false
$regCleanerButtonPanel.Controls.AddRange(@($analyzeRegButton, $backupRegButton, $cleanRegButton))

# Adiciona o novo label aos controles do painel
$regCleanerGroup.Controls.AddRange(@($regCleanerListView, $regCleanerSummaryLabel, $regCleanerButtonPanel))
$filesAndRegTablePanel.Controls.Add($regCleanerGroup, 1, 0)

# Endpoint Security
$endpointSecurityCheckedListBox = Create-TitledControlPanel $endpointSecurityTabPage "Instalacao de Agente de Seguranca" (New-Object System.Windows.Forms.CheckedListBox)

# Aba Softwares
$softwaresTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $softwaresTablePanel.Dock = "Fill"; $softwaresTablePanel.ColumnCount = 2
$softwaresTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 40)))
$softwaresTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 60)))
$softwaresTabPage.Controls.Add($softwaresTablePanel)
# MODIFICADO: Garante que a TreeView seja criada com checkboxes habilitados antes de ser passada para a funcao.
$treeViewForApps = New-Object System.Windows.Forms.TreeView
$treeViewForApps.CheckBoxes = $true
$treeViewForApps = New-Object System.Windows.Forms.TreeView
$treeViewForApps.CheckBoxes = $true
$appsTreeView = Create-TitledControlPanel $softwaresTablePanel "Instalacao de Aplicativos e Atalhos" $treeViewForApps

$managementSplitContainer = New-Object System.Windows.Forms.SplitContainer; $managementSplitContainer.Dock = "Fill"; $managementSplitContainer.Orientation = "Horizontal"
$softwaresTablePanel.Controls.Add($managementSplitContainer, 1, 0)
$chocoUpdatesGroup = New-Object System.Windows.Forms.GroupBox; $chocoUpdatesGroup.Text = "Aplicativos Gerenciados (Chocolatey)"; $chocoUpdatesGroup.Dock = "Fill"
$chocoUpdatesListView = New-Object System.Windows.Forms.ListView; $chocoUpdatesListView.Dock = "Fill"; $chocoUpdatesListView.View = "Details"; $chocoUpdatesListView.CheckBoxes = $true
Add-ListViewColumns $chocoUpdatesListView @("(#)", "Nome", "Versao Atual", "Nova Versao")
$chocoUpdatesButtonPanel = New-Object System.Windows.Forms.Panel; $chocoUpdatesButtonPanel.Height = 30; $chocoUpdatesButtonPanel.Dock = "Bottom"
$scanChocoButton = New-Object System.Windows.Forms.Button; $scanChocoButton.Text = "Scanner Choco"; $scanChocoButton.Dock = "Left"; $scanChocoButton.Width = 120
$updateChocoButton = New-Object System.Windows.Forms.Button; $updateChocoButton.Text = "Atualizar Selecionados"; $updateChocoButton.Dock = "Right"; $updateChocoButton.Width = 150; $updateChocoButton.Enabled = $false
$chocoUpdatesButtonPanel.Controls.AddRange(@($scanChocoButton, $updateChocoButton))
$chocoUpdatesGroup.Controls.AddRange(@($chocoUpdatesListView, $chocoUpdatesButtonPanel))
$managementSplitContainer.Panel1.Controls.Add($chocoUpdatesGroup)
$regUpdatesGroup = New-Object System.Windows.Forms.GroupBox; $regUpdatesGroup.Text = "Todos os aplicativos instalados"; $regUpdatesGroup.Dock = "Fill"
$regUpdatesListView = New-Object System.Windows.Forms.ListView; $regUpdatesListView.Dock = "Fill"; $regUpdatesListView.View = "Details"; $regUpdatesListView.CheckBoxes = $true;
Add-ListViewColumns $regUpdatesListView @("(#)", "Nome", "Versao", "Desenvolvedor")
$regButtonPanel = New-Object System.Windows.Forms.Panel; $regButtonPanel.Height = 30; $regButtonPanel.Dock = "Bottom"
$scanRegButton = New-Object System.Windows.Forms.Button; $scanRegButton.Text = "Scanner Registro"; $scanRegButton.Dock = "Left"; $scanRegButton.Width = 120
$searchForUpdateButton = New-Object System.Windows.Forms.Button; $searchForUpdateButton.Text = "Pesquisar Att."; $searchForUpdateButton.Dock = "Right"; $searchForUpdateButton.Width = 120; $searchForUpdateButton.Enabled = $false
$uninstallRegButton = New-Object System.Windows.Forms.Button; $uninstallRegButton.Text = "Desinstalar Selecionados"; $uninstallRegButton.Dock = "Right"; $uninstallRegButton.Width = 180; $uninstallRegButton.Enabled = $false
$regButtonPanel.Controls.AddRange(@($scanRegButton, $uninstallRegButton, $searchForUpdateButton))
$regUpdatesGroup.Controls.AddRange(@($regUpdatesListView, $regButtonPanel))
$managementSplitContainer.Panel2.Controls.Add($regUpdatesGroup)

# Aba God Mode
$godModeGroup = New-Object System.Windows.Forms.GroupBox; $godModeGroup.Text = "Atalhos do Painel de Controle (Duplo Clique para Abrir)"; $godModeGroup.Dock = "Fill"
$godModeSearchBox = New-Object System.Windows.Forms.TextBox; $godModeSearchBox.Dock = "Top"
$godModeListView = New-Object System.Windows.Forms.ListView; $godModeListView.Dock = "Fill"; $godModeListView.View = "Details"; $godModeListView.FullRowSelect = $true
Add-ListViewColumns $godModeListView @("Nome da Configuracao", "Comando")
$godModeGroup.Controls.AddRange(@($godModeListView, $godModeSearchBox))
$godModeTabPage.Controls.Add($godModeGroup)

# --- Controles Principais (Log, Botoes, Progresso) ---
$statusGroup = New-Object System.Windows.Forms.GroupBox; $statusGroup.Text = "Log de Execucao";
$statusBox = New-Object System.Windows.Forms.TextBox; $statusBox.Multiline = $true; $statusBox.Dock = "Fill"; $statusBox.ScrollBars = "Vertical"; $statusBox.Font = "Consolas, 10"; $statusBox.ReadOnly = $true; $statusGroup.Controls.Add($statusBox)
$mainButtonPanel = New-Object System.Windows.Forms.Panel; $mainButtonPanel.Height = 40; $mainButtonPanel.Dock = "Bottom"
$runCurrentTabButton = New-Object System.Windows.Forms.Button; $runCurrentTabButton.Text = "Executar Aba Atual"; $runCurrentTabButton.Dock = "Left"; $runCurrentTabButton.Width = 150
$runAllButton = New-Object System.Windows.Forms.Button; $runAllButton.Text = "Executar Tudo"; $runAllButton.Dock = "Left"; $runAllButton.Width = 150
$clearLogButton = New-Object System.Windows.Forms.Button; $clearLogButton.Text = "Limpar Log"; $clearLogButton.Dock = "Right"; $clearLogButton.Width = 120
$closeButtonMain = New-Object System.Windows.Forms.Button; $closeButtonMain.Text = "Fechar"; $closeButtonMain.Dock = "Right"; $closeButtonMain.Width = 120
$mainButtonPanel.Controls.AddRange(@($runAllButton, $runCurrentTabButton, $clearLogButton, $closeButtonMain))

$progressPanel = New-Object System.Windows.Forms.Panel; $progressPanel.Height = 30; $progressPanel.Dock = "Bottom"; $progressPanel.Padding = New-Object System.Windows.Forms.Padding(5)
$progressBar = New-Object System.Windows.Forms.ProgressBar; $progressBar.Dock = "Fill"; $progressBar.Visible = $false
$progressPanel.Controls.Add($progressBar)
$mainAreaPanel = New-Object System.Windows.Forms.Panel; $mainAreaPanel.Dock = "Fill"
$tabControl.Dock = "Top"; $tabControl.Height = 350
$statusGroup.Dock = "Fill"
$mainAreaPanel.Controls.AddRange(@($statusGroup, $tabControl))
$form.Controls.AddRange(@($mainAreaPanel, $titleBar, $mainButtonPanel, $progressPanel))
$script:controlsToToggle = @($tabControl, $runAllButton, $runCurrentTabButton, $scanChocoButton, $updateChocoButton, $scanRegButton, $searchForUpdateButton, $uninstallRegButton, $clearLogButton, $analyzeRegButton, $backupRegButton, $cleanRegButton)

# --- LOGICA PRINCIPAL E EVENTOS ---
$systemTasks = [ordered]@{
    "Validar/Alterar Nome da Maquina"          = { Handle-Hostname }
    "Ativar o Windows"                         = { Activate-Windows }
    "Instalar Gerenciador de Pacotes Chocolatey" = { Install-Chocolatey }
    "Instalar Microsoft Visual C++ Runtimes"   = { Install-VCRedist }
    "Instalar .NET Framework"                  = { Install-DotNetFX }
    "Definir Versao de Destino do Windows (24H2)" = { Set-TargetReleaseVersion }
    "Forcar Todas as Atualizacoes do Windows"  = { Force-WindowsUpdates }
}
$personalizationTasks = [ordered]@{
    "Configurar Tema e Barra de Tarefas"       = { Configure-System-ThemeAndTaskbar }
    "Configurar Wallpaper do Windows (com Selecao)" = { Configure-System-Wallpaper }
    "(BETA) Instalar Fundos do Microsoft Teams (Ainda nao legal pro teams novo)"  = { Configure-Teams-Backgrounds }
}
$appTasks = [ordered]@{
    "Instalar Softphone"                       = { Install-Softphone }
    "Instalar OneDrive"                        = { Install-OneDrive }
}
$allAppDefinitions = $script:config.RecommendedApps + $script:config.OptionalApps
$allAppDefinitions | ForEach-Object {
    $app = $_
    $taskName = "Instalar $($app.Name)"
    $taskAction = [scriptblock]::Create("Install-App -appInfo ([pscustomobject]@{'Name'='$($app.Name)';'ChocoPackage'='$($app.ChocoPackage)';'Executable'='$($app.Executable)'})")
    $appTasks.Add($taskName, $taskAction)
}
$shortcutTasks = [ordered]@{ }
$script:config.WebShortcuts | ForEach-Object {
    $shortcut = $_
    $taskName = "Criar Atalho: $($shortcut.Name)"
    $taskAction = [scriptblock]::Create("Create-SingleWebShortcut -ShortcutName '$($shortcut.Name)'")
    $shortcutTasks.Add($taskName, $taskAction)
}
$debloatTasks = [ordered]@{
    "Desativar Telemetria"                     = { Disable-Telemetry }
    "Ajustar para Melhor Desempenho"           = { Adjust-For-Performance }
    "Limpar Prefetch do Windows"               = { Clean-Prefetch }
    "Esvaziar Lixeira"                         = { Empty-RecycleBin }
    "Executar Limpeza de Disco Avancada"       = { Disk-Cleanup }
    "Limpar Arquivos Temporarios de Instalacao" = { Clean-TempFiles }
}

$endpointSecurityTasks = [ordered]@{
    "Instalar Trend Micro (Subscricao NFR)" = { Install-TrendMicroAgent -SubscriptionType "NFR" -ActivationUrl "https://wfbs-svc-nabu.trendmicro.com/scansource_br:f80e424527c74decad12f7d4f519d706/download/pt/view/activation_mgclink?id=la8EQHxcCAR-qQ2yx9sL6wZQpAVk-iRH6T9w5U1zRDGn13cJ3T-PisiQ74SfuUBUYegl6tmbSzq25eoUyFljyJi9vNiPYLzKPT_r-JQvLFSV7ZundxYfo8PTuN8e_vgne9ZyQHNJZEwAuBEnvpczbw%3D%3D&store=1&pscd=scd6GSqa" }
    "Instalar Trend Micro (Subscricao Paga)" = { Install-TrendMicroAgent -SubscriptionType "Paga" -ActivationUrl "https://wfbs-svc-nabu.trendmicro.com/scansource_br:f80e424527c74decad12f7d4f519d706/download/en/view/activation_mgclink?id=c_PkZgH9vGVgXwp4nTZjNxJY8zsDLWE7eI8Z1sxW3282gCYv7DtA0WUrTcF8c6SDZV2aACx-Y0C4aHBbLJp4IssPsmadDKR42iBZKqHWmGfxsVb0U7F234d8D50LOwUPwNjqOk_SFeDWXv6xZUh3SQ%3D%3D&store=1&pscd=wzjvpzqa" }
}
$maintenanceTasks = [ordered]@{
    "Verificar Integridade do Sistema (SFC)"       = { Run-SFC-Scan }
    "Reparar Imagem do Windows (DISM)"             = { Run-DISM-Repair }
    "Verificar Disco (Chkdsk - requer reinicializacao)" = { Run-Chkdsk }
    "Limpar Cache de DNS"                          = { Flush-DNS-Cache }
    "Redefinir Catalogo Winsock (requer reinicializacao)" = { Reset-Winsock }
    "Manutencao OneDrive"                          = { Validate-And-Repair-OneDrive }
}

# --- Populacao Inicial dos Controles ---
$systemTasks.Keys | ForEach-Object { $systemCheckedListBox.Items.Add($_, $false) }
$maintenanceTasks.Keys | ForEach-Object { $maintenanceCheckedListBox.Items.Add($_, $false) }
$personalizationTasks.Keys | ForEach-Object { $personalizationCheckedListBox.Items.Add($_, $false) } # Alterado
Populate-AppsTreeView
$debloatTasks.Keys | ForEach-Object { $debloatCheckedListBox.Items.Add($_, $false) } # Alterado
# AJUSTE: Popula o novo ListView com um status placeholder

$endpointSecurityTasks.Keys | ForEach-Object { $endpointSecurityCheckedListBox.Items.Add($_, $false) }
Add-ListViewColumns $bloatwarePanel.Control @("(#)", "Nome", "Status")

# --- Associacao de Eventos ---

$script:progressTimer.Add_Tick({
    if (-not $script:executionJob) {
        $script:progressTimer.Stop()
        return
    }

    $messages = Receive-Job $script:executionJob
    if ($messages) {
        foreach ($msg in $messages) {
            if ($msg -isnot [string]) { continue }
            if ($msg.StartsWith("PROGRESS:")) {
                $parts = $msg.Split(":")
                $percent = [int]$parts[1]; $taskName = $parts[2]
                if ($script:loadingOverlay -and $script:loadingOverlay.IsHandleCreated) {
                    $script:loadingOverlay.Controls[1].Text = "Executando: $taskName..."
                    $script:loadingOverlay.Controls[0].Value = $percent
                }
            }
            elseif ($msg.StartsWith("LOG:")) {
                Update-Status $msg.Substring(4)
            }
        }
    }

    if ($script:executionJob.State -in @('Completed', 'Failed', 'Stopped')) {
        $script:progressTimer.Stop()
        
        # --- MUDANcA APLICADA AQUI ---
        # Pega toda a saida do job para encontrar as mensagens finais
        $allFinalOutput = (Get-Job -Id $script:executionJob.Id).ChildJobs[0].Output
        
        $finalMessage = $allFinalOutput | Where-Object { $_ -like "COMPLETE:*" } | Select-Object -Last 1
        $anyTaskFailed = $false
        if ($finalMessage -and ($finalMessage.ToString().Split(":")[1] -eq 'True')) {
            $anyTaskFailed = $true
        }

        # Nova logica para ler o status de reboot
        $rebootMessage = $allFinalOutput | Where-Object { $_ -like "REBOOT_REQUIRED:*" } | Select-Object -Last 1
        if ($rebootMessage -and ($rebootMessage.ToString().Split(":")[1] -eq 'True')) {
            $script:rebootRequired = $true
        }

        if ($script:loadingOverlay -and $script:loadingOverlay.IsHandleCreated) {
            $script:loadingOverlay.Close(); $script:loadingOverlay.Dispose()
        }
        $script:controlsToToggle.ForEach({ if ($_.IsHandleCreated) { $_.Enabled = $true } })

        if ($anyTaskFailed) { Update-Status "Execucao concluida com uma ou mais falhas." } else { Update-Status "Execucao concluida com sucesso." }

        if ($script:dismRepairSuggested) {
            [System.Windows.Forms.MessageBox]::Show("O Windows nao encontrou os arquivos para instalar/alterar um ou mais recursos.`n`nRecomenda-se executar 'Reparar Imagem do Windows (DISM)' e 'Verificar Integridade do Sistema (SFC)'.", "Sugestao de Reparo", "OK", "Information")
        }
        if ($script:rebootRequired) {
            [System.Windows.Forms.MessageBox]::Show("Uma ou mais tarefas requerem que o computador seja reiniciado para aplicar as alteracoes.", "Reinicializacao Necessaria", "OK", "Warning")
        }

        Remove-Job $script:executionJob -Force
        $script:executionJob = $null
    }
})

$form.Add_FormClosing({
    $script:stopLogJob = $true
    if ($script:logJob) {
        # Para o job antes de tentar remove-lo
        Stop-Job $script:logJob
        # O parâmetro -Force garante a remocao mesmo que o estado nao seja 'Completed'
        Remove-Job $script:logJob -Force
    }
})
$appsTreeView.Add_AfterCheck({
    param($sender, $e)

    # Ignora qualquer alteracao se ja estivermos no meio de uma atualizacao para evitar loops
    if ($script:isUpdatingChecks) { return }

    try {
        # Ativa a trava para dizer que estamos atualizando
        $script:isUpdatingChecks = $true
        
        $currentNode = $e.Node

        # PARTE 1: Se o nó clicado for um PAI, atualiza todos os seus filhos
        if ($currentNode.Nodes.Count -gt 0) {
            foreach ($childNode in $currentNode.Nodes) {
                $childNode.Checked = $currentNode.Checked
            }
        }

        # PARTE 2: Se o nó clicado for um FILHO, atualiza o seu pai
        if ($currentNode.Parent -ne $null) {
            # Verifica se todos os "irmaos" estao marcados
            $allSiblingsChecked = $true
            foreach ($siblingNode in $currentNode.Parent.Nodes) {
                if (-not $siblingNode.Checked) {
                    $allSiblingsChecked = $false
                    break
                }
            }
            # Atualiza o pai com base no estado dos filhos
            $currentNode.Parent.Checked = $allSiblingsChecked
        }
    }
    finally {
        # Libera a trava, permitindo que o proximo clique funcione
        $script:isUpdatingChecks = $false
    }
})
$closeButtonMain.Add_Click({ $form.Close() })
$clearLogButton.Add_Click({ $statusBox.Clear() })
$runAllButton.Add_Click({ Start-Execution -AllTabs })
$runCurrentTabButton.Add_Click({ Start-Execution })
$filesPanel.AnalyzeButton.Add_Click({ Analyze-CleanableFiles })
$filesPanel.CleanButton.Add_Click({ Clean-SelectedFiles })
$scanChocoButton.Add_Click({ Scan-OutdatedChocoApps })
$updateChocoButton.Add_Click({ Update-SelectedChocoApps })
$scanRegButton.Add_Click({ Scan-RegistryApps })
$uninstallRegButton.Add_Click({ Uninstall-SelectedApps })
$bloatwarePanel.AnalyzeButton.Add_Click({ Analyze-Bloatware })
$bloatwarePanel.CleanButton.Add_Click({ Apply-BloatwareActions })
$analyzeRegButton.Add_Click({ Analyze-RegistryIssues })
$backupRegButton.Add_Click({ Backup-SelectedRegistryIssues })
$cleanRegButton.Add_Click({ Clean-SelectedRegistryIssues })
$regCleanerListView.Add_ItemChecked({
    param($sender, $e)
    $count = $this.CheckedItems.Count
    $regCleanerSummaryLabel.Text = "Total de itens selecionados: $count"
})

$script:initialScanTimer.Add_Tick({
    # Este timer executa apenas uma vez, 100ms apos a janela abrir.
    $script:initialScanTimer.Stop()

    $progressBar.Visible = $true
    $progressBar.Style = 'Marquee'
    $form.Refresh()
    try {
        Update-Status "Analisando status dos aplicativos nativos..."
        Analyze-Bloatware

        Update-Status "Verificando atualizacoes de aplicativos (Chocolatey)..."
        Scan-OutdatedChocoApps

        Update-Status "Verificando todos os aplicativos instalados (Registro)..."
        Run-Task "Verificar Todos os Aplicativos Instalados (Registro)" {
            Update-RegisteredAppsList
        }

        Update-Status "Analises iniciais concluidas."
    } catch {
        Update-Status "ERRO durante a analise inicial: $($_.Exception.Message)"
    } finally {
        $progressBar.Visible = $false
        $progressBar.Style = 'Continuous'
    }
})

$filesPanel.Control.Add_AfterCheck({
    param($sender, $e)

    # --- PARTE 1: Lógica de selecao Pai/Filho ---
    # Ignora qualquer alteracao se ja estivermos no meio de uma atualizacao para evitar loops
    if ($script:isUpdatingChecks) { return }

    try {
        # Ativa a trava para dizer que estamos atualizando
        $script:isUpdatingChecks = $true
        
        $currentNode = $e.Node

        # Se o nó clicado for um PAI, atualiza todos os seus filhos
        if ($currentNode.Nodes.Count -gt 0) {
            foreach ($childNode in $currentNode.Nodes) {
                $childNode.Checked = $currentNode.Checked
            }
        }

        # Se o nó clicado for um FILHO, atualiza o seu pai
        if ($currentNode.Parent -ne $null) {
            $allSiblingsChecked = $true
            foreach ($siblingNode in $currentNode.Parent.Nodes) {
                if (-not $siblingNode.Checked) {
                    $allSiblingsChecked = $false
                    break
                }
            }
            $currentNode.Parent.Checked = $allSiblingsChecked
        }

        # --- PARTE 2: Lógica de calculo de tamanho (o seu código original) ---
        # Após a atualizacao dos checks, recalculamos o tamanho total.
        $totalSize = 0
        function Get-CheckedLeafNodesSize($nodeCollection) {
            $size = 0
            foreach ($node in $nodeCollection) {
                if ($node.Nodes.Count -eq 0 -and $node.Checked) { $size += $node.Tag.Size }
                elseif ($node.Nodes.Count -gt 0) { $size += Get-CheckedLeafNodesSize $node.Nodes }
            }
            return $size
        }
        $totalSize = Get-CheckedLeafNodesSize $filesPanel.Control.Nodes
        $formattedSize = (Get-DirectorySize-Formatted $totalSize).Formatted
        $filesPanel.SummaryLabel.Text = "Total a ser limpo: $formattedSize"

    }
    finally {
        # Libera a trava, permitindo que o proximo clique funcione
        $script:isUpdatingChecks = $false
    }
})
$regUpdatesListView.Add_ItemChecked({ $uninstallRegButton.Enabled = ($this.CheckedItems.Count -gt 0) })
$regUpdatesListView.Add_SelectedIndexChanged({ $searchForUpdateButton.Enabled = ($this.SelectedItems.Count -gt 0) })
$searchForUpdateButton.Add_Click({
    if ($regUpdatesListView.SelectedItems.Count -gt 0) {
        $appName = $regUpdatesListView.SelectedItems[0].SubItems[1].Text
        if (-not [string]::IsNullOrWhiteSpace($appName)) {
            $encodedAppName = [System.Web.HttpUtility]::UrlEncode("$appName download da ultima versao")
            Start-Process "https://www.google.com/search?q=$encodedAppName"
        }
    }
})
$bloatwarePanel.Control.Add_ItemCheck({ param($sender, $e)
    $item = $this.Items[$e.Index]
    $actionInfo = $item.Tag
    if ($actionInfo.Action -eq 'None') { $e.NewValue = [System.Windows.Forms.CheckState]::Unchecked; return }
    if ($e.NewValue -eq [System.Windows.Forms.CheckState]::Checked) {
        if ($actionInfo.Action -eq 'Remove') { $item.ForeColor = [System.Drawing.Color]::Red }
        elseif ($actionInfo.Action -eq 'Install') { $item.ForeColor = [System.Drawing.Color]::Green }
        elseif ($actionInfo.Action -eq 'Upgrade') { $item.ForeColor = [System.Drawing.Color]::Blue }
    } else {
        if ($actionInfo.Action -eq 'Remove' -or $actionInfo.Action -eq 'Upgrade') { $item.ForeColor = $script:themeColors.Foreground }
        elseif ($actionInfo.Action -eq 'Install') { $item.ForeColor = [System.Drawing.Color]::DarkGray }
    }
})
$tabControl.Add_SelectedIndexChanged({
    $runnableTabs = @("Sistema e Manutencao", "Personalizacao", "Softwares", "Otimizacao e Bloatware", "Endpoint Security")
    $runCurrentTabButton.Enabled = $tabControl.SelectedTab.Text -in $runnableTabs

    if (($tabControl.SelectedTab.Text -eq "Limpeza de Arquivos e Registros") -and (-not $script:cleanupTabHasBeenAnalyzed)) {
        Update-Status "Executando analise inicial da aba de limpeza..."
        Analyze-CleanableFiles
        Analyze-RegistryIssues
        $script:cleanupTabHasBeenAnalyzed = $true
        Update-Status "Analise inicial da limpeza concluida."
    }

    # AJUSTE: Adicionada a logica para popular a lista de apps do registro a partir do cache.
    if (($tabControl.SelectedTab.Text -eq "Softwares") -and ($regUpdatesListView.Items.Count -eq 0) -and ($null -ne $script:cachedRegisteredApps)) {
        Update-Status "Preenchendo lista de aplicativos instalados a partir do cache..."
        $regUpdatesListView.BeginUpdate()
        $counter = 1
        foreach ($app in $script:cachedRegisteredApps) {
            if ([string]::IsNullOrWhiteSpace($app.Name)) { continue }
            $item = New-Object System.Windows.Forms.ListViewItem($counter.ToString())
            $item.SubItems.Add($app.Name)
            $item.SubItems.Add($(if (-not [string]::IsNullOrWhiteSpace($app.Version)) { $app.Version } else { "N/D" }))
            $item.SubItems.Add($(if (-not [string]::IsNullOrWhiteSpace($app.Publisher)) { $app.Publisher } else { "N/D" }))
            $item.Tag = $app.UninstallString
            $regUpdatesListView.Items.Add($item) | Out-Null
            $counter++
        }
        $regUpdatesListView.EndUpdate()
        $regUpdatesListView.AutoResizeColumns([System.Windows.Forms.ColumnHeaderAutoResizeStyle]::HeaderSize)
    }
})

# --- Inicializacao do Formulario ---
$form.Add_Shown({
    $form.Activate()

    try {
        Update-Status "Baixando icone do cabecalho..."
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
        $imageData = $webClient.DownloadData($script:config.LogoUrl)
        $memoryStream = New-Object System.IO.MemoryStream(,$imageData)        
        $titleIcon.Image = [System.Drawing.Image]::FromStream($memoryStream)
        Update-Status "Icone carregado com sucesso."
    } catch {
        Update-Status "AVISO: Nao foi possivel carregar o logo da URL: $($_.Exception.Message.Trim()). O icone nao sera exibido."
    }

    Populate-GodModeList
    Set-FormTitleBarColor -Form $form -TitleBarBackgroundColor $script:themeColors.Accent -TitleBarTextColor $script:themeColors.ForegroundButton
    Update-Status "Interface pronta. Disparando analises iniciais..."

    # Inicia o timer para as analises de inicializacao de forma segura.
    $script:initialScanTimer.Interval = 100
    $script:initialScanTimer.Start()
})

Apply-DarkTheme -Control $form
[void]$form.ShowDialog()
$form.Dispose()

