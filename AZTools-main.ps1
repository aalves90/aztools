# ===================================================================================
# Automacoes para Windows
# Criado pensando em facilitar a vida na AZCorp Tech
# ===================================================================================
# --- BLOCO DE CONFIGURACAO CENTRAL ---
$script:config = @{
	LogoUrl               = "https://i.postimg.cc/mgwTK81L/favicon-48x48.png"
	WallpapersUrl         = "https://azcorp.tech/img-public/wallpapers/"
    TeamsBackgroundsUrl   = "https://azcorp.tech/img-public/teams/"
    OneDriveUrl           = "https://go.microsoft.com/fwlink/p/?linkid=844652"
    TargetReleaseVersion  = "25H2"

    Softphone = @{
        InstallerUrl    = "https://github.com/foriptecnologia/softphone/releases/download/v1.0.9/softphone.Setup.1.0.9.exe"
        Executable      = "softphone.exe"
    }
    
    # Aplicativos padrao recomendados pela AZCorp
    RecommendedApps = @(
		@{ Name = "softphone 1.0.9";       			ChocoPackage = "softphone-interno";               Executable = "softphone.exe" },
		@{ Name = "7-Zip";                           ChocoPackage = "7zip";                           Executable = "7zFM.exe" },
        @{ Name = "Microsoft Edge";                  ChocoPackage = "microsoft-edge";                 Executable = "msedge.exe" },
		@{ Name = "Microsoft Teams";                 ChocoPackage = "microsoft-teams-new-bootstrapper"; Executable = "ms-teams.exe" },
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
        # ==========================================================
        # NAVEGADORES (Base Chromium, Gecko e Legacy)
        # ==========================================================
		"Microsoft Edge" = @{
            Processes = @("msedge", "msedge_proxy", "pwahelper");
            # O '*' garante que pegue todos os perfis (Default, Profile 1, etc.)
            "Cache de Internet (Geral)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Cache", "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Network\Cache") }
            "Code Cache (JS Compilado - Pesado)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Code Cache") }
            "Service Worker (Apps/Sites Pesados)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Service Worker\CacheStorage", "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Service Worker\ScriptCache") }
            "GPU & Shader Cache" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\GPUCache", "$env:LOCALAPPDATA\Microsoft\Edge\User Data\ShaderCache") }
            "Arquivos Temporários (Blob)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Blob Storage") }
            "Cookies e Histórico" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Network\Cookies", "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\History") }
        }
        "Google Chrome" = @{
            Processes = @("chrome");
            "Cache de Internet (Geral)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\*\Cache", "$env:LOCALAPPDATA\Google\Chrome\User Data\*\Network\Cache") }
            "Code Cache (JS Compilado)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\*\Code Cache") }
            "Service Worker (Apps/Sites)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\*\Service Worker\CacheStorage", "$env:LOCALAPPDATA\Google\Chrome\User Data\*\Service Worker\ScriptCache") }
            "GPU & Shader Cache" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\*\GPUCache", "$env:LOCALAPPDATA\Google\Chrome\User Data\ShaderCache") }
            "Cookies e Histórico" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Google\Chrome\User Data\*\Network\Cookies", "$env:LOCALAPPDATA\Google\Chrome\User Data\*\History") }
        }
        "Opera Stable" = @{ 
            Processes = @("opera", "opera_crashreporter");
            # Opera as vezes usa 'Opera Stable' ou apenas 'Opera' dependendo da versao
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Opera Software\Opera Stable\Cache", "$env:LOCALAPPDATA\Opera Software\Opera Stable\Default\Cache", "$env:LOCALAPPDATA\Opera Software\Opera Stable\*\Cache", "$env:LOCALAPPDATA\Opera Software\Opera Stable\*\Code Cache") }
            "Service Worker" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Opera Software\Opera Stable\Default\Service Worker\CacheStorage", "$env:LOCALAPPDATA\Opera Software\Opera Stable\Service Worker\CacheStorage") }
            "GPU Cache" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Opera Software\Opera Stable\GPUCache", "$env:LOCALAPPDATA\Opera Software\Opera Stable\Default\GPUCache") }
        }
        "Internet Explorer (Legacy)" = @{
            Processes = @("iexplore");
            "Arquivos Temp. Internet" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Windows\INetCache\IE", "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\Low\IE") }
            "Cookies" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Windows\INetCookies", "$env:APPDATA\Microsoft\Windows\Cookies") }
            "Historico" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Windows\History") }
        }
        "Mozilla Firefox" = @{
            Processes = @("firefox");
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*\cache2", "$env:LOCALAPPDATA\Mozilla\Firefox\Profiles\*\startupCache") }
            "Crash Reports" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Mozilla\Firefox\Crash Reports") }
        }
        "Brave Browser" = @{
            Processes = @("brave");
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Cache") }
        }
        "Vivaldi" = @{
            Processes = @("vivaldi");
            "Cache de Navegacao" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Vivaldi\User Data\Default\Cache") }
        }

        # ==========================================================
        # COMUNICACAO E REUNIOES
        # ==========================================================
        "Microsoft Teams (Novo)" = @{
            Processes = @("ms-teams", "msteams");
            "Cache Geral" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams") }
            "Logs de Diagnostico" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Logs") }
        }
        "Microsoft Teams (Classico)" = @{
            Processes = @("Teams");
            "Cache Geral" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Microsoft\Teams\Cache", "$env:APPDATA\Microsoft\Teams\Code Cache", "$env:APPDATA\Microsoft\Teams\GPUCache", "$env:APPDATA\Microsoft\Teams\blob_storage", "$env:APPDATA\Microsoft\Teams\databases", "$env:APPDATA\Microsoft\Teams\IndexedDB", "$env:APPDATA\Microsoft\Teams\Local Storage", "$env:APPDATA\Microsoft\Teams\tmp") }
            "Logs Antigos" = @{ Type = "File"; Path = @("$env:APPDATA\Microsoft\Teams\logs.txt") }
        }
        "Discord" = @{
            Processes = @("Discord");
            "Cache Geral" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\discord\Cache", "$env:APPDATA\discord\Code Cache", "$env:APPDATA\discord\GPUCache") }
        }
        "Slack" = @{
            Processes = @("slack");
            "Cache de Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Slack\Cache", "$env:APPDATA\Slack\Code Cache", "$env:APPDATA\Slack\GPUCache") }
        }
        "WhatsApp" = @{
            Processes = @("WhatsApp");
            "Cache de Midia/Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\WhatsApp\Cache", "$env:APPDATA\WhatsApp\Code Cache", "$env:APPDATA\WhatsApp\GPUCache") }
            "Service Worker" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\WhatsApp\Service Worker\CacheStorage") }
        }
        "Telegram" = @{
            Processes = @("Telegram");
            "Cache de Imagens/Temp" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Telegram Desktop\tdata\user_data\cache", "$env:APPDATA\Telegram Desktop\tdata\temp") }
        }
        "Zoom" = @{
            Processes = @("Zoom");
            "Logs de Reuniao" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Zoom\logs") }
            "Cache de Dados" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Zoom\data") }
        }
        "Skype" = @{
            Processes = @("Skype");
            "Cache de Navegador Interno" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Microsoft\Skype for Desktop\Cache", "$env:APPDATA\Microsoft\Skype for Desktop\Code Cache") }
        }
        "Cisco Webex" = @{
            Processes = @("CiscoCollabHost");
            "Cache e Logs" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\CiscoSpark") }
        }

        # ==========================================================
        # PRODUTIVIDADE E ESCRITORIO
        # ==========================================================
        "Microsoft Office 365" = @{
            Processes = @("winword", "excel", "powerpnt", "outlook");
            "Office File Cache (FSD)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache") }
            "Cache de Solucoes (Add-ins)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Office\SolutionPackages") }
            "Logs de Telemetria" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\Office\16.0\Telemetry") }
            "Arquivos Temporarios do Word" = @{ Type = "File"; Path = @("$env:APPDATA\Microsoft\Word\*.tmp", "$env:APPDATA\Microsoft\Word\~*.*") }
        }
        "Adobe Acrobat Reader" = @{
            Processes = @("AcroRd32", "Acrobat");
            "Cache de Visualizacao (ACR)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Adobe\Acrobat\*\Cache") }
            "Arquivos de Instalacao (Setup)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Adobe\Setup") }
        }
        "Adobe Creative Cloud" = @{
            Processes = @("Adobe Desktop Service", "CCXProcess");
            "Media Cache (Common)" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Adobe\Common\Media Cache Files", "$env:APPDATA\Adobe\Common\Media Cache") }
            "Logs de Instalacao" = @{ Type = "File"; Path = @("$env:ProgramFiles(x86)\Common Files\Adobe\Installers\*.log.gz") }
        }
        "LibreOffice" = @{
            Processes = @("soffice", "swriter", "scalc");
            "Cache de Usuario" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\LibreOffice\4\user\cache") }
            "Backups Temporarios" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\LibreOffice\4\user\backup") }
        }
        "Notepad++" = @{
            Processes = @("notepad++");
            "Backups Nao Salvos" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Notepad++\backup") }
        }

        # ==========================================================
        # FERRAMENTAS DE TI, ACESSO REMOTO E DEV
        # ==========================================================
		"Remote Desktop (RDP)" = @{
            Processes = @("mstsc");
            # O wildcard *.bin pega o cache de bitmap que ocupa centenas de MB
            "Cache de Bitmap (Imagens)" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Microsoft\Terminal Server Client\Cache\*.bin", "$env:LOCALAPPDATA\Microsoft\Terminal Server Client\Cache\*.bmc") }
            "Cache de Banco de Dados" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Microsoft\Terminal Server Client\Cache\*.db") }
        }
        "AnyDesk" = @{
            Processes = @("AnyDesk");
            "Logs de Conexao" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\AnyDesk\ad_logs", "$env:PROGRAMDATA\AnyDesk\ad_logs") }
            "Trace Files" = @{ Type = "File"; Path = @("$env:APPDATA\AnyDesk\*.trace") }
        }
        "TeamViewer" = @{
            Processes = @("TeamViewer");
            "Logs de Sessao" = @{ Type = "File"; Path = @("$env:APPDATA\TeamViewer\Connections*.txt") }
        }
        "Visual Studio Code" = @{
            Processes = @("Code");
            "Cache de Codigo" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\Code\Cache", "$env:APPDATA\Code\CachedData", "$env:APPDATA\Code\GPUCache", "$env:APPDATA\Code\Service Worker\CacheStorage") }
        }
        "Visual Studio (IDE)" = @{
            Processes = @("devenv");
            "Component Cache" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\VisualStudio\*\ComponentModelCache") }
            "Arquivos Temporarios" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Microsoft\VisualStudio\*\*.tmp") }
        }
        "WinRAR" = @{
            Processes = @("WinRAR");
            "Arquivos Temporarios (Drag-Drop)" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\WinRAR\Temp") }
        }
        "7-Zip" = @{
            Processes = @("7zFM");
            "Pastas Temporarias Esquecidas" = @{ Type = "FolderContent"; Path = @("$env:TEMP\7z*") }
        }

        # ==========================================================
        # MULTIMIDIA E JOGOS
        # ==========================================================
        "Spotify" = @{
            Processes = @("Spotify");
            "Cache de Midia (Storage)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Spotify\Data", "$env:LOCALAPPDATA\Spotify\Storage") }
            "Browser Cache" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Spotify\Browser\Cache") }
        }
        "VLC Media Player" = @{
            Processes = @("vlc");
            "Cache de Capas de Album (Art)" = @{ Type = "FolderContent"; Path = @("$env:APPDATA\vlc\art") }
        }
        "Steam" = @{
            Processes = @("steam");
            "Browser Cache (Loja)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Steam\htmlcache", "$env:ProgramFiles(x86)\Steam\appcache\httpcache") }
        }
        "NVIDIA" = @{
            Processes = @();
            "Cache de Instalador (Downloader)" = @{ Type = "FolderContent"; Path = @("$env:ProgramData\NVIDIA Corporation\Downloader") }
            "Cache de Shader (GLCache)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\NVIDIA\GLCache") }
        }
        "AMD" = @{
            Processes = @();
            "Cache de Shader (DX)" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\AMD\DxCache") }
        }

        # ==========================================================
        # ANTIVIRUS E SEGURANCA (LOGS)
        # ==========================================================
        "McAfee" = @{
            Processes = @();
            "Logs de Escaneamento" = @{ Type = "FolderContent"; Path = @("$env:ProgramData\McAfee\DesktopProtection\Logs") }
        }
        "Symantec / Norton" = @{
            Processes = @();
            "Logs e Historico" = @{ Type = "FolderContent"; Path = @("$env:ProgramData\Norton\{0C55C096-0F1D-4F28-AAA2-85EF591126E7}\SRTSP\Logs") } # GUID pode variar
        }
        "Java (Sun)" = @{
            Processes = @("java", "javaw");
            "Cache de Applets" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\Sun\Java\Deployment\cache") }
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
	# URLs para o instalador automatico do Winget (se necessario)
    VCLibsUrl           = "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
    WingetInstallerUrl  = "https://github.com/microsoft/winget-cli/releases/download/v1.7.11132/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
}

# --- PREPARACAO DO AMBIENTE ---
# Forca o uso do protocolo TLS 1.2 para todas as conexoes web
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
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

# --- Bloco de Verificacao de Compatibilidade ---
if ($PSVersionTable.PSVersion.Major -lt 5) {
    [System.Windows.Forms.MessageBox]::Show("ERRO: Este script requer PowerShell 5.1 ou superior.`nSua versao atual e: $($PSVersionTable.PSVersion.Major).", "Versao Incompativel", "OK", "Error")
    exit
}
if ([System.Environment]::OSVersion.Version.Major -lt 10) {
    [System.Windows.Forms.MessageBox]::Show("ERRO: Este script e compativel apenas com Windows 10 e Windows 11.`nSistema operacional nao suportado.", "OS Incompativel", "OK", "Error")
    exit
}

$csharpCode = @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
Add-Type -TypeDefinition $csharpCode -ErrorAction SilentlyContinue

$user32Source = @"
using System;
using System.Runtime.InteropServices;
public class User32 {
    [DllImport("user32.dll")]
    public static extern bool SetProcessDPIAware();
}
"@
Add-Type -TypeDefinition $user32Source -ErrorAction SilentlyContinue
[User32]::SetProcessDPIAware() | Out-Null

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
$script:progressTimer.Interval = 250 # Verifica o progresso 4 vezes por segundo

# Cache para a lista de aplicativos instalados, para evitar re-scans desnecessarios
$script:cachedInstalledApps = $null

# NOVO: Cache para a lista de Recursos do Windows
$script:cachedWindowsFeatures = $null

# Variavel para armazenar o estado da ordenacao das tabelas
$script:listViewSortState = @{}

#Criar um timer para fechar o programa em 15 min
$script:shutdownTimer = New-Object System.Windows.Forms.Timer
$script:shutdownSecondsRemaining = 15 * 60 # 15 minutos em segundos

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
      
    # Botão Marcar Todos
    $selectAllBtn = New-Object System.Windows.Forms.Button
    $selectAllBtn.Text = "Marcar Todos"
    $selectAllBtn.Dock = "Left"
    $selectAllBtn.AutoSize = $true
    $selectAllBtn.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
    $selectAllBtn.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0) # Espaço interno para beleza

    # Botão Desmarcar Todos
    $deselectAllBtn = New-Object System.Windows.Forms.Button
    $deselectAllBtn.Text = "Desmarcar Todos"
    $deselectAllBtn.Dock = "Left"
    $deselectAllBtn.AutoSize = $true
    $deselectAllBtn.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
    $deselectAllBtn.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0) # Espaço interno para beleza
    
    # ------------------------------------
    
    $selectAllBtn.Add_Click({ 
        $targetControl = $this.Parent.Parent.Controls | Where-Object { $_ -isnot [System.Windows.Forms.Panel] }
        if ($targetControl) { Set-CheckedStateOnControl -Control $targetControl -State $true }
    })
    $deselectAllBtn.Add_Click({ 
        $targetControl = $this.Parent.Parent.Controls | Where-Object { $_ -isnot [System.Windows.Forms.Panel] }
        if ($targetControl) { Set-CheckedStateOnControl -Control $targetControl -State $false }
    })
    
    # A ordem aqui importa para o Dock=Left. O primeiro adicionado fica na extrema esquerda.
    $buttonPanel.Controls.AddRange(@($deselectAllBtn, $selectAllBtn))

    if (-not [string]::IsNullOrWhiteSpace($ExtraButtonText) -and $ExtraButtonAction) {
        $extraBtn = New-Object System.Windows.Forms.Button
        $extraBtn.Text = $ExtraButtonText
        $extraBtn.Dock = "Right"
        # Aplicamos a mesma lógica para o botão extra, caso ele exista
        $extraBtn.AutoSize = $true
        $extraBtn.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
        $extraBtn.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0)
        
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
    
    # --- CORREÇÃO: AutoSize ---
    $analyzeButton = New-Object System.Windows.Forms.Button; $analyzeButton.Text = $AnalyzeButtonText; $analyzeButton.Dock = "Left"
    $analyzeButton.AutoSize = $true; $analyzeButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $analyzeButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)
    
    $cleanButton = New-Object System.Windows.Forms.Button; $cleanButton.Text = $CleanButtonText; $cleanButton.Dock = "Right"; $cleanButton.Enabled = $false
    $cleanButton.AutoSize = $true; $cleanButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $cleanButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)
    # --------------------------
    
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
    
    $analyzeButton = New-Object System.Windows.Forms.Button; $analyzeButton.Text = $AnalyzeButtonText; $analyzeButton.Dock = "Left"
    $analyzeButton.AutoSize = $true; $analyzeButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $analyzeButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)
    
    $cleanButton = New-Object System.Windows.Forms.Button; $cleanButton.Text = $CleanButtonText; $cleanButton.Dock = "Right"; $cleanButton.Enabled = $false
    $cleanButton.AutoSize = $true; $cleanButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $cleanButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)
    # --------------------------
    
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
            if ($statusBox.Lines.Count -gt 500) {
                $statusBox.Select(0, $statusBox.GetFirstCharIndexFromLine(1))
                $statusBox.SelectedText = ""
            }
            # --------------------------------------------
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
            # CORRECAO: Garante que a acao e executavel, limpando espacos que
            # podem ter sido adicionados durante a passagem para o processo de fundo.
            if ($action -is [string]) {
                $action = [scriptblock]::Create($action.Trim())
            }
            $result = & $action
            if ($result -is [string] -and $result -eq "CANCELADO") {
                $script:taskResults[$description] = "CANCELADO"
                Update-Status "AVISO: A tarefa '$description' foi cancelada pelo usuario."
            }
            elseif ($result -is [string]) {
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
            
            # Este bloco garante o log maximo de detalhes para QUALQUER erro
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

# ==============================================================================
# [NOVO] FUNCOES DE CONTROLE DE PROCESSOS (KILL SWITCH)
# ==============================================================================

function Encerra-AplicativosBloqueadores {
    param([array]$NodesParaLimpar)

    # 1. Mapeamento Inteligente: Nome na Arvore (UI) -> Nome do Processo (Sistema)
    $MapaProcessos = @{
        "Google Chrome"    = "chrome"
        "Microsoft Edge"   = "msedge"
        "Opera"            = "opera"
        "Mozilla Firefox"  = "firefox"
        "Brave"            = "brave"
        "Internet Explorer"= "iexplore"
        "Teams"            = "Teams", "msteams", "ms-teams"
        "Discord"          = "Discord"
        "Spotify"          = "Spotify"
        "Steam"            = "steam"
        "OneDrive"         = "OneDrive"
        "WhatsApp"         = "WhatsApp"
    }

    $processosParaMatar = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

    # 2. Varre o que o usuario marcou para limpar e descobre quais apps estao envolvidos
    foreach ($node in $NodesParaLimpar) {
        # Verifica pelo Nome do Grupo (Pai) ou Texto do Item
        $textoItem = if ($node.Parent) { $node.Parent.Text } else { $node.Text }
        
        foreach ($chave in $MapaProcessos.Keys) {
            if ($textoItem -like "*$chave*") {
                $procs = $MapaProcessos[$chave]
                if ($procs -is [string]) { $processosParaMatar.Add($procs) | Out-Null }
                else { $procs | ForEach-Object { $processosParaMatar.Add($_) | Out-Null } }
            }
        }
        
        # Verifica se o proprio node tem processos definidos no codigo (Tag.Processes)
        if ($node.Tag -is [System.Collections.IDictionary] -and $node.Tag.ContainsKey('Processes')) {
             $node.Tag['Processes'] | ForEach-Object { $processosParaMatar.Add($_) | Out-Null }
        }
    }

    if ($processosParaMatar.Count -eq 0) { return }

    # 3. Executa o Kill Switch
    $listaNomes = [string]::Join(", ", $processosParaMatar)
    if (Confirm-Action "Para uma limpeza profunda (estilo CCleaner), os seguintes apps precisam ser fechados:`n`n$listaNomes`n`nDeseja fecha-los automaticamente agora?" "Modo de Limpeza Profunda") {
        Update-Status "Encerrando aplicativos para liberar arquivos..."
        foreach ($proc in $processosParaMatar) {
            Stop-Process-AndWait -processName $proc -timeoutSeconds 5
        }
        # Pausa vital para o Kernel do Windows liberar o handle do arquivo
        Start-Sleep -Seconds 2
    } else {
        Update-Status "AVISO: Voce optou por manter apps abertos. A limpeza pode falhar em alguns arquivos."
    }
}

function Gerenciar-Explorer {
    param(
        [string]$Acao # "Fechar" ou "Restaurar"
    )
    if ($Acao -eq "Fechar") {
        Update-Status "Encerrando Windows Explorer para limpar caches de sistema..."
        Stop-Process -Name "explorer" -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1
    }
    elseif ($Acao -eq "Restaurar") {
        if (-not (Get-Process -Name "explorer" -ErrorAction SilentlyContinue)) {
            Update-Status "Reiniciando Windows Explorer..."
            Start-Process "explorer.exe"
            Start-Sleep -Seconds 2 # Espera a interface voltar
        }
    }
}

function Test-NetConnectionSafe($hostname = "8.8.8.8") {
    if (-not (Test-Connection -ComputerName $hostname -Count 1 -Quiet)) {
        throw "Sem conexao com a internet ou o host '$hostname' nao esta alcancavel."
    }
}



function Download-File-Robust {
    param(
        [string]$Url, 
        [string]$OutFile,
        [string]$RefererUrl = $null
    )
    
    $webClient = $null
    try {
        # Criamos a nossa nova ferramenta de download
        $webClient = New-Object System.Net.WebClient

        # Adicionamos os mesmos cabecalhos de navegador que estavamos usando antes
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36")
		$webClient.Headers.Add("Accept", "image/png,image/jpeg,image/apng,image/*,*/*;q=0.8")
        $webClient.Headers.Add("Accept-Language", "en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7")

        if (-not [string]::IsNullOrWhiteSpace($RefererUrl)) {
            $webClient.Headers.Add("Referer", $RefererUrl)
        }

        # Usamos o metodo de download direto para arquivo.
        # Ele espera a conclusao e falha se houver um erro de rede (como 404, 403, etc.)
        $webClient.DownloadFile($Url, $OutFile)

    } catch {
        $errorMessage = "Falha no download (WebClient) de '$Url'. Motivo: $($_.Exception.Message.Trim())"
        Update-Status "ERRO: $errorMessage"
        throw $errorMessage
    } finally {
        # Garante que o objeto seja descartado para liberar recursos
        if ($webClient -ne $null) {
            $webClient.Dispose()
        }
    }
}

function Get-Image-List-From-Url {
    param([string]$Url)
    Update-Status "... Lendo o conteudo HTML de '$Url' (usando WebClient)..."

    $webClient = $null
    try {
        # --- ABORDAGEM FINAL: Usando WebClient para ler o HTML ---
        $webClient = New-Object System.Net.WebClient
        
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36")
        $webClient.Headers.Add("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")

        $htmlContent = $webClient.DownloadString($Url)

        $regex = [regex] 'href="([^"]+\.(png|jpg|jpeg|bmp|gif|webp))"'
        $matches = $regex.Matches($htmlContent)

        $fileList = $matches | ForEach-Object { $_.Groups[1].Value }

        if ($fileList.Count -eq 0) {
            throw "Nenhuma imagem encontrada na pagina. O HTML pode estar vazio ou o formato mudou."
        }
        
        Update-Status "... Encontradas $($fileList.Count) imagens via analise de HTML."
        return $fileList
    } catch {
         throw "Nao foi possivel analisar a pagina '$Url'. Erro: $($_.Exception.Message)"
    } finally {
        if ($webClient -ne $null) {
            $webClient.Dispose()
        }
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
		Download-File-Robust -Url $IconUrl -OutFile $tempIconPath -RefererUrl "$($uri.Scheme)://$($uri.Host)"    } catch {
        Update-Status "AVISO: Falha ao baixar o icone de '$IconUrl'. Erro: $($_.Exception.Message.Trim())"
        return $null
    }
    try {
        $iconTest = New-Object System.Drawing.Icon($tempIconPath); [void]$iconTest.Dispose()
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
    $searchPaths = @( $env:ProgramFiles, ${env:ProgramFiles(x86)}, (Join-Path $env:LOCALAPPDATA "Programs") )
    foreach ($path in $searchPaths) {
        if (-not (Test-Path $path)) { continue }

        # arante que apenas o primeiro resultado (como string) seja retornado.
        $foundPath = Get-ChildItem -Path $path -Filter $ExecutableName -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName -First 1
        if ($foundPath) {
		Update-Status "... Executavel '$ExecutableName' encontrado em: $foundPath" | Out-Null
            return $foundPath
        }
    }
    Update-Status "AVISO: Nao foi possivel encontrar o executavel '$ExecutableName' nas pastas padrao."
    return $null
}


function Ensure-ChocolateyIsInstalled {
    $chocoExe = "$env:ProgramData\chocolatey\bin\choco.exe"
    if (Test-Path $chocoExe) {
        return $true
    }
    
    Update-Status "AVISO: Chocolatey (gerenciador de pacotes) nao esta instalado. A instalacao sera iniciada automaticamente."
    try {
        Install-Chocolatey
        Update-Status "... Atualizando o PATH para a sessao atual."
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
        if (Test-Path $chocoExe) {
            Update-Status "Chocolatey instalado com sucesso e pronto para uso."
            return $true
        } else { 
            throw "A instalacao do Chocolatey parece ter falhado, o executavel nao foi encontrado apos a instalacao." 
        }
    } catch { 
        throw "ERRO CRITICO ao tentar instalar o Chocolatey: $($_.Exception.Message)" 
    }
    return $false
}

function Handle-Hostname {
    $currentHost = $script:hostname
    $newHost = [Microsoft.VisualBasic.Interaction]::InputBox("Valide ou altere o nome da maquina:", "Definir Hostname", $currentHost)
    if ($newHost -and $newHost -ne $currentHost) {
        Rename-Computer -NewName $newHost -Force
        $script:hostname = $newHost
        $script:rebootRequired = $true
        Update-Status "Hostname alterado para '$newHost'. Reinicializacao necessaria."
    } else { Update-Status "Hostname '$currentHost' mantido." }
}

function Activate-Windows {
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

function Install-Chocolatey {
    $chocoExe = "$env:ProgramData\chocolatey\bin\choco.exe"
    if (-not (Test-Path $chocoExe)) {
        Update-Status "--> Verificando conexao com a internet..."
        Test-NetConnectionSafe
        Update-Status "--> Definindo politica de execucao e protocolo de seguranca..."
        Set-ExecutionPolicy Bypass -Scope Process -Force
        
        Update-Status "--> Baixando e executando o script de instalacao do Chocolatey..."
        try {
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            Update-Status "--> Atualizando variaveis de ambiente..."
            & "$env:ProgramData\chocolatey\bin\refreshenv.cmd"
            Update-Status "--> Instalacao do Chocolatey parece ter sido bem-sucedida."
        } catch {
            Update-Status "ERRO CRITICO DURANTE A INSTALACAO DO CHOCOLATEY."
            $errorDetails = "--- ERRO DETALHADO (Chocolatey Install) ---`n" + ($_ | Out-String) + "--- FIM DO ERRO ---`n"
            Update-Status $errorDetails
            throw "Falha na instalacao do Chocolatey."
        }
    } else {
        Update-Status "--> Chocolatey ja esta instalado."
    }
}

function Install-VCRedist {
    Ensure-ChocolateyIsInstalled | Out-Null
    Update-Status "... Usando Chocolatey para instalar/atualizar os runtimes do Visual C++..."
    & "$env:ProgramData\chocolatey\bin\choco.exe" upgrade vcredist140 -y
}

function Install-DotNetFX {
    Ensure-ChocolateyIsInstalled | Out-Null
    Update-Status "... Usando Chocolatey para instalar/atualizar o .NET Framework..."
    & "$env:ProgramData\chocolatey\bin\choco.exe" upgrade dotnetfx -y
}

function Install-DotNetFX35 {
    Ensure-ChocolateyIsInstalled | Out-Null
    Update-Status "... Usando Chocolatey para instalar o .NET Framework 3.5..."
    & "$env:ProgramData\chocolatey\bin\choco.exe" install dotnet3.5 -y
}

function Install-DotNetFX48 {
    Ensure-ChocolateyIsInstalled | Out-Null
    Update-Status "... Usando Chocolatey para instalar o .NET Framework 4.8..."
    & "$env:ProgramData\chocolatey\bin\choco.exe" install dotnet-4.8 -y
}

function Install-DirectX {
    Ensure-ChocolateyIsInstalled | Out-Null
    Update-Status "... Usando Chocolatey para instalar o DirectX..."
    & "$env:ProgramData\chocolatey\bin\choco.exe" install directx -y
}

function Ensure-WingetIsInstalled {
    if (Get-Command winget.exe -ErrorAction SilentlyContinue) {
        Update-Status "Winget (Gerenciador de Pacotes do Windows) ja esta instalado."
        return $true
    }
    
    Update-Status "AVISO: Winget (Gerenciador de Pacotes do Windows) nao foi encontrado."
    Update-Status "Tentando instalar o Winget e suas dependencias..."
    
    Test-NetConnectionSafe
    
    $tempDir = Join-Path $env:TEMP "WingetInstall"
    New-Item -Path $tempDir -ItemType Directory -Force -ErrorAction SilentlyContinue | Out-Null
    $vclibsPath = Join-Path $tempDir "VCLibs.appx"
    $wingetPath = Join-Path $tempDir "Winget.msixbundle"

    try {
        # 1. Baixar e Instalar a Dependencia (VCLibs)
        Update-Status "... Baixando VCLibs (Dependencia)..."
        Download-File-Robust -Url $script:config.VCLibsUrl -OutFile $vclibsPath
        Update-Status "... Instalando VCLibs..."
        Add-AppxPackage -Path $vclibsPath -ErrorAction Stop
        
        # 2. Baixar e Instalar o Winget
        Update-Status "... Baixando Winget (DesktopAppInstaller)..."
        Download-File-Robust -Url $script:config.WingetInstallerUrl -OutFile $wingetPath
        Update-Status "... Instalando Winget..."
        Add-AppxPackage -Path $wingetPath -ErrorAction Stop

        # 3. Verificacao Final
        Update-Status "... Verificando a instalacao..."
        if (Get-Command winget.exe -ErrorAction SilentlyContinue) {
            Update-Status "Winget foi instalado com sucesso."
            return $true
        } else {
            throw "O Winget foi instalado, mas o comando 'winget.exe' ainda nao foi encontrado. Tente reiniciar o script."
        }
    } catch {
        throw "ERRO CRITICO ao tentar instalar o Winget. As funcoes de Bloatware podem falhar. Erro: $($_.Exception.Message)"
    } finally {
        if (Test-Path $tempDir) {
            Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
    return $false
}
function Set-TargetReleaseVersion {
    # --- ETAPA 1: Definir Politicas de Registro (GPedit) ---
    $targetVersion = $script:config.TargetReleaseVersion
    if ([string]::IsNullOrWhiteSpace($targetVersion)) {
        throw "A versao de destino (TargetReleaseVersion) nao esta definida no bloco de configuracao do script."
    }
    
    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
    Update-Status "... Definindo a versao de destino do Windows para '$targetVersion' (Registro)."
    
    try {
        if (-not (Test-Path $regPath)) {
            Update-Status "... Criando chave de registro para politicas do Windows Update."
            New-Item -Path $regPath -Force | Out-Null
        }
        # Habilita a política de "Target Release Version"
        Set-ItemProperty -Path $regPath -Name "TargetReleaseVersion" -Value 1 -Type DWord -Force
        # Define qual é a versão (ex: 25H2)
        Set-ItemProperty -Path $regPath -Name "TargetReleaseVersionInfo" -Value $targetVersion -Type String -Force
        # Opcional: Define o Produto como Windows 11 para garantir
        Set-ItemProperty -Path $regPath -Name "ProductVersion" -Value "Windows 11" -Type String -Force 
    } catch {
        throw "ERRO ao definir a politica de versao de destino. Detalhes: $($_.Exception.Message)"
    }

    # --- ETAPA 2: Instalar Pacote de Habilitação (KB5054156) ---
    # Link fornecido manualmente para o Enablement Package
    $kbUrl = "https://catalog.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fa84cc49-18b2-4c26-b389-90c96e6ae0d2/public/windows11.0-kb5054156-x64_a0c1638cbcf4cf33dbe9a5bef69db374b4786974.msu"
    $kbFileName = "windows11.0-kb5054156-x64.msu"
    $kbPath = Join-Path $env:TEMP $kbFileName

    try {
        Update-Status "--> Iniciando instalação do KB5054156 (Pacote de Habilitação 25H2)..."
        
        Update-Status "... Baixando KB5054156..."
        Download-File-Robust -Url $kbUrl -OutFile $kbPath

        Update-Status "... Instalando KB5054156 via WUSA (Isso pode levar alguns minutos)..."
        
        # Executa o instalador autônomo do Windows Update (wusa.exe)
        # /quiet = sem interface | /norestart = não reinicia sozinho
        $process = Start-Process -FilePath "wusa.exe" -ArgumentList "`"$kbPath`" /quiet /norestart" -Wait -PassThru

        # Verificacao dos codigos de saida do WUSA
        switch ($process.ExitCode) {
            0 { 
                Update-Status "--> SUCESSO: KB5054156 instalado." 
                $script:rebootRequired = $true
            }
            3010 { 
                Update-Status "--> SUCESSO: KB5054156 instalado (Reinicialização pendente)." 
                $script:rebootRequired = $true
            }
            2359302 { 
                Update-Status "AVISO: O KB5054156 já está instalado neste computador." 
            }
            default { 
                Update-Status "AVISO: A instalação do KB retornou o código $($process.ExitCode). Verifique se o sistema é compatível." 
            }
        }

    } catch {
        Update-Status "ERRO ao tentar instalar o KB5054156. O script continuará apenas com o ajuste de registro. Erro: $($_.Exception.Message)"
    } finally {
        # Limpeza do arquivo temporário
        if (Test-Path $kbPath) { Remove-Item -Path $kbPath -Force -ErrorAction SilentlyContinue }
    }
}

function Configure-System-ThemeAndTaskbar {
    Update-Status "... Aplicando tema escuro."
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "AppsUseLightTheme" 0 -Force
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "SystemUsesLightTheme" 0 -Force
    Update-Status "... Limpando icones da Barra de Tarefas."
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Set-ItemProperty -Path $regPath -Name "SearchboxTaskbarMode" -Value 1 -Force
    Set-ItemProperty -Path $regPath -Name "ShowTaskViewButton" -Value 0 -Force
    Stop-Process-AndWait -processName "explorer"
}

function Configure-System-Wallpaper { 
    Update-Status "--> Verificando conexao com a internet..."
    Test-NetConnectionSafe
    
    $permanentWpPath = Join-Path ([Environment]::GetFolderPath('MyPictures')) "AZCorp Wallpapers"
    if (-not (Test-Path $permanentWpPath)) { New-Item -Path $permanentWpPath -ItemType Directory -Force | Out-Null }
    
    $tempThumbDir = Join-Path $env:TEMP "WallpaperThumbs_$(Get-Random)"
    New-Item -Path $tempThumbDir -ItemType Directory -Force | Out-Null
    
    try {
        $imageLinks = Get-Image-List-From-Url -Url $script:config.WallpapersUrl
        if ($imageLinks.Count -eq 0) { throw "Nenhum wallpaper foi encontrado." }
        
        $selectionForm = New-Object System.Windows.Forms.Form; $selectionForm.Text = "Selecione o Wallpaper (Clique na Imagem)"; $selectionForm.Size = New-Object System.Drawing.Size(640, 520); $selectionForm.StartPosition = "CenterParent"
        $flowLayoutPanel = New-Object System.Windows.Forms.FlowLayoutPanel; $flowLayoutPanel.Dock = "Fill"; $flowLayoutPanel.AutoScroll = $true
        $okButton = New-Object System.Windows.Forms.Button; $okButton.Text = "Aplicar Wallpaper Selecionado"; $okButton.Dock = "Bottom"
        $script:selectedWallpaperGroup = $null
        
        foreach ($imageFile in $imageLinks) { 
            if ([string]::IsNullOrWhiteSpace($imageFile)) { continue }
            $filename = $imageFile | Split-Path -Leaf
            $imageUrl = "$($script:config.WallpapersUrl.TrimEnd('/'))/$([System.Web.HttpUtility]::UrlPathEncode($filename))"
            $thumbPath = Join-Path $tempThumbDir $filename
            try {
                Download-File-Robust -Url $imageUrl -OutFile $thumbPath -RefererUrl $script:config.WallpapersUrl
                $imageBytes = [System.IO.File]::ReadAllBytes($thumbPath)
                $memoryStream = [System.IO.MemoryStream]::new($imageBytes)
                $groupBox = New-Object System.Windows.Forms.GroupBox; $groupBox.Size = New-Object System.Drawing.Size(180, 140); $groupBox.Tag = $filename; $groupBox.Text = ($filename -replace '\.(png|jpg|jpeg|bmp|gif|webp)$', '') -replace '[-_]', ' '
                $pictureBox = New-Object System.Windows.Forms.PictureBox; $pictureBox.Dock = "Fill"; $pictureBox.SizeMode = "Zoom"; $pictureBox.Image = [System.Drawing.Image]::FromStream($memoryStream)
                $onClick = {
                    param($sender, $e)
                    $clickedControl = $sender; $clickedGroup = if ($clickedControl -is [System.Windows.Forms.GroupBox]) { $clickedControl } else { $clickedControl.Parent }
                    if ($script:selectedWallpaperGroup) { $script:selectedWallpaperGroup.ForeColor = $script:themeColors.Foreground }
                    $clickedGroup.ForeColor = $script:themeColors.Accent; $script:selectedWallpaperGroup = $clickedGroup
                }
                $groupBox.Add_Click($onClick); $pictureBox.Add_Click($onClick)
                $groupBox.Controls.Add($pictureBox); $flowLayoutPanel.Controls.Add($groupBox) 
            } catch { Update-Status "AVISO: Falha ao carregar a miniatura para '$filename'. Pulando..." }
        }
        
        if ($flowLayoutPanel.Controls.Count -eq 0) { throw "Nenhuma imagem pode ser carregada para selecao." }
        $firstGroup = $flowLayoutPanel.Controls[0]; $firstGroup.ForeColor = $script:themeColors.Accent; $script:selectedWallpaperGroup = $firstGroup
        $okButton.Add_Click({ $selectionForm.DialogResult = [System.Windows.Forms.DialogResult]::OK; $selectionForm.Close() })
        $selectionForm.Controls.AddRange(@($flowLayoutPanel, $okButton)); $result = $selectionForm.ShowDialog(); $selectionForm.Dispose()
        
        if ($result -ne [System.Windows.Forms.DialogResult]::OK) { return "CANCELADO" }
        $selectedFilename = $script:selectedWallpaperGroup.Tag
        if (-not $selectedFilename) { return "CANCELADO" }
        
        Update-Status "--> Aplicando o wallpaper selecionado via processo isolado..."
        $finalImageUrl = "$($script:config.WallpapersUrl.TrimEnd('/'))/$([System.Web.HttpUtility]::UrlPathEncode($selectedFilename))"
        $downloadedImagePath = Join-Path $permanentWpPath $selectedFilename
        Download-File-Robust -Url $finalImageUrl -OutFile $downloadedImagePath -RefererUrl $script:config.WallpapersUrl
        $bmpPath = [System.IO.Path]::ChangeExtension($downloadedImagePath, ".bmp")
        $workerScriptPath = $null
        try {
            $image = [System.Drawing.Image]::FromFile($downloadedImagePath); $image.Save($bmpPath, [System.Drawing.Imaging.ImageFormat]::Bmp); $image.Dispose()

            # ESTE E O 'MINI-SCRIPT' MAIS COMPLETO E AGRESSIVO POSSIVEL
            $workerScriptContent = @'
            param([string]$ImagePath)
            
            try {
                $themesPath = "$env:APPDATA\Microsoft\Windows\Themes"
                $transcodedPath = Join-Path $themesPath "TranscodedWallpaper"
                $regPath = 'HKCU:\Control Panel\Desktop'
                $regName = 'Wallpaper'
                
                # 1. Ataque Duplo: Edita o registro E substitui o arquivo de cache do Windows
                Set-ItemProperty -Path $regPath -Name $regName -Value $ImagePath
                Set-ItemProperty -Path $regPath -Name WallpaperStyle -Value 2
                Set-ItemProperty -Path $regPath -Name TileWallpaper -Value 0
                Copy-Item -Path $ImagePath -Destination $transcodedPath -Force -ErrorAction SilentlyContinue
                
                # 2. Forca o Explorer a reiniciar
                Stop-Process -Name explorer -Force
                
                # 3. VERIFICACAO: Espera o Explorer voltar e confere se a mudanca 'pegou'
                Start-Sleep -Seconds 5 
                $currentWallpaper = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
                
                if ($currentWallpaper -and $currentWallpaper.Wallpaper -eq $ImagePath) {
                    exit 0 # Sucesso Verificado
                } else {
                    exit 1 # Falha na Verificacao
                }
            } catch {
                exit 1 # Qualquer outro erro tambem e falha
            }
'@
            $workerScriptPath = Join-Path $env:TEMP "set_wallpaper_worker.ps1"
            $workerScriptContent | Out-File -FilePath $workerScriptPath -Encoding utf8

            Update-Status "--> Disparando processo 'operario' com verificacao..."
            $process = Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$workerScriptPath`" -ImagePath `"$bmpPath`"" -WindowStyle Hidden -Wait -PassThru
            
            # LOG MELHORADO: O sucesso agora depende do resultado da verificacao
            if ($process.ExitCode -eq 0) {
                Update-Status "--> SUCESSO VERIFICADO: Wallpaper atualizado com sucesso no registro."
            } else {
                throw "FALHA NA VERIFICAÇÃO: O script foi executado, mas a alteração no registro não foi confirmada. O ambiente Windows está bloqueando a mudança."
            }

        } finally {
            if (Test-Path $downloadedImagePath) { Remove-Item -Path $downloadedImagePath -Force -EA SilentlyContinue }
            # O arquivo BMP nao e mais apagado, pois esta em uso pelo sistema
            if ($workerScriptPath -and (Test-Path $workerScriptPath)) { Remove-Item -Path $workerScriptPath -Force -EA SilentlyContinue }
        }

    } finally {
        if (Test-Path $tempThumbDir) { Remove-Item -Path $tempThumbDir -Recurse -Force -EA SilentlyContinue }
    }
}

function Configure-Teams-Backgrounds {
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
        $encodedImageFileForUrl = [System.Web.HttpUtility]::UrlPathEncode(($imageFile | Split-Path -Leaf)); $imageUrl = "$($script:config.TeamsBackgroundsUrl.TrimEnd('/'))/$encodedImageFileForUrl"; $thumbPath = Join-Path $tempThumbDir ($imageFile | Split-Path -Leaf)
        try { Download-File-Robust -Url $imageUrl -OutFile $thumbPath -RefererUrl $script:config.TeamsBackgroundsUrl } catch { continue }
        $groupBox = New-Object System.Windows.Forms.GroupBox; $groupBox.Size = New-Object System.Drawing.Size(180, 140)
        $pictureBox = New-Object System.Windows.Forms.PictureBox; $pictureBox.Dock = "Fill"; $pictureBox.SizeMode = "Zoom"
        $imageBytes = [System.IO.File]::ReadAllBytes($thumbPath); 
		$memoryStream = [System.IO.MemoryStream]::new($imageBytes); 
		$pictureBox.Image = [System.Drawing.Image]::FromStream($memoryStream)
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

function Force-WindowsUpdates {
    Update-Status "Instalando/Verificando modulo 'PSWindowsUpdate'..."
    # A instalacao do modulo e rapida, pode ser feita diretamente.
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        try {
            # Tenta instalar o provedor NuGet se necessario
            if (-not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
                Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Confirm:$false
            }
            Install-Module PSWindowsUpdate -Force -Confirm:$false -Scope AllUsers -ErrorAction Stop
        } catch {
            throw "Falha ao instalar o modulo PSWindowsUpdate. Verifique a conexao e tente novamente. Erro: $($_.Exception.Message)"
        }
    }
    
    # A busca e instalacao das atualizacoes e demorada, entao e executada em um processo separado para capturar o progresso.
    Update-Status "Iniciando processo de busca e instalacao de TODAS as atualizacoes do Windows. Isso pode levar muito tempo..."
    
    # Comando a ser executado no novo processo PowerShell
    $command = "Import-Module PSWindowsUpdate -Force; Get-WindowsUpdate -Install -AcceptAll -ForceDownload -Verbose"
    
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "powershell.exe"
    $psi.Arguments = "-NoProfile -ExecutionPolicy Bypass -Command `"$command`""
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true

    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $psi
    $process.Start() | Out-Null

    # Loop para ler a saida em tempo real
    while (-not $process.HasExited) {
        $output = $process.StandardOutput.ReadToEnd()
        if (-not [string]::IsNullOrWhiteSpace($output)) {
            $output.Split([Environment]::NewLine) | ForEach-Object { if (-not [string]::IsNullOrWhiteSpace($_)) { Update-Status "Windows Update: $_" } }
        }
        $errorOutput = $process.StandardError.ReadToEnd()
        if (-not [string]::IsNullOrWhiteSpace($errorOutput)) {
            $errorOutput.Split([Environment]::NewLine) | ForEach-Object { if (-not [string]::IsNullOrWhiteSpace($_)) { Update-Status "Windows Update (ERRO): $_" } }
        }
        Start-Sleep -Seconds 2
    }
    
    # Captura final da saida
    $output = $process.StandardOutput.ReadToEnd()
    if (-not [string]::IsNullOrWhiteSpace($output)) {
        $output.Split([Environment]::NewLine) | ForEach-Object { if (-not [string]::IsNullOrWhiteSpace($_)) { Update-Status "Windows Update: $_" } }
    }
    $errorOutput = $process.StandardError.ReadToEnd()
    if (-not [string]::IsNullOrWhiteSpace($errorOutput)) {
        $errorOutput.Split([Environment]::NewLine) | ForEach-Object { if (-not [string]::IsNullOrWhiteSpace($_)) { Update-Status "Windows Update (ERRO): $_" } }
    }

    if ($process.ExitCode -ne 0) {
        throw "O processo do Windows Update finalizou com erros."
    }

    Update-Status "Processo de atualizacao do Windows finalizado."
    $script:rebootRequired = $true
}

function Create-SingleWebShortcut {
    param(
        [string]$ShortcutName
    )
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

function Install-App($appInfo) {
    Update-Status "--> Verificando instalacao do Chocolatey..."
    Ensure-ChocolateyIsInstalled | Out-Null
    Update-Status "--> Verificando conexao com a internet..."
    Test-NetConnectionSafe
    Update-Status "--> Executando: choco install $($appInfo.ChocoPackage)..."
    & "$env:ProgramData\chocolatey\bin\choco.exe" install $appInfo.ChocoPackage -y

    if ($appInfo.Executable -and (-not [string]::IsNullOrEmpty($appInfo.Executable))) {
        Update-Status "--> Aguardando 5 segundos antes de tentar iniciar o aplicativo..."
        Start-Sleep -Seconds 5
        $exePath = Find-ExecutablePath -ExecutableName $appInfo.Executable
	if ($exePath) {
		try {
			# Garante que estamos pegando apenas o primeiro resultado, caso a busca retorne mais de um.
			$firstPath = $exePath | Select-Object -First 1
			Update-Status "--> Iniciando $($appInfo.Name) em: $firstPath"
			Start-Process -FilePath $firstPath
		} catch {
			throw "Falha ao tentar iniciar o executavel '$exePath'. Erro: $($_.Exception.Message.Trim())"
		}
	}
        } else {
            Update-Status "AVISO: Nao foi possivel encontrar o executavel '$($appInfo.Executable)' para iniciar o aplicativo automaticamente."
        }
    }


function Install-Softphone {
    Test-NetConnectionSafe
    $softphone = $script:config.Softphone
    $installerPath = Join-Path $env:TEMP "softphone_installer.exe"
    
    Update-Status "--> Baixando instalador do Softphone..."
    Download-File-Robust -Url $softphone.InstallerUrl -OutFile $installerPath
    
    # [REMOVIDO] Bloco de Validação de Hash
    
    Update-Status "--> Iniciando instalacao silenciosa do Softphone..."
    
    # Inicia o processo e captura o objeto do processo (-PassThru)
    $process = Start-Process -FilePath $installerPath -ArgumentList "/S" -PassThru
    
    if ($process) {
        Update-Status "--> Processo de instalação iniciado (PID: $($process.Id)). Aguardando conclusão..."
        
        # Aguarda até 2 minutos (120.000 ms) pelo término. 
        $exited = $process.WaitForExit(120000) 
        
        if ($exited) {
            Update-Status "--> Instalação finalizada com sucesso."
        } else {
            Update-Status "AVISO: O instalador excedeu o tempo limite de espera (possivelmente abriu o app). Continuando fluxo..."
        }
    } else {
        # Fallback caso o processo execute rápido demais para ser capturado
        Start-Sleep -Seconds 10
    }

    if ($softphone.Executable) {
        Update-Status "--> Verificando instalação..."
        Start-Sleep -Seconds 2
        $exePath = Find-ExecutablePath -ExecutableName $softphone.Executable
        if ($exePath) {
            $firstPath = $exePath | Select-Object -First 1
            Update-Status "--> Softphone detectado em: $firstPath"
            
            # Opcional: Inicia o app se ele ainda não estiver rodando
            if (-not (Get-Process -Name ($softphone.Executable -replace ".exe","") -ErrorAction SilentlyContinue)) {
                 Start-Process -FilePath $firstPath
            }
        } else {
            Update-Status "AVISO: Executavel do Softphone não encontrado após a instalação."
        }
    }
    Update-Status "--> Tarefa de instalação do Softphone concluida."
}

function Install-OneDrive {
    if (Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue) { return "CANCELADO" }
    Test-NetConnectionSafe; $installerPath = Join-Path $env:TEMP "OneDriveSetup.exe"; Download-File-Robust -Url $script:config.OneDriveUrl -OutFile $installerPath
    Start-Process -FilePath $installerPath -Wait; Start-Process "$env:LOCALAPPDATA\Microsoft\OneDrive\OneDrive.exe" -ErrorAction SilentlyContinue
}

function Validate-And-Repair-OneDrive {
    function Test-OD { (Get-Process -Name "OneDrive" -EA SilentlyContinue) -and (Get-ChildItem -Path $env:USERPROFILE -Directory -Filter "OneDrive*" -EA SilentlyContinue) }
    function Wait-OD($t) { $sw = [System.Diagnostics.Stopwatch]::StartNew(); while ($sw.Elapsed.TotalSeconds -lt $t) { if (Test-OD) { $sw.Stop(); return $true }; Start-Sleep -Seconds 10 }; $sw.Stop(); return $false }
    function Find-OD($t=30) { $paths = @("$env:LOCALAPPDATA\Microsoft\OneDrive", "$env:ProgramFiles\Microsoft OneDrive", "$env:ProgramFiles(x86)\Microsoft OneDrive"); $sw = [System.Diagnostics.Stopwatch]::StartNew(); while ($sw.Elapsed.TotalSeconds -lt $t) { $exe = Get-ChildItem -Path $paths -Filter "OneDrive.exe" -Recurse -EA SilentlyContinue | Select -First 1; if ($exe) { $sw.Stop(); return $exe.FullName }; Start-Sleep -Seconds 5 }; $sw.Stop(); return $null }
    function Clean-OD { try { "OneDrive", "WINWORD", "EXCEL", "POWERPNT", "explorer" | % { Stop-Process-AndWait -processName $_ }; Get-ScheduledTask | ? { $_.TaskPath -like "\OneDrive*" } | % { Unregister-ScheduledTask -TaskName $_.TaskName -Confirm:$false -EA SilentlyContinue }; $regPaths = "HKCU:\Software\Microsoft\OneDrive", "HKLM:\SOFTWARE\Microsoft\OneDrive", "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive"; $regPaths | ? { Test-Path $_ } | % { Remove-Item $_ -Recurse -Force -EA SilentlyContinue }; $runKeys = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run", "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; foreach ($k in $runKeys) { if (Test-Path $k) { $key = Get-Item -Path $k; ($key.GetValueNames()) | % { if (($key.GetValue($_)) -is [string] -and ($key.GetValue($_)) -like "*OneDrive*") { Remove-ItemProperty -Path $k -Name $_ -Force -EA SilentlyContinue } } } }; $filePaths = "$env:LOCALAPPDATA\Microsoft\OneDrive", "$env:PROGRAMDATA\Microsoft OneDrive", "$env:APPDATA\Microsoft\OneDrive", "$env:ProgramFiles\Microsoft OneDrive", "$env:ProgramFiles(x86)\Microsoft OneDrive"; $filePaths | ? { Test-Path $_ } | % { Remove-Item $_ -Recurse -Force -EA SilentlyContinue }; Get-ChildItem -Path $env:USERPROFILE -Directory -Filter "OneDrive*" -EA SilentlyContinue | % { $bak = "$($_.Name)_BAK_$(Get-Date -f 'yyyyMMddHHmmss')"; try { Move-Item $_.FullName -Destination (Join-Path $env:USERPROFILE $bak) -Force -EA Stop } catch {} } } finally { if (-not (Get-Process -Name "explorer" -EA SilentlyContinue)) { Start-Process "explorer.exe" } } }
    if (Test-OD) { if (-not (Confirm-Action "O OneDrive parece estar funcional. Deseja mesmo assim executar a limpeza completa e reinstalar?")) { return "CANCELADO" } }
    Clean-OD; Start-Sleep -s 5; Test-NetConnectionSafe; $installerPath = Join-Path $env:TEMP "OneDriveSetup.exe"; Download-File-Robust -Url $script:config.OneDriveUrl -OutFile $installerPath; Start-Process -FilePath $installerPath -Wait
    $exePath = Find-OD; if (-not $exePath) { throw "OneDrive.exe nao foi encontrado." }; Start-Process -FilePath $exePath
    if (-not (Wait-OD -t 120)) { $err = "Falha na validacao pos-instalacao."; if (-not (Get-Process -Name "OneDrive" -EA SilentlyContinue)) { $err += " Processo nao ativo." }; if (-not (Get-ChildItem -Path $env:USERPROFILE -Directory -Filter "OneDrive*" -EA SilentlyContinue)) { $err += " Pasta nao criada." }; throw $err }
}

function Disable-Telemetry {
    Stop-Service DiagTrack -EA SilentlyContinue
    Set-Service DiagTrack -StartupType Disabled
    $p = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
    if (-not (Test-Path $p)) { New-Item -Path $p -Force | Out-Null }
    Set-ItemProperty -Path $p -Name "AllowTelemetry" -Value 0 -Type DWord -Force
}
function Adjust-For-Performance {
    $p1 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
    Set-ItemProperty -Path $p1 -Name "VisualFXSetting" -Value 2 -Type DWord -Force
    $p2 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Set-ItemProperty -Path $p2 -Name "TaskbarAnimations" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path $p2 -Name "ListviewAlphaSelect" -Value 0 -Type DWord -Force
}

function Clean-Prefetch {
    $p = "$env:windir\Prefetch"
    if (Test-Path $p) {
        if (Get-ChildItem -Path $p -File) { Remove-Item -Path "$p\*" -Force -Recurse -EA SilentlyContinue }
    }
}

function Empty-RecycleBin {
    Clear-RecycleBin -Force -EA SilentlyContinue
}
function Disk-Cleanup {
    $p = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"
    Get-ChildItem -Path $p | % { Set-ItemProperty -Path $_.PSPath -Name "StateFlags0001" -Value 2 -Type DWord -Force -EA SilentlyContinue }
    Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait
}
function Clean-TempFiles {
    $files = @((Join-Path $env:TEMP "wallpaper.png"), (Join-Path $env:TEMP "softphone.exe"), (Join-Path $env:TEMP "OneDriveSetup.exe"))
    $files | % { if (Test-Path $_) { Remove-Item -Path $_ -Force -EA SilentlyContinue } }
}
function Install-TrendMicroAgent {
    param([string]$SubscriptionType, [string]$ActivationUrl)
    Start-Process $ActivationUrl
    $msg = "A pagina de download do Trend Micro foi aberta.`n`n1. Baixe o instalador (.msi) para a pasta de 'Downloads'.`n2. Aguarde o download ser concluido.`n3. Clique em 'OK' para continuar."
    [System.Windows.Forms.MessageBox]::Show($msg, "Acao Manual Necessaria", "OK", "Information")
    $dlPath = Get-DownloadsPath
    $installer = Get-ChildItem -Path $dlPath -Filter "*.msi" | Sort-Object LastWriteTime -Descending | Select -First 1
    if (-not $installer) { throw "Nenhum .msi foi encontrado." }
    if (-not (Confirm-Action "Executar:`n$($installer.FullName)`n`nDeseja continuar?")) { throw "Cancelado." }
    Start-Process msiexec.exe -ArgumentList "/i `"$($installer.FullName)`" /qn" -Wait
}
function Get-InstalledApps { $apps = @{}; $paths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"); foreach ($p in $paths) { Get-ChildItem -Path $p -EA SilentlyContinue | % { $name = $_.GetValue("DisplayName"); if ($name -and -not $apps.ContainsKey($name) -and $_.GetValue("SystemComponent") -ne 1) { $apps[$name] = $_ } } }; return $apps.Keys | Sort-Object }

function Get-DirectorySize-Formatted {
    param($InputObject)
    $totalSize = 0
    
    # Função interna robusta para recursão segura
    function Get-Size-Recursive($targetPath) {
        $sizeSum = 0
        try {
            $dirInfo = New-Object System.IO.DirectoryInfo($targetPath)
            # EnumerateFiles é melhor que GetFiles pois não carrega tudo na RAM
            foreach ($file in $dirInfo.EnumerateFiles("*", [System.IO.SearchOption]::TopDirectoryOnly)) {
                try { $sizeSum += $file.Length } catch {}
            }
            foreach ($dir in $dirInfo.EnumerateDirectories("*", [System.IO.SearchOption]::TopDirectoryOnly)) {
                try { $sizeSum += Get-Size-Recursive -targetPath $dir.FullName } catch {}
            }
        } catch {
            # Se a pasta raiz estiver bloqueada, retorna 0 sem quebrar o script
            return 0
        }
        return $sizeSum
    }

    if ($InputObject -is [string] -or $InputObject -is [System.Management.Automation.PathInfo]) {
        $Path = [string]$InputObject
        
        # Suporte a wildcards no caminho raiz (ex: User Data\*\Cache)
        $resolvedPaths = $null
        try {
            $resolvedPaths = Resolve-Path $Path -ErrorAction SilentlyContinue
        } catch {}

        if ($resolvedPaths) {
            foreach ($rPath in $resolvedPaths) {
                if (Test-Path -LiteralPath $rPath.Path -PathType Container) {
                    $totalSize += Get-Size-Recursive -targetPath $rPath.Path
                } 
		elseif (Test-Path -LiteralPath $rPath.Path -PathType Leaf) {
                # CORREÇÃO: Adicionado '-ErrorAction Stop' para forçar o erro a cair no catch
                try { 
                    $totalSize += (Get-Item -LiteralPath $rPath.Path -ErrorAction Stop).Length 
                } catch {
                    # Arquivo sumiu ou está bloqueado? Ignora e segue a vida.
                }
            }
        }
    } 
	}
    else { $totalSize = $InputObject }

    $sizeInBytes = [long]$totalSize
    if ($sizeInBytes -ge 1GB) { return @{ Bytes = $sizeInBytes; Formatted = "{0:N2} GB" -f ($sizeInBytes / 1GB) } }
    elseif ($sizeInBytes -ge 1MB) { return @{ Bytes = $sizeInBytes; Formatted = "{0:N2} MB" -f ($sizeInBytes / 1MB) } }
    elseif ($sizeInBytes -ge 1KB) { return @{ Bytes = $sizeInBytes; Formatted = "{0:N2} KB" -f ($sizeInBytes / 1KB) } }
    else { return @{ Bytes = $sizeInBytes; Formatted = "$sizeInBytes B" } }
}
function Clean-SelectedFiles {
    $filesPanel.AnalyzeButton.Enabled = $false
    $filesPanel.CleanButton.Enabled = $false
    $treeView = $filesPanel.Control

    # Helper interno para pegar apenas os nós marcados
    function Get-CheckedChildNodes($nodeCollection) {
        foreach ($node in $nodeCollection) {
            if ($node.Nodes.Count -gt 0) { Get-CheckedChildNodes($node.Nodes) }
            elseif ($node.Checked) { $node }
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

    # 1. Encerra navegadores e apps comuns
    Encerra-AplicativosBloqueadores -NodesParaLimpar $nodesToClean
    
    # 2. Verifica se precisamos matar o Explorer (Para cache de miniaturas ou IconCache)
    $reiniciarExplorer = $false
    $itensExplorer = $nodesToClean | Where-Object { $_.Text -like "*Miniaturas*" -or $_.Text -like "*IconCache*" -or $_.Text -like "*Explorer*" }
    
    if ($itensExplorer) {
        Gerenciar-Explorer -Acao "Fechar"
        $reiniciarExplorer = $true
    }
    
    Run-Task "Limpeza de Arquivos Selecionados" {
        foreach ($node in $nodesToClean) {
            $details = $node.Tag
            # Protecao contra nodes sem tag (apenas pais)
            if ($null -eq $details) { continue }

            $parentName = if ($node.Parent) { $node.Parent.Text } else { "Sistema" }
            $itemName = $node.Text.Split('(')[0].Trim()
            
            # Pula o log excessivo para itens muito rapidos
            if ($itemName -notlike "*Cookies*") { Update-Status "Limpando: $parentName - $itemName" }
            
            try {
                # Pre-Action (Especifica do item)
                if ($details.PreAction) { & $details.PreAction }

                switch ($details.Type) {
                    "File" {
                        $pathsToClean = if ($details.VerifiedPaths) { $details.VerifiedPaths } else { $details.Path }
                        if ($pathsToClean) {
                            $pathsToClean | ForEach-Object {
                                $expandedPath = $ExecutionContext.InvokeCommand.ExpandString($_)
                                # Adicionado -Force e tratamento de erro especifico
                                Remove-Item -Path $expandedPath -Force -Recurse -ErrorAction SilentlyContinue
                            }
                        }
                    }
                    "FolderContent" {
                         $pathsToClean = if ($details.VerifiedPaths) { $details.VerifiedPaths } else { $details.Path }
                         if ($pathsToClean) {
                             $pathsToClean | ForEach-Object {
                                $expandedPath = $ExecutionContext.InvokeCommand.ExpandString($_)
                                if (Test-Path $expandedPath -PathType Container) {
                                    # Limpa conteudo, mantem pasta raiz
                                    Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
                                }
                             }
                         }
                    }
                    "Action" {
                        if ($details.Action) { & $details.Action }
                    }
                }
            } catch {
                Update-Status "AVISO: Falha ao limpar '$itemName'. Pode estar em uso pelo sistema."
            } finally {
                 if ($details.PostAction) { & $details.PostAction }
            }
        }
    }

    # 3. Restaura o Explorer se ele foi fechado
    if ($reiniciarExplorer) {
        Gerenciar-Explorer -Acao "Restaurar"
    }

    Update-Status "Limpeza concluida. Atualizando lista..."
    Analyze-CleanableFiles
}

function Analyze-CleanableFiles {
    $filesPanel.AnalyzeButton.Enabled = $false
    $filesPanel.CleanButton.Enabled = $false
    $filesPanel.Control.Nodes.Clear()

    Run-Task "Analise Profunda de Arquivos" {
        
        $filesPanel.Control.BeginUpdate()
        $foundItems = [System.Collections.Generic.List[object]]::new()
        
        try {
            # --- ETAPA 1: Itens do Sistema (Otimizado) ---
            $systemCleanOptions = [ordered]@{
                "Esvaziar Lixeira" = @{ Type = "Action"; Action = [scriptblock]{ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }; GetSize = [scriptblock]{ try { return ((New-Object -ComObject Shell.Application).NameSpace(0x0a).Items() | Measure-Object -Property Size -Sum -ErrorAction Stop).Sum } catch { return 0 } } }
                
                "Arquivos Temporarios do Sistema" = @{ Type = "FolderContent"; Path = @("$env:TEMP", "$env:windir\Temp") }
                
                "OneDrive (Arquivos de cache)" = @{ 
                    Type = "FolderContent"; 
                    Path = @("$env:LOCALAPPDATA\Microsoft\OneDrive\cache\qmlcache", "$env:LOCALAPPDATA\Microsoft\OneDrive\logs");
                    Processes = @("OneDrive") 
                }
                
                "Windows Update (Downloads Antigos)" = @{ Type = "FolderContent"; Path = @("$env:windir\SoftwareDistribution\Download"); PreAction = { Stop-Service wuauserv -Force -EA SilentlyContinue }; PostAction = { Start-Service wuauserv -EA SilentlyContinue } }
                
                "Relatorios de Erro (WER)" = @{ Type = "FolderContent"; Path = @("$env:ProgramData\Microsoft\Windows\WER\ReportArchive", "$env:ProgramData\Microsoft\Windows\WER\ReportQueue", "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportArchive", "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportQueue") }
                
                "Despejos de Memoria (Memory Dumps)" = @{ Type = "File"; Path = @("$env:windir\Minidump\*", "$env:windir\MEMORY.DMP") }
                
                "Cache do DirectX Shader" = @{ Type = "FolderContent"; Path = @("$env:LOCALAPPDATA\D3DSCache") }
                
                "Cache de Fontes do Windows" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\Microsoft\Windows\Fonts\*.dat"); PreAction = { Stop-Service FontCache -Force -EA SilentlyContinue }; PostAction = { Start-Service FontCache -EA SilentlyContinue } }
                
                "Cache de Miniaturas (IconCache)" = @{ Type = "File"; Path = @("$env:LOCALAPPDATA\IconCache.db"); PreAction = { Stop-Process -Name explorer -Force -EA SilentlyContinue }; PostAction = { Start-Process explorer } }
                
                "Cache DNS" = @{ Type = "Action"; Action = [scriptblock]{ ipconfig /flushdns }; GetSize = { return 0 } }
                
                "Cache de Otimizacao de Entrega" = @{ Type = "FolderContent"; Path = @("$env:windir\SoftwareDistribution\DeliveryOptimization"); PreAction = { Stop-Service DoSvc -Force -EA SilentlyContinue }; PostAction = { Start-Service DoSvc -EA SilentlyContinue } }
                
                # --- OTIMIZACAO AQUI: Uso de .NET puro em vez de wevtutil.exe ---
                "Registros de Eventos (Logs)" = @{ 
                    Type = "Action"; 
                    Action = [scriptblock]{ 
                        try {
                            $session = [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession
                            $session.GetLogNames() | ForEach-Object {
                                try { $session.ClearLog($_) } catch {}
                            }
                        } catch {}
                    }; 
                    GetSize = { try { return (Get-ChildItem -Path "$env:windir\System32\winevt\Logs" -Filter "*.evtx" -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum } catch { return 0 } } 
                }
                # ----------------------------------------------------------------
                
                "Dados do Prefetch" = @{ Type = "FolderContent"; Path = @("$env:windir\Prefetch") }
                
                "Cache do Chocolatey" = @{ Type = "FolderContent"; Path = @("$env:ProgramData\chocolatey\temp", "$env:ProgramData\chocolatey\downloads") }
            }

            # --- LOGICA DE PROGRESSO ---
            $db = $script:config.CacheDatabase
            $totalChecks = $systemCleanOptions.Count + $db.Count
            $checksDone = 0

            # Análise de Sistema
            foreach ($option in $systemCleanOptions.GetEnumerator()) {
                $checksDone++
                $percent = [int](($checksDone / $totalChecks) * 100)
                Update-Status "[$percent%] Analisando (Sistema): $($option.Name)..."

                $optionName = $option.Name; $optionDetails = $option.Value; $totalSize = 0
                
                $sysProcesses = if ($optionDetails.ContainsKey("Processes")) { $optionDetails.Processes } else { $null }

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
                    $foundItems.Add([pscustomobject]@{ Group = "Sistema e Windows"; ItemName = $optionName; Details = $optionDetails; Processes = $sysProcesses })
                }
            }

            # --- ETAPA 2: Análise de Apps ---
            foreach ($appEntry in $db.GetEnumerator()) {
                $appName = $appEntry.Name
                $appData = $appEntry.Value
                $checksDone++
                $percent = [int](($checksDone / $totalChecks) * 100)
                Update-Status "[$percent%] Verificando vestigios: $appName..."

                $appProcesses = if ($appData.ContainsKey("Processes")) { $appData.Processes } else { @() }
                
                foreach ($cacheType in $appData.GetEnumerator()) {
                    if ($cacheType.Name -eq "Processes") { continue }
                    $details = $cacheType.Value; $totalCacheSize = 0
                    
                    $validPaths = [System.Collections.Generic.List[string]]::new()
                    if ($details.Path) {
                        foreach ($rawPath in $details.Path) {
                            try {
                                $expandedPath = $ExecutionContext.InvokeCommand.ExpandString($rawPath)
                                if (Test-Path $expandedPath) {
                                    $pathSize = Get-DirectorySize-Formatted $expandedPath
                                    if ($pathSize.Bytes -gt 0) {
                                        $totalCacheSize += $pathSize.Bytes
                                        $validPaths.Add($expandedPath) | Out-Null
                                    }
                                }
                            } catch {}
                        }
                    }

                    if ($totalCacheSize -gt 0) {
                        $details.Size = $totalCacheSize
                        $details.VerifiedPaths = $validPaths 
                        $foundItems.Add([pscustomobject]@{ Group = $appName; ItemName = $cacheType.Name; Details = $details; Processes = $appProcesses })
                    }
                }
            }

            # --- ETAPA 3: Popular a interface ---
            if ($foundItems.Count -eq 0) {
                Update-Status "Nenhum arquivo para limpeza foi encontrado."
            } else {
                $groupedItems = $foundItems | Group-Object -Property Group | Sort-Object Name
                foreach ($group in $groupedItems) {
                    $parentNode = New-Object System.Windows.Forms.TreeNode($group.Name)
                    if ($group.Group[0].Processes) { $parentNode.Tag = $group.Group[0].Processes }
                    
                    foreach ($item in $group.Group) {
                        $formattedSize = (Get-DirectorySize-Formatted $item.Details.Size).Formatted
                        $childNode = New-Object System.Windows.Forms.TreeNode("$($item.ItemName) ($formattedSize)")
                        $childNode.Tag = $item.Details
                        
                        if ($item.Processes) { 
                            if ($item.Details -is [System.Collections.IDictionary]) {
                                $item.Details['Processes'] = $item.Processes
                            }
                        }
                        
                        $parentNode.Nodes.Add($childNode) | Out-Null
                    }
                    $filesPanel.Control.Nodes.Add($parentNode) | Out-Null
                }
                Update-Status "$($filesPanel.Control.Nodes.Count) categorias com arquivos para limpeza encontradas."
                $filesPanel.CleanButton.Enabled = $true
                $filesPanel.Control.ExpandAll()
                $filesPanel.Control.Nodes | ForEach-Object { $_.Checked = $true; $_.Nodes | ForEach-Object { $_.Checked = $true } }
                if ($filesPanel.Control.Nodes.Count -gt 0) { $filesPanel.Control.Nodes[0].EnsureVisible() }
            }
        }
        catch { Update-Status "ERRO CRITICO durante a analise de arquivos: $($_.Exception.Message)" }
        finally { $filesPanel.Control.EndUpdate() }
    }
    $filesPanel.AnalyzeButton.Enabled = $true
}

function Run-SFC-Scan {
    Update-Status "Verificacao SFC: Preparando para iniciar o processo..."
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "sfc.exe"
    $psi.Arguments = "/scannow"
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true
    $psi.StandardOutputEncoding = [System.Text.Encoding]::UTF8 # Garante a codificacao correta

    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $psi

    # Cria blocos de acao para lidar com a saida em tempo real
    $outputAction = {
        if (-not [string]::IsNullOrWhiteSpace($EventArgs.Data)) {
            $line = $EventArgs.Data
            if ($line -match '(\d+) percent complete') {
                $percent = $matches[1]
                Update-Status "Verificacao SFC... $percent% concluida."
            } else {
                Update-Status "SFC: $line"
            }
        }
    }
    $errorAction = { if (-not [string]::IsNullOrWhiteSpace($EventArgs.Data)) { Update-Status "SFC (ERRO): $($EventArgs.Data)" } }

    # Registra os eventos para capturar a saida
    $outputEvent = Register-ObjectEvent -InputObject $process -EventName "OutputDataReceived" -Action $outputAction
    $errorEvent = Register-ObjectEvent -InputObject $process -EventName "ErrorDataReceived" -Action $errorAction

    try {
        $process.Start() | Out-Null
        $process.BeginOutputReadLine()
        $process.BeginErrorReadLine()
        $process.WaitForExit()
    } finally {
        # Limpa os eventos registrados
        Unregister-Event -SubscriptionId $outputEvent.Id
        Unregister-Event -SubscriptionId $errorEvent.Id
    }

    if ($process.ExitCode -ne 0) {
        Update-Status "SFC encontrou problemas ou nao pode ser executado. Verifique o log acima para detalhes."
        throw "SFC.exe finalizou com codigo de erro: $($process.ExitCode)"
    } else {
        Update-Status "Verificacao SFC concluida sem erros de integridade."
    }
}
function Run-DISM-Repair {
    Test-NetConnectionSafe
    Update-Status "Reparo DISM: Preparando para iniciar o processo..."
    
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "dism.exe"
    $psi.Arguments = "/Online /Cleanup-Image /RestoreHealth"
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true
    $psi.StandardOutputEncoding = [System.Text.Encoding]::UTF8

    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $psi

    $outputAction = {
        if (-not [string]::IsNullOrWhiteSpace($EventArgs.Data)) {
            $line = $EventArgs.Data
            if ($line -match '(\d{1,3}\.\d+)%') {
                $percent = $matches[1]
                Update-Status "Reparo DISM... $percent% concluido."
            } 
            elseif ($line -like '*[=]*' -or $line -like '*%*') {
                Update-Status "DISM: $line"
            }
        }
    }
    $errorAction = { if (-not [string]::IsNullOrWhiteSpace($EventArgs.Data)) { Update-Status "DISM (ERRO): $($EventArgs.Data)" } }

    $outputEvent = Register-ObjectEvent -InputObject $process -EventName "OutputDataReceived" -Action $outputAction
    $errorEvent = Register-ObjectEvent -InputObject $process -EventName "ErrorDataReceived" -Action $errorAction

    try {
        $process.Start() | Out-Null
        $process.BeginOutputReadLine()
        $process.BeginErrorReadLine()
        $process.WaitForExit()
    } finally {
        Unregister-Event -SubscriptionId $outputEvent.Id
        Unregister-Event -SubscriptionId $errorEvent.Id
    }

    if ($process.ExitCode -ne 0) {
        Update-Status "DISM falhou ou encontrou erros. Verifique o log acima para detalhes."
        throw "DISM.exe finalizou com codigo de erro: $($process.ExitCode)"
    } else {
        Update-Status "Reparo DISM concluido com sucesso."
    }
}
function Run-Chkdsk {
    if (-not (Confirm-Action "Agendar verificacao de disco na proxima reinicializacao?")) { return "CANCELADO" }
    chkdsk C: /f /r
    fsutil dirty set C:
    $script:rebootRequired = $true
}
function Flush-DNS-Cache {
    ipconfig /flushdns
}
function Reset-Winsock {
    netsh winsock reset
    $script:rebootRequired = $true
}
function Scan-OutdatedChocoApps { $scanChocoButton.Enabled = $false; $updateChocoButton.Enabled = $false; $chocoUpdatesListView.Items.Clear(); Run-Task "Verificar Desatualizados (Choco)" { Ensure-ChocolateyIsInstalled | Out-Null; $choco = "$env:ProgramData\chocolatey\bin\choco.exe"; $out = & $choco outdated -r 2>&1 | Out-String; if ($LASTEXITCODE -ne 0 -and ($out -notlike "*outdated*") -and ($out -notlike "*determined*")) { throw "choco outdated falhou: $out" }; $lines = $out.Split([Environment]::NewLine) | ? { $_ -match '\|' -and $_ -notlike 'Output is id*' }; $c = 0; $i = 1; foreach ($line in $lines) { $parts = $line.Split('|') | % { $_.Trim() }; if ($parts.Length -ge 3 -and -not [string]::IsNullOrWhiteSpace($parts[0])) { $c++; $item = New-Object System.Windows.Forms.ListViewItem($i.ToString()); $item.SubItems.Add($parts[0]); $item.SubItems.Add($parts[1]); $item.SubItems.Add($parts[2]); $item.Checked = $true; $chocoUpdatesListView.Items.Add($item) | Out-Null; $i++ } }; if ($c -gt 0) { $updateChocoButton.Enabled = $true } }; $chocoUpdatesListView.AutoResizeColumns(1); $scanChocoButton.Enabled = $true }

function Update-RegisteredAppsList {
    $regUpdatesListView.Items.Clear()
    $script:cachedInstalledApps = [ordered]@{}

    # --- ETAPA 1: Varrer o registro (programas tradicionais) ---
    Update-Status "... Verificando aplicativos tradicionais (Registro)..."
    $paths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
    foreach ($p in $paths) {
        Get-ChildItem -Path $p -ErrorAction SilentlyContinue | ForEach-Object {
            $key = $_; $name = $key.GetValue("DisplayName"); $uninstallString = $key.GetValue("UninstallString")
            if ((-not [string]::IsNullOrWhiteSpace($name)) -and (-not [string]::IsNullOrWhiteSpace($uninstallString)) -and ($key.GetValue("SystemComponent") -ne 1)) {
                if (-not ($script:cachedInstalledApps.Keys -contains $name)) {
                    # Assumimos origem Windows por padrao para ser rapido
                    $script:cachedInstalledApps[$name] = [pscustomobject]@{ Name = $name; Version = $key.GetValue("DisplayVersion"); Publisher = $key.GetValue("Publisher"); UninstallString = $uninstallString; Origin = "Windows" }
                }
            }
        }
    }
    
    # --- ETAPA 2: Varrer pacotes da Microsoft Store (Appx) ---
    Update-Status "... Verificando aplicativos da Microsoft Store..."
    try {
        Get-AppxPackage -PackageTypeFilter Main | ForEach-Object {
            $app = $_
            $displayName = (Get-AppxPackageManifest $app).Package.Properties.DisplayName
            
            if ($app.SignatureKind -ne "System" -and (-not [string]::IsNullOrWhiteSpace($displayName)) -and (-not ($script:cachedInstalledApps.Keys -contains $displayName))) {
                 $script:cachedInstalledApps[$displayName] = [pscustomobject]@{
                    Name            = $displayName
                    Version         = $app.Version
                    Publisher       = $app.Publisher
                    UninstallString = "winget uninstall $($app.PackageFamilyName)"
                    Origin          = "Microsoft Store"
                }
            }
        }
    } catch { Update-Status "AVISO: Nao foi possivel listar os pacotes da Microsoft Store."}

    # --- ETAPA 3: Ordenar e popular a interface ---
    $sortedApps = $script:cachedInstalledApps.Values | Sort-Object Name
    $regUpdatesListView.BeginUpdate()
    $i = 1
    foreach ($app in $sortedApps) {
        $item = New-Object System.Windows.Forms.ListViewItem($app.Origin)
        $item.SubItems.Add($i.ToString()); $item.SubItems.Add($app.Name); $item.SubItems.Add($(if ($app.Version) { $app.Version } else { "N/D" })); $item.SubItems.Add($(if ($app.Publisher) { $app.Publisher } else { "N/D" })); $item.Tag = $app.UninstallString
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
    try {
        Ensure-ChocolateyIsInstalled | Out-Null
    } catch {
        Update-Status "ERRO: Chocolatey nao esta instalado ou falhou ao instalar. A atualizacao foi cancelada."
        $scanChocoButton.Enabled = $true
        $updateChocoButton.Enabled = $true
        return
    }
    $chocoExePath = "'$env:ProgramData\chocolatey\bin\choco.exe'"
$customTasksToRun = [System.Collections.ArrayList]::new()
$selectedItems | ForEach-Object {
    $appName = $_.SubItems[1].Text
    $actionBlock = [scriptblock]::Create("& $chocoExePath upgrade $appName -y -r")
    # --- CORRECAO APLICADA AQUI ---
    $customTasksToRun.Add(@{ Name = "Atualizando $appName (Choco)"; Definition = $actionBlock }) | Out-Null
}
    Start-Execution -CustomTasks $customTasksToRun
}
function Scan-RegistryApps { $scanRegButton.Enabled = $false; $searchForUpdateButton.Enabled = $false; $uninstallRegButton.Enabled = $false; Run-Task "Verificar Apps Instalados (Registro)" { Update-RegisteredAppsList }; $scanRegButton.Enabled = $true }

function Uninstall-SelectedApps { 
    $uninstallRegButton.Enabled = $false
    $toUninstall = $regUpdatesListView.CheckedItems
    if ($toUninstall.Count -eq 0) { $uninstallRegButton.Enabled = $true; return }
    if (-not (Confirm-Action "Desinstalar $($toUninstall.Count) app(s)?")) { $uninstallRegButton.Enabled = $true; return }

    # Pausa o timer (Correto)
    $script:shutdownTimer.Stop()

    # --- INICIO DA CORRECAO ---
    
    # 1. Criar lista de tarefas para o Start-Execution
    $customTasksToRun = [System.Collections.ArrayList]::new()

    foreach ($item in $toUninstall) { 
        $appName = $item.SubItems[2].Text
        $unStr = $item.Tag

        # 2. Criar o scriptblock para cada desinstalacao.
        
		$actionBlock = [scriptblock]::Create(@"
            if ([string]::IsNullOrWhiteSpace('$unStr')) { throw "String de desinstalacao nao encontrada." }

            `$cmd = ""; `$args = "";
            `$uninstallString = '$unStr'.Trim('"')

            if (`$uninstallString -match '^(?i)choco uninstall') {
                `$cmd = "`$env:ProgramData\chocolatey\bin\choco.exe"
                `$packageName = `$uninstallString.Split(' ')[-1]
                `$args = "uninstall `$packageName -y"
                
                Update-Status "... Executando (Choco): `"`$cmd`" `$args"
                Start-Process -FilePath `$cmd -ArgumentList `$args -Wait -WindowStyle Hidden -ErrorAction Stop

            } 
            elseif (`$uninstallString -match '^(?i)winget uninstall') {
                `$cmd = "winget.exe"
                `$args = `$uninstallString.Replace('winget ', '') + ' --silent --disable-interactivity --accept-source-agreements'

                Update-Status "... Executando (Winget): `"`$cmd`" `$args"
                Start-Process -FilePath `$cmd -ArgumentList `$args -Wait -WindowStyle Hidden -ErrorAction Stop
            }
            else {
                if (`$uninstallString -match '^(?i)MsiExec.exe') {
                    `$cmd = "msiexec.exe"
                    `$args = `$uninstallString.Substring(11).Trim()
                } 
                elseif (`$uninstallString -match '^"([^"]+\.exe)"') {
                    `$cmd = `$matches[1]
                    `$args = `$uninstallString.Substring(`$matches[0].Length).Trim()
                }
                elseif (`$uninstallString -match '^([^"]+\.exe)') {
                    `$cmd = `$matches[1]
                    `$args = `$uninstallString.Substring(`$cmd.Length).Trim()
                }
                else {
                    throw "Nao foi possivel interpretar a string de desinstalacao: `$uninstallString"
                }
                
                `$silentArgs = ""
                if (`$cmd -match 'msiexec' -and `$args -notmatch '(/qn|/quiet)') {
                    `$args = `$args.Replace("/I", "/X").Trim()
                    `$silentArgs = "/qn /norestart"
                } elseif (`$cmd -notmatch 'msiexec' -and `$args -notmatch '(/S|/silent|/quiet)') {
                    `$silentArgs = "/S"
                }
                
                `$finalArgs = "`$args `$silentArgs".Trim()
                Update-Status "... Executando: `"`$cmd`" `$finalArgs"
                Start-Process -FilePath `$cmd -ArgumentList `$finalArgs -Wait -ErrorAction Stop
            }
"@) # Fim do scriptblock

        # 3. Adicionar a tarefa à lista
        $customTasksToRun.Add(@{ Name = "Desinstalar $appName"; Definition = $actionBlock }) | Out-Null
    }

    # 4. Chamar o Start-Execution, que cuidará do job em segundo plano,
   Start-Execution -CustomTasks $customTasksToRun
}
function Refresh-AppLists {
    Update-Status "Execucao finalizada. Atualizando listas de aplicativos..."
    Run-Task "Atualizando lista de apps desatualizados (Choco)" { Scan-OutdatedChocoApps }
    Run-Task "Atualizando lista de todos os apps (Registro)" { Scan-RegistryApps }
    Run-Task "Atualizando status na arvore de softwares" { Populate-AppsTreeView }
    Update-Status "Listas de aplicativos atualizadas."
}

function Check-WindowsFeaturesStatus {
    # --- ETAPA 0: Preparar a UI ---
    $analyzeButton = $null
    foreach($control in $featuresMainPanelGroup.Controls) {
        if ($control -is [System.Windows.Forms.Panel]) {
            foreach($button in $control.Controls) {
                if ($button.Text -eq "Analisar Recursos") { $analyzeButton = $button; break }
            }
        }
        if ($analyzeButton) { break }
    }
    if ($analyzeButton) { $analyzeButton.Enabled = $false }

    $windowsFeaturesListView.Items.Clear()
    $loadingItem = New-Object System.Windows.Forms.ListViewItem("Analisando, por favor aguarde...")
    $loadingItem.ForeColor = [System.Drawing.Color]::Khaki
    $windowsFeaturesListView.Items.Add($loadingItem)
    Update-Status "Iniciando analise dos Recursos do Windows... (A UI pode congelar por um momento)"
    
    $form.Cursor = [System.Windows.Forms.Cursors]::WaitCursor
    
    try {
        # --- ETAPA 1: Executar o comando e coletar apenas os dados necessarios ---
        $allFeatures = Get-WindowsOptionalFeature -Online -ErrorAction Stop
        
        $results = foreach ($feature in $allFeatures) {
            [pscustomobject]@{
                FeatureName = $feature.FeatureName
                State       = $feature.State.ToString()
            }
        }

        # --- ETAPA 2: Popular a lista com a nova estrutura de 2 colunas ---
        $windowsFeaturesListView.BeginUpdate()
        $windowsFeaturesListView.Items.Clear()

        if ($results) {
            $script:cachedWindowsFeatures = $results
            Update-Status "Analise concluida. Populando a lista com $($results.Count) recursos..."

            foreach ($feature in $script:cachedWindowsFeatures) {
                $item = New-Object System.Windows.Forms.ListViewItem($feature.FeatureName) # Primeira coluna e o Nome Tecnico
                $item.SubItems.Add($feature.State) | Out-Null                         # Segunda coluna e o Status
                $item.Tag = $feature.FeatureName
                
                if ($feature.State -eq 'Enabled') {
                    $item.ForeColor = [System.Drawing.Color]::LightGreen
                    $item.Checked = $false 
                } else {
                    $item.ForeColor = [System.Drawing.Color]::Salmon
                }
                $windowsFeaturesListView.Items.Add($item) | Out-Null
            }
            Update-Status "Lista de Recursos do Windows carregada com sucesso."
        } else {
            Update-Status "AVISO: Nenhum recurso opcional foi encontrado apos a analise."
        }

    } catch {
        Update-Status "ERRO CRITICO ao analisar Recursos do Windows: $($_.Exception.Message)"
        $windowsFeaturesListView.Items.Clear()
        $errorItem = New-Object System.Windows.Forms.ListViewItem("Falha ao carregar recursos. Verifique o log.")
        $errorItem.ForeColor = [System.Drawing.Color]::Red
        $windowsFeaturesListView.Items.Add($errorItem)
    } finally {
        # --- ETAPA 3: Limpeza da UI ---
        $windowsFeaturesListView.EndUpdate()
        $windowsFeaturesListView.AutoResizeColumns(1)
        if ($analyzeButton) { $analyzeButton.Enabled = $true }
        $form.Cursor = [System.Windows.Forms.Cursors]::Default
    }
}

function Analyze-Bloatware {
    $panel = $bloatwarePanel
    $panel.AnalyzeButton.Enabled = $false
    $panel.CleanButton.Enabled = $false
    $panel.Control.Items.Clear()
    
    Run-Task "Verificar Apps Nativos (Local)" {
       
        $all = $script:config.BloatwareApps
        $panel.Control.BeginUpdate()
        $i = 1
        foreach ($e in $all.GetEnumerator()) {
            $tech = $e.Name
            $friendly = $e.Value.FriendlyName
            $wid = $e.Value.WingetId
            
            # Verificacao nativa rapida (sem internet/winget)
            $app = Get-AppxPackage -AllUsers -Name $tech -EA SilentlyContinue | Select -First 1
            
            $item = New-Object System.Windows.Forms.ListViewItem($i.ToString())
            $item.SubItems.Add($friendly) | Out-Null
            
            if ($app) {
                # Se o app existe, marcamos como instalado e pronto para remover
                $item.SubItems.Add("Instalado") | Out-Null
                $item.ForeColor = [System.Drawing.Color]::LightGreen
                $item.Tag = @{ A = "Remove"; P = $app.PackageFullName }
            } else {
                $item.SubItems.Add("Nao Encontrado") | Out-Null
                $item.ForeColor = [System.Drawing.Color]::DarkGray
                
                # Se tiver ID do Winget, preparamos para instalar, mas o Winget so sera validado
                # se o usuario clicar em "Aplicar Acoes".
                if (-not [string]::IsNullOrWhiteSpace($wid)) {
                    $item.Tag = @{ A = "Install"; W = $wid }
                } else {
                    $item.Tag = @{ A = "None" }
                }
            }
            $panel.Control.Items.Add($item) | Out-Null
            $i++
        }
        $panel.Control.EndUpdate()
        $panel.Control.AutoResizeColumns(1)
        $panel.CleanButton.Enabled = $true
    }
    
    $panel.AnalyzeButton.Enabled = $true
}

function Apply-BloatwareActions {
    $panel = $bloatwarePanel
    $panel.CleanButton.Enabled = $false
    $items = $panel.Control.CheckedItems
    
    if ($items.Count -eq 0) {
        $panel.AnalyzeButton.Enabled = $true
        return
    }
    
    if (-not (Confirm-Action "Aplicar acoes em $($items.Count) apps?")) {
        $panel.AnalyzeButton.Enabled = $true
        $panel.CleanButton.Enabled = $true
        return
    }
    
    Run-Task "Aplicar Acoes nos Apps Nativos" {
	# --- INICIO DA VALIDACAO DE DEPENDENCIA ---
        # Garante que o winget esta disponivel antes de tentar usa-lo
        $wingetAvailable = $false
        try {
            $wingetAvailable = Ensure-WingetIsInstalled
        } catch {
             # Se a instalacao falhar, apenas registra o erro mas nao para o Run-Task
             # Isso permite que a funcao 'Remove' (que nao usa winget) ainda funcione.
            Update-Status "ERRO: Falha ao instalar o Winget. Acoes de 'Install' ou 'Upgrade' podem falhar. Erro: $($_.Exception.Message)"
        }
		
        foreach ($item in $items) {
            $info = $item.Tag
            $name = $item.SubItems[1].Text
            $action = $info.A
            try {
                switch ($action) {
                    "Remove" {
                        Remove-AppxPackage -Package $info.P -AllUsers -EA Stop
                    }
                    "Install" {
                        $args = "install --id $($info.W) -e --silent --force --disable-interactivity --accept-package-agreements --accept-source-agreements"
                        Start-Process winget.exe -ArgumentList $args -Wait -PassThru -WindowStyle Hidden
                    }
                    "Upgrade" {
                        $args = "upgrade --id $($info.W) -e --silent --force --disable-interactivity --accept-package-agreements --accept-source-agreements --include-unknown"
                        Start-Process winget.exe -ArgumentList $args -Wait -PassThru -WindowStyle Hidden
                    }
                }
            } catch {}
            Start-Sleep -Seconds 2
        }
    }
    
    Analyze-Bloatware
    $panel.AnalyzeButton.Enabled = $true
}

function Analyze-RegistryIssues {
    $analyzeRegButton.Enabled = $false
    $backupRegButton.Enabled = $false
    $cleanRegButton.Enabled = $false
    $regCleanerListView.Items.Clear()
    
    Run-Task "Analisando Problemas no Registro" {
        $res = [System.Collections.Generic.List[object]]::new()
        $regCleanerListView.BeginUpdate()
        
        try {
            # --- 1. Desinstaladores Orfaos (Ja existia) ---
            $uninst = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
            foreach ($p in $uninst) {
                Get-ChildItem -Path $p -EA SilentlyContinue | ForEach-Object {
                    $loc = $_.GetValue("InstallLocation")
                    if ($loc -and -not (Test-Path -LiteralPath $loc -ErrorAction SilentlyContinue)) {
                        $res.Add(@{ Type = "Desinstalador Orfao"; Path = $_.PSPath; DisplayPath = $_.Name; Location = "Pasta: $loc"; Tag = $_.PSPath })
                    }
                }
            }
            
            # --- 2. Inicializacao Invalida (Otimizado) ---
            $run = @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Run", "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run")
            foreach ($p in $run) {
                $key = Get-Item -Path $p -EA SilentlyContinue
                if ($key) {
                    foreach ($val in $key.GetValueNames()) {
                        $cmd = $key.GetValue($val)
                        if ($cmd -is [string]) {
                            $cmdStr = $cmd.Trim(); $exePath = $null
                            if ($cmdStr.StartsWith('"')) {
                                $endQuote = $cmdStr.IndexOf('"', 1)
                                if ($endQuote -gt 0) { $exePath = $cmdStr.Substring(1, $endQuote - 1) } else { $exePath = $cmdStr.Trim('"') }
                            } elseif ($cmdStr -match '(?i)\.exe') {
                                $exeIndex = $cmdStr.ToLower().IndexOf(".exe")
                                $exePath = $cmdStr.Substring(0, $exeIndex + 4)
                            } else {
                                $firstSpace = $cmdStr.IndexOf(' '); if ($firstSpace -gt 0) { $exePath = $cmdStr.Substring(0, $firstSpace) } else { $exePath = $cmdStr }
                            }
                            $pathIsValid = $false
                            if (-not [string]::IsNullOrWhiteSpace($exePath)) {
                                if ($exePath -notlike "*\*") { $pathIsValid = $true } else { $pathIsValid = Test-Path -LiteralPath $exePath -ErrorAction SilentlyContinue }
                            } else { $pathIsValid = $true }

                            if (-not $pathIsValid) {
                                $res.Add(@{ Type = "Inicializacao Invalida"; Path = $key.PSPath; DisplayPath = $key.Name; Location = "Valor: $val"; Tag = @{ Path = $key.PSPath; ValueName = $val } })
                            }
                        }
                    }
                }
            }

            # --- 3. Referencias de Instaladores (O que gera mais erros no CCleaner) ---
            # O Windows guarda em 'Installer\Folders' caminhos de pastas que ele acha que existem.
            $installerFoldersPaths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders")
            foreach ($regPath in $installerFoldersPaths) {
                if (Test-Path $regPath) {
                    $key = Get-Item $regPath
                    foreach ($folderPath in $key.GetValueNames()) {
                        # O nome do valor é o caminho. O conteúdo geralmente é vazio ou "1".
                        if (-not [string]::IsNullOrWhiteSpace($folderPath) -and $folderPath.Contains("\")) {
                            if (-not (Test-Path -LiteralPath $folderPath -ErrorAction SilentlyContinue)) {
                                $res.Add(@{ Type = "Pasta de Instalador Invalida"; Path = $key.PSPath; DisplayPath = "Installer Reference"; Location = $folderPath; Tag = @{ Path = $key.PSPath; ValueName = $folderPath } })
                            }
                        }
                    }
                }
            }

            # --- 4. DLLs Compartilhadas Inexistentes (SharedDLLs) ---
            $sharedDllsPaths = @(
                "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDLLs", 
                "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\SharedDLLs"
            )
            foreach ($regPath in $sharedDllsPaths) {
                if (Test-Path $regPath) {
                    $key = Get-Item $regPath
                    foreach ($dllPath in $key.GetValueNames()) {
                        if (-not [string]::IsNullOrWhiteSpace($dllPath) -and $dllPath.Contains("\")) {
                            # Verifica se o arquivo DLL realmente existe
                            if (-not (Test-Path -LiteralPath $dllPath -ErrorAction SilentlyContinue)) {
                                $res.Add(@{ Type = "DLL Compartilhada Faltando"; Path = $key.PSPath; DisplayPath = "SharedDLL"; Location = $dllPath; Tag = @{ Path = $key.PSPath; ValueName = $dllPath } })
                            }
                        }
                    }
                }
            }

            # --- 5. Arquivos de Ajuda Invalidos ---
            $helpPaths = @("HKLM:\SOFTWARE\Microsoft\Windows\Help")
            foreach ($regPath in $helpPaths) {
                if (Test-Path $regPath) {
                    $key = Get-Item $regPath
                    foreach ($helpFile in $key.GetValueNames()) {
                         # Às vezes o valor é o caminho, às vezes é o nome. Vamos checar o valor.
                         $pathToFile = $key.GetValue($helpFile)
                         if ($pathToFile -is [string] -and $pathToFile.Contains("\")) {
                             if (-not (Test-Path -LiteralPath $pathToFile -ErrorAction SilentlyContinue)) {
                                 $res.Add(@{ Type = "Arquivo de Ajuda Invalido"; Path = $key.PSPath; DisplayPath = "Help File"; Location = $pathToFile; Tag = @{ Path = $key.PSPath; ValueName = $helpFile } })
                             }
                         }
                    }
                }
            }
            
            # --- 6. Cache MUI Obsoleto (Mantido) ---
            $mui = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache"
            if (Test-Path $mui) {
                $key = Get-Item -Path $mui
                foreach ($val in $key.GetValueNames()) {
                    if ($val -like "*:\*") {
                        $exe = $val.Split(',')[0]
                        if ($exe.Contains(".exe")) {
                             $exeIndex = $exe.ToLower().IndexOf(".exe"); $exe = $exe.Substring(0, $exeIndex + 4)
                        }
                        if (-not (Test-Path -LiteralPath $exe -ErrorAction SilentlyContinue)) {
                            $res.Add(@{ Type = "Cache MUI Obsoleto"; Path = $key.PSPath; DisplayPath = $key.Name; Location = "Executavel: $exe"; Tag = @{ Path = $key.PSPath; ValueName = $val } })
                        }
                    }
                }
            }
            
            # Popula a lista
            $i = 1
            foreach ($issue in $res) {
                $item = New-Object System.Windows.Forms.ListViewItem($i.ToString())
                $item.SubItems.Add($issue.Type) | Out-Null
                $item.SubItems.Add($issue.DisplayPath) | Out-Null
                $item.SubItems.Add($issue.Location) | Out-Null
                $item.Tag = $issue.Tag
                $item.Checked = $true
                $regCleanerListView.Items.Add($item) | Out-Null
                $i++
            }
        } finally {
            $regCleanerListView.EndUpdate()
            $regCleanerListView.AutoResizeColumns(1)
        }
        
        if ($regCleanerListView.Items.Count -gt 0) {
            $backupRegButton.Enabled = $true
            $cleanRegButton.Enabled = $true
        }
        $analyzeRegButton.Enabled = $true
        $count = $regCleanerListView.CheckedItems.Count
        $regCleanerSummaryLabel.Text = "Total de itens selecionados: $count"
    }
    $analyzeRegButton.Enabled = $true
}

function Backup-SelectedRegistryIssues {
    $items = $regCleanerListView.CheckedItems
    if ($items.Count -eq 0) {
        return
    }
    
    $dlg = New-Object System.Windows.Forms.SaveFileDialog
    $dlg.Filter = "Arquivo de Registro (*.reg)|*.reg"
    $dlg.FileName = "AZTools_RegBackup_$(Get-Date -f 'yyyy-MM-dd_HHmmss').reg"
    
    if ($dlg.ShowDialog() -ne "OK") {
        return
    }
    
    $file = $dlg.FileName
    Run-Task "Backup de Chaves do Registro" {
        $keys = $items | ForEach-Object {
            if ($_.Tag -is [string]) {
                $_.Tag
            } elseif ($_.Tag -is [hashtable]) {
                $_.Tag.Path
            }
        } | Select -Unique
        
        "Windows Registry Editor Version 5.00`r`n" | Out-File -FilePath $file -Encoding Unicode
        
        foreach ($key in $keys) {
            $keyPath = $key.Replace("HKEY_CURRENT_USER", "HKCU").Replace("HKEY_LOCAL_MACHINE", "HKLM").Replace("Microsoft.PowerShell.Core\Registry::", "")
            $tmp = "$env:TEMP\reg_temp.reg"
            Start-Process reg -ArgumentList "export `"$keyPath`" `"$tmp`" /y" -Wait -NoNewWindow
            Get-Content $tmp | Select-Object -Skip 2 | Add-Content -Path $file -Encoding Unicode
            Remove-Item $tmp -Force -EA SilentlyContinue
        }
    }
}

function Clean-SelectedRegistryIssues {
    $items = $regCleanerListView.CheckedItems
    if ($items.Count -eq 0) {
        return
    }
    
    if (-not (Confirm-Action "Apagar $($items.Count) itens do registro?")) {
        return
    }
    
    $cleanRegButton.Enabled = $false
    Run-Task "Limpeza de Itens do Registro" {
        foreach ($item in ($items | Sort-Object { $_.SubItems[2].Text.Length } -Descending)) {
            try {
                if ($item.Tag -is [string]) {
                    Remove-Item -Path $item.Tag -Recurse -Force -EA Stop
                } elseif ($item.Tag -is [hashtable]) {
                    Remove-ItemProperty -Path $item.Tag.Path -Name $item.Tag.ValueName -Force -EA Stop
                }
            } catch {}
        }
        Analyze-RegistryIssues
    }
    $cleanRegButton.Enabled = $true
}

function Populate-AppsTreeView {
    $appsTreeView.Nodes.Clear()
    $appsTreeView.BeginUpdate()

    # Prepara um cache de nomes de apps ja instalados para consulta rapida
    $installedAppsCache = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    if ($script:cachedInstalledApps) {
        $script:cachedInstalledApps.Keys | ForEach-Object { $installedAppsCache.Add($_) | Out-Null }
    }

    # Funcao auxiliar para criar e colorir os nos
    function New-AppNode($appName, $categoryNode) {
        $node = New-Object System.Windows.Forms.TreeNode("$appName")
        
        # Verifica se o app esta no cache de instalados
		$match = $installedAppsCache | Where-Object { $_ -match "\b$([regex]::Escape($appName))\b" } | Select-Object -First 1
        if ($match) {
            $node.Text += " (Instalado)"
            $node.ForeColor = [System.Drawing.Color]::LightGreen
            $node.Checked = $false # Desmarca por padrao se ja estiver instalado
        }
        $categoryNode.Nodes.Add($node) | Out-Null
    }

    # Cria as categorias da arvore
    $recomm = New-Object System.Windows.Forms.TreeNode("Aplicativos Recomendados")
    $optional = New-Object System.Windows.Forms.TreeNode("Aplicativos Opcionais")
    $shortcuts = New-Object System.Windows.Forms.TreeNode("Atalhos da Web")
    
    # Popula as categorias a partir da configuração central
    $script:config.RecommendedApps | ForEach-Object { New-AppNode -appName $_.Name -categoryNode $recomm }
    $script:config.OptionalApps | ForEach-Object { New-AppNode -appName $_.Name -categoryNode $optional }
    $script:config.WebShortcuts | ForEach-Object { $shortcuts.Nodes.Add("Criar Atalho: $($_.Name)") | Out-Null }
    
    # Adiciona as categorias preenchidas à arvore principal da interface
    $appsTreeView.Nodes.AddRange(@($recomm, $optional, $shortcuts))
    $appsTreeView.ExpandAll()
    $appsTreeView.EndUpdate()
	
	if ($appsTreeView.Nodes.Count -gt 0) {
    $appsTreeView.Nodes[0].EnsureVisible()
}
}

function Populate-GodModeList { $script:godModeItems = @(); $path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace"; Get-ChildItem $path -EA SilentlyContinue | % { $name = (Get-ItemProperty -Path $_.PSPath -Name '(default)' -EA SilentlyContinue).'(default)'; $cmd = "explorer.exe shell:::$($_.PSChildName)"; if (-not [string]::IsNullOrWhiteSpace($name)) { $script:godModeItems += @{ Name = $name; Command = $cmd } } }; $script:godModeItems = $script:godModeItems | Sort-Object Name; $godModeListView.Items.Clear(); $script:godModeItems.ForEach({ $item = New-Object System.Windows.Forms.ListViewItem($_.Name); $item.SubItems.Add($_.Command) | Out-Null; $godModeListView.Items.Add($item) | Out-Null }); $godModeListView.AutoResizeColumns(1); $godModeListView.Add_MouseDoubleClick({ if ($this.SelectedItems.Count -gt 0) { $cmd = $this.SelectedItems[0].SubItems[1].Text; try { $parts = $cmd -split ' ', 2; $exe = $parts[0]; $args = if ($parts.Count -gt 1) { $parts[1] } else { "" }; Start-Process -FilePath $exe -ArgumentList $args } catch {} } }); $godModeSearchBox.Add_TextChanged({ $text = $this.Text; $godModeListView.BeginUpdate(); $godModeListView.Items.Clear(); $script:godModeItems | ? { $_.Name -like "*$text*" } | % { $item = New-Object System.Windows.Forms.ListViewItem($_.Name); $item.SubItems.Add($_.Command) | Out-Null; $godModeListView.Items.Add($item) | Out-Null }; $godModeListView.EndUpdate() }) }
function Set-CheckedStateOnControl { param($Control, $State); if ($Control -is [System.Windows.Forms.CheckedListBox]) { for ($i = 0; $i -lt $Control.Items.Count; $i++) { $Control.SetItemChecked($i, $State) } } elseif ($Control -is [System.Windows.Forms.TreeView]) { function Set-Node($nodes, $check) { foreach ($n in $nodes) { $n.Checked = $check; if ($n.Nodes.Count -gt 0) { Set-Node $n.Nodes $check } } }; Set-Node $Control.Nodes $State } elseif ($Control -is [System.Windows.Forms.ListView]) { $Control.Items | % { $_.Checked = $State } } }
function Sort-ListView {
    param($sender, $e)

    $listView = $sender
    $columnIndex = $e.Column

    if (-not $listView.Name) { return }

    # Garante que a variavel de estado exista antes de usa-la.
    if ($null -eq $script:listViewSortState) {
        $script:listViewSortState = @{}
    }
    if (-not $script:listViewSortState.ContainsKey($listView.Name)) {
        $script:listViewSortState[$listView.Name] = @{ Column = -1; Order = 'Ascending' }
    }

    # Determina a nova ordem de classificacao
    $currentSort = $script:listViewSortState[$listView.Name]
    if ($currentSort.Column -eq $columnIndex) {
        if ($currentSort.Order -eq 'Ascending') {
            $currentSort.Order = 'Descending'
        } else {
            $currentSort.Order = 'Ascending'
        }
    } else {
        $currentSort.Column = $columnIndex
        $currentSort.Order = 'Ascending'
    }

    # Cria uma lista de objetos personalizados para uma ordenacao segura e correta
    $itemsToSort = [System.Collections.ArrayList]::new()
    foreach ($item in $listView.Items) {
        $sortValue = $item.SubItems[$columnIndex].Text
        # Tenta converter o valor para um numero para ordenacao numerica
        $isNumeric, $numericValue = [decimal]::TryParse($sortValue, [ref]$null)
        
        $itemsToSort.Add([pscustomobject]@{
            SortKey = if ($isNumeric) { $numericValue } else { $sortValue }
            Item = $item
        }) | Out-Null
    }

    # Ordena a lista de objetos
    $sortedItems = $itemsToSort | Sort-Object -Property SortKey -Descending:($currentSort.Order -eq 'Descending')

    # Re-popula a lista com os itens ordenados
    $listView.BeginUpdate()
    $listView.Items.Clear()
    foreach ($sorted in $sortedItems) {
        $listView.Items.Add($sorted.Item) | Out-Null
    }
    $listView.EndUpdate()
}

function Start-Execution {
    param(
        [bool]$AllTabs = $false,
        [System.Collections.ArrayList]$CustomTasks = $null
    )
    
    $script:shutdownTimer.Stop()

    # Listas para organizar o que fazer
    $tasksToProcess = [System.Collections.ArrayList]::new()
    $interactiveTasksToRun = [System.Collections.ArrayList]::new()
    $backgroundTasksToRun = [System.Collections.ArrayList]::new()

    # Le o estado do novo checkbox "Parar na primeira falha"
    $stopOnFail = if ($stopOnFailCheckBox.Checked) { $true } else { $false }

    # --- ETAPA 1: Coletar todas as tarefas selecionadas na UI ---
    if ($CustomTasks) {
        $tasksToProcess.AddRange($CustomTasks)
    } else {
        $tabs = if ($AllTabs) { $tabControl.TabPages } else { @($tabControl.SelectedTab) }
        foreach ($tab in $tabs) {
            switch ($tab.Text) {
                "Sistema e Manutencao" {
                    $systemCheckedListBox.CheckedItems | ForEach-Object { $tasksToProcess.Add(@{ Name = $_; Definition = $systemTasks[$_] }) | Out-Null }
                    $maintenanceCheckedListBox.CheckedItems | ForEach-Object { $tasksToProcess.Add(@{ Name = $_; Definition = $maintenanceTasks[$_] }) | Out-Null }
                }
				"(BETA) Recursos do Windows" {
					foreach ($item in $windowsFeaturesListView.CheckedItems) {
					$featureName = $item.Text 
					$currentStatus = $item.SubItems[1].Text

    if ($currentStatus -eq 'Disabled') {
$actionBlock = [scriptblock]::Create(@"
            Enable-WindowsOptionalFeature -Online -FeatureName '$featureName' -All -NoRestart -Verbose -ErrorAction Stop
            `$status = Get-WindowsOptionalFeature -Online -FeatureName '$featureName'
            if (`$status.RestartNeeded) { `$script:rebootRequired = `$true }
"@)
        $tasksToProcess.Add(@{ Name = "Habilitando Recurso: $featureName"; Definition = $actionBlock }) | Out-Null
    }
    # Se estiver habilitado, a tarefa sera DESABILITAR
    elseif ($currentStatus -eq 'Enabled') {
        # AJUSTE: Alterado para "Here-String" (@"...")
        $actionBlock = [scriptblock]::Create(@"
            Disable-WindowsOptionalFeature -Online -FeatureName '$featureName' -NoRestart -Verbose -ErrorAction Stop
            `$status = Get-WindowsOptionalFeature -Online -FeatureName '$featureName'
            if (`$status.RestartNeeded) { `$script:rebootRequired = `$true }
"@)
        $tasksToProcess.Add(@{ Name = "Desabilitando Recurso: $featureName"; Definition = $actionBlock }) | Out-Null
    }
}				
}
                    "(BETA) Personalizacao" {
                    $personalizationCheckedListBox.CheckedItems | ForEach-Object { $tasksToProcess.Add(@{ Name = $_; Definition = $personalizationTasks[$_] }) | Out-Null }
                }
                "Softwares" {
                    function Get-CheckedTreeNodes($nodes) { foreach ($node in $nodes) { if ($node.Checked -and $node.Nodes.Count -eq 0) { $node }; if ($node.Nodes.Count -gt 0) { Get-CheckedTreeNodes $node.Nodes } } }
                    Get-CheckedTreeNodes $appsTreeView.Nodes | ForEach-Object {
                        $taskName = $_.Text
                        if ($appTasks.Keys -contains $taskName) { $tasksToProcess.Add(@{ Name = $taskName; Definition = $appTasks[$taskName] }) | Out-Null }
                        elseif ($shortcutTasks.Keys -contains $taskName) { $tasksToProcess.Add(@{ Name = $taskName; Definition = $shortcutTasks[$taskName] }) | Out-Null }
                    }
                }
                "Otimizacao e Bloatware" {
                    $debloatCheckedListBox.CheckedItems | ForEach-Object { $tasksToProcess.Add(@{ Name = $_; Definition = $debloatTasks[$_] }) | Out-Null }
                }
                "Endpoint Security" {
                    $endpointSecurityCheckedListBox.CheckedItems | ForEach-Object { $tasksToProcess.Add(@{ Name = $_; Definition = $endpointSecurityTasks[$_] }) | Out-Null }
                }
            }
        }
    }

    if ($tasksToProcess.Count -eq 0) { return }

    # --- ETAPA 2: Separar as tarefas entre Interativas e de Fundo ---
    foreach ($task in $tasksToProcess) {
        if ($task.Definition -is [hashtable] -and $task.Definition.ContainsKey('Interactive') -and $task.Definition.Interactive) {
            $interactiveTasksToRun.Add($task) | Out-Null
        } else {
            $backgroundTasksToRun.Add($task) | Out-Null
        }
    }

    # --- ETAPA 3: Executar tarefas interativas primeiro, na thread principal ---
    if ($interactiveTasksToRun.Count -gt 0) {
        Update-Status "Executando $($interactiveTasksToRun.Count) tarefa(s) interativa(s)..."
        foreach ($task in $interactiveTasksToRun) {
            try {
                $action = $task.Definition.Action
                Run-Task -description $task.Name -action $action
            } catch {
                if ($stopOnFail) {
                    Update-Status "Execucao interrompida por falha em tarefa interativa."
                    return
                }
            }
        }
    }

    # --- ETAPA 4: Executar tarefas de fundo no Job, se houver alguma ---
    if ($backgroundTasksToRun.Count -eq 0) {
        Update-Status "Processo concluido."
        $script:controlsToToggle.ForEach({ if ($_.IsHandleCreated) { $_.Enabled = $true } })
        return
    }

    Update-Status "Iniciando a execucao de $($backgroundTasksToRun.Count) tarefa(s) em segundo plano..."
    
    $script:controlsToToggle.ForEach({ if ($_.IsHandleCreated) { $_.Enabled = $false } })
    $form.Refresh()

    # CORRECAO: Popup de carregamento simplificado e centralizado manualmente.
    $script:loadingOverlay = New-Object System.Windows.Forms.Form
    $script:loadingOverlay.FormBorderStyle = 'None'
    $script:loadingOverlay.Size = New-Object System.Drawing.Size(400, 80)
    $script:loadingOverlay.BackColor = $script:themeColors.FormBackground
    $script:loadingOverlay.StartPosition = 'Manual' # Define o posicionamento como manual

    # Logica para calcular a posicao central
    $parentX = $form.Location.X
    $parentY = $form.Location.Y
    $parentW = $form.Width
    $parentH = $form.Height
    $childW = $script:loadingOverlay.Width
    $childH = $script:loadingOverlay.Height
    $newX = $parentX + (($parentW - $childW) / 2)
    $newY = $parentY + (($parentH - $childH) / 2)
    $script:loadingOverlay.Location = New-Object System.Drawing.Point($newX, $newY)
    
    $loadingLabel = New-Object System.Windows.Forms.Label
    $loadingLabel.Text = "Executando tarefas em segundo plano..."
    $loadingLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
    $loadingLabel.ForeColor = $script:themeColors.Foreground
    $loadingLabel.AutoSize = $false
    $loadingLabel.Dock = 'Fill'
    $loadingLabel.TextAlign = 'MiddleCenter'
    $script:loadingOverlay.Controls.Add($loadingLabel)
    $script:loadingOverlay.Show($form)


$requiredFunctions = @( 'Run-Task', 'Ensure-ChocolateyIsInstalled', 'Install-Chocolatey', 'Test-NetConnectionSafe', 'Install-App', 'Install-Softphone', 'Create-SingleWebShortcut', 'Handle-Hostname', 'Activate-Windows', 'Install-VCRedist', 'Install-DotNetFX', 'Force-WindowsUpdates', 'Configure-System-ThemeAndTaskbar', 'Configure-System-Wallpaper', 'Configure-Teams-Backgrounds', 'Install-OneDrive', 'Disable-Telemetry', 'Adjust-For-Performance', 'Clean-Prefetch', 'Empty-RecycleBin', 'Disk-Cleanup', 'Clean-TempFiles', 'Install-TrendMicroAgent', 'Run-SFC-Scan', 'Run-DISM-Repair', 'Run-Chkdsk', 'Flush-DNS-Cache', 'Reset-Winsock', 'Validate-And-Repair-OneDrive', 'Stop-Process-AndWait', 'Get-Image-List-From-Url', 'Download-File-Robust', 'Find-ExecutablePath', 'Get-DownloadsPath', 'Get-And-Convert-ShortcutIcon', 'Set-TargetReleaseVersion', 'Install-DotNetFX35', 'Install-DotNetFX48', 'Install-DirectX', 'Start-ResetWebExperience' )

    $functionDefinitions = @{}
	
$requiredFunctions | ForEach-Object { if(Test-Path "function:$_") { $functionDefinitions[$_] = (Get-Content "function:$_") } }   
    $sb = {
        param($tasks, $functions, $stopOnFailFlag)
        
        foreach ($funcName in $functions.Keys) { Set-Item -Path "Function:\$funcName" -Value $functions[$funcName] }
        function Update-Status($message) { Write-Output "LOG:$message" }
        
        $script:taskResults = [ordered]@{}
        $script:rebootRequired = $false
        $script:config = $using:script:config

        $total = $tasks.Count; $c = 0; $failed = $false
        foreach ($task in $tasks) {
            try {
                $action = if ($task.Definition -is [hashtable]) { $task.Definition.Action } else { $task.Definition }
                Run-Task -description $task.Name -action $action
            } catch {
                $failed = $true
                $errorMessage = "ERRO FATAL NA TAREFA '$($task.Name)': $($_.Exception.ToString())"
                Write-Output "LOG:$errorMessage"
                if ($stopOnFailFlag) {
                    Write-Output "LOG:--- Execucao interrompida devido a opcao 'Parar na primeira falha' ---"
                    break
                }
            }
            $c++; $p = [int](($c / $total) * 100)
            Write-Output ("PROGRESS:{0}:{1}" -f $p, $task.Name)
        }
        
        Write-Output "REBOOT_REQUIRED:$($script:rebootRequired)"
        Write-Output "COMPLETE:$failed"
    }

    $args = @( $backgroundTasksToRun, $functionDefinitions, $stopOnFail )
    $script:executionJob = Start-Job -ScriptBlock $sb -ArgumentList $args
    $script:progressTimer.Start()
}

function Clean-OrphanedRegistryEntries {
    Run-Task "Limpeza de Desinstaladores Orfaos do Registro" {
        Update-Status "... Verificando Desinstaladores Orfaos no Registro do Windows..."
        $orphansToDelete = [System.Collections.ArrayList]::new()

        # Logica que busca por entradas de desinstalacao cuja pasta de instalacao nao existe mais
        $uninstPaths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
        foreach ($p in $uninstPaths) {
            Get-ChildItem -Path $p -ErrorAction SilentlyContinue | ForEach-Object {
                $installLocation = $_.GetValue("InstallLocation")
                $displayName = $_.GetValue("DisplayName")
                # So considera orfao se tiver um DisplayName e uma pasta de instalacao que nao existe
                if ((-not [string]::IsNullOrWhiteSpace($displayName)) -and $installLocation -and (-not (Test-Path $installLocation))) {
                    $orphansToDelete.Add(@{ Name = $displayName; Path = $_.PSPath }) | Out-Null
                }
            }
        }

        if ($orphansToDelete.Count -eq 0) {
            Update-Status "... Nenhum Desinstalador Orfao encontrado no registro."
            return
        }

        Update-Status "--> Encontrados $($orphansToDelete.Count) desinstaladores orfaos. Iniciando limpeza automatica..."
        foreach ($orphan in $orphansToDelete) {
            try {
                Update-Status "--> Removendo registro orfao: $($orphan.Name)"
                Remove-Item -Path $orphan.Path -Recurse -Force -ErrorAction Stop
            } catch {
                Update-Status "AVISO: Falha ao remover chave de registro para '$($orphan.Name)'."
            }
        }
        Update-Status "... Limpeza de registros orfaos concluida."
    }
}

function Start-ResetWebExperience {
    $atLeastOneActionSucceeded = $false
    $errors = [System.Collections.ArrayList]::new()
    
    Update-Status "Iniciando redefinição da Experiência de Pesquisa..."

    # --- ETAPA 0 (NOVA): Matar processos que bloqueiam o reset ---
    # Isso é crucial. Se o SearchHost estiver rodando, o Reset-AppxPackage falha.
    $processesToKill = @("SearchApp", "SearchHost", "StartMenuExperienceHost", "ShellExperienceHost")
    foreach ($procName in $processesToKill) {
        if (Get-Process -Name $procName -ErrorAction SilentlyContinue) {
            Update-Status "... Encerrando processo: $procName (para liberar arquivos)"
            Stop-Process -Name $procName -Force -ErrorAction SilentlyContinue
        }
    }
    # Pequena pausa para o sistema liberar os handles dos arquivos
    Start-Sleep -Seconds 2

    # --- ETAPA 1: Redefinir pacotes Appx (se existirem) ---
    Update-Status "Tentativa 1: Procurando e resetando pacotes Appx de pesquisa..."
    try {
        $patterns = @("*WebExperience*", "*SearchApp*", "*Windows.Search*")
        $packagesToReset = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
        
        foreach ($pattern in $patterns) {
            # Filtramos para pegar apenas pacotes 'Main' (do usuário) ou que não sejam puramente de sistema intocável
            $foundPackages = Get-AppxPackage -Name $pattern -ErrorAction SilentlyContinue | Where-Object { $_.SignatureKind -ne "System" }
            foreach ($pkg in $foundPackages) {
                if ($packagesToReset.Add($pkg.PackageFullName)) {
                     Update-Status "... Pacote identificado: $($pkg.Name)"
                }
            }
        }

        if ($packagesToReset.Count -gt 0) {
            foreach ($packageName in $packagesToReset) {
                try {
                    Update-Status "... Resetando: $packageName"
                    $package = Get-AppxPackage -Name $packageName -ErrorAction Stop
                    $package | Reset-AppxPackage -ErrorAction Stop
                    Update-Status "--> SUCESSO: Pacote '$packageName' redefinido."
                    $atLeastOneActionSucceeded = $true
                } catch {
                    $errMsg = "AVISO: Falha ao redefinir '$packageName'. (O Windows pode estar bloqueando). Erro: $($_.Exception.Message)"
                    Update-Status $errMsg
                    $errors.Add($errMsg) | Out-Null
                }
            }
        } else {
            Update-Status "Nenhum pacote Appx de pesquisa encontrado para resetar (Normal em algumas versões do Win10/11)."
        }
    } catch {
        $errMsg = "AVISO: Erro genérico na busca por pacotes Appx. Erro: $($_.Exception.Message)"
        Update-Status $errMsg
        $errors.Add($errMsg) | Out-Null
    }

    # --- ETAPA 2: Reconstruir o Índice do Windows Search (WSearch) ---
    Update-Status "Tentativa 2: Recriando banco de dados do índice (WSearch)..."
    try {
        $service = Get-Service -Name "WSearch" -ErrorAction Stop
        if ($service.Status -ne 'Stopped') {
            Update-Status "... Parando serviço 'WSearch'"
            Stop-Service -Name "WSearch" -Force -ErrorAction Stop
        }
        
        # Local padrão do banco de dados do índice
        $indexPath = "$env:ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb"
        if (Test-Path $indexPath) {
            Update-Status "... Removendo arquivo de índice corrompido/antigo (Windows.edb)"
            Remove-Item -Path $indexPath -Force -ErrorAction Stop
        }
        
        Update-Status "... Reiniciando serviço 'WSearch'"
        Start-Service -Name "WSearch" -ErrorAction Stop
        $atLeastOneActionSucceeded = $true
        Update-Status "--> Índice recriado. O Windows começará a reindexar em segundo plano."
    } catch {
        $errMsg = "ERRO: Falha ao manipular serviço WSearch. Erro: $($_.Exception.Message)"
        Update-Status $errMsg
        $errors.Add($errMsg) | Out-Null
        # Tenta reiniciar o serviço por garantia caso tenha ficado parado
        try { Start-Service -Name "WSearch" -ErrorAction SilentlyContinue } catch {}
    }

    # --- Verificação Final ---
    if (-not $atLeastOneActionSucceeded) {
        throw "Falha total: Não foi possível resetar Appx nem o Serviço de Busca."
    }
    
    Update-Status "Redefinição de pesquisa concluída."
}

# --- CRIAcaO DO FORMULARio (continuacao) ---
$form = New-Object System.Windows.Forms.Form
$form.Text = 'AZTools 2.1 || Build 25112025-Nightly'
$form.Size = New-Object System.Drawing.Size(1200, 700) 
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

Enable-FormDragging -Control $titleBar -Form $form
Enable-FormDragging -Control $titleLabel -Form $form

# --- Criacao das Abas ---
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Multiline = $true
$systemTabPage = New-Object System.Windows.Forms.TabPage; $systemTabPage.Text = "Sistema e Manutencao"
$filesTabPage = New-Object System.Windows.Forms.TabPage; $filesTabPage.Text = "Limpeza de Arquivos e Registros"
$personalizationTabPage = New-Object System.Windows.Forms.TabPage; $personalizationTabPage.Text = "(BETA) Personalizacao"
$softwaresTabPage = New-Object System.Windows.Forms.TabPage; $softwaresTabPage.Text = "Softwares"
$debloatTabPage = New-Object System.Windows.Forms.TabPage; $debloatTabPage.Text = "Otimizacao e Bloatware"
$endpointSecurityTabPage = New-Object System.Windows.Forms.TabPage; $endpointSecurityTabPage.Text = "Endpoint Security"
$godModeTabPage = New-Object System.Windows.Forms.TabPage; $godModeTabPage.Text = "God Mode"
$windowsFeaturesTabPage = New-Object System.Windows.Forms.TabPage; $windowsFeaturesTabPage.Text = "(BETA) Recursos do Windows"

$tabControl.TabPages.AddRange(@($systemTabPage, $filesTabPage, $personalizationTabPage, $softwaresTabPage, $debloatTabPage, $endpointSecurityTabPage, $godModeTabPage, $windowsFeaturesTabPage))

# --- Criacao e Populacao dos Controles das Abas ---

# Aba Sistema e Manutencao
$systemMaintenanceTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $systemMaintenanceTablePanel.Dock = "Fill"; $systemMaintenanceTablePanel.ColumnCount = 2; $systemMaintenanceTablePanel.RowCount = 1
$systemMaintenanceTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$systemMaintenanceTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$systemTabPage.Controls.Add($systemMaintenanceTablePanel)

#Aba de recursos do Windows
$featuresContainerPanel = New-Object System.Windows.Forms.TableLayoutPanel
$featuresContainerPanel.Dock = "Fill"
$featuresContainerPanel.ColumnCount = 1
$featuresContainerPanel.RowCount = 3 # AUMENTADO PARA 3 LINHAS
$featuresContainerPanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::AutoSize)))
$featuresContainerPanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::AutoSize))) # LINHA PARA A CAIXA DE PESQUISA
$featuresContainerPanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 100)))

$featuresInfoLabel = New-Object System.Windows.Forms.Label
$featuresInfoLabel.Text = "Nota: A instalacao de recursos depende da saude do sistema. Em caso de erros, utilize as tarefas de reparo neste na aba Sistemas e Manutencao."
$featuresInfoLabel.Dock = "Top"; $featuresInfoLabel.AutoSize = $true; $featuresInfoLabel.Padding = New-Object System.Windows.Forms.Padding(5); $featuresInfoLabel.ForeColor = [System.Drawing.Color]::Khaki
$featuresContainerPanel.Controls.Add($featuresInfoLabel, 0, 0)

# NOVA CAIXA DE PESQUISA
$featuresSearchBox = New-Object System.Windows.Forms.TextBox
$featuresSearchBox.Dock = "Fill"
$featuresSearchBox.Margin = New-Object System.Windows.Forms.Padding(5,0,5,5)
$featuresContainerPanel.Controls.Add($featuresSearchBox, 0, 1)

$windowsFeaturesListView = New-Object System.Windows.Forms.ListView; $windowsFeaturesListView.View = 'Details'; $windowsFeaturesListView.CheckBoxes = $true; $windowsFeaturesListView.FullRowSelect = $true
$windowsFeaturesListView.Name = "featuresListView" 
$windowsFeaturesListView.Add_ColumnClick({ Sort-ListView @args }) 
$windowsFeaturesListView.Columns.Add("Nome Tecnico", 350) | Out-Null
$windowsFeaturesListView.Columns.Add("Status", 100) | Out-Null
$featuresMainPanelGroup = (Create-TitledControlPanel $featuresContainerPanel "Recursos Opcionais do Windows" $windowsFeaturesListView -ExtraButtonText "Analisar Recursos" -ExtraButtonAction { Check-WindowsFeaturesStatus }).Parent

$featuresContainerPanel.Controls.Add($featuresMainPanelGroup, 0, 2)

$windowsFeaturesTabPage.Controls.Add($featuresContainerPanel)

$systemCheckedListBox = Create-TitledControlPanel $systemMaintenanceTablePanel "Tarefas de Sistema e Configuracao" (New-Object System.Windows.Forms.CheckedListBox)
$maintenanceCheckedListBox = Create-TitledControlPanel $systemMaintenanceTablePanel "Tarefas de Manutencao e Reparacao" (New-Object System.Windows.Forms.CheckedListBox)

# Aba Personalizacao
$personalizationCheckedListBox = Create-TitledControlPanel $personalizationTabPage "Tarefas de Personalizacao" (New-Object System.Windows.Forms.CheckedListBox)

# Aba Otimizacao e Bloatware
$debloatTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $debloatTablePanel.Dock = "Fill"; $debloatTablePanel.ColumnCount = 2
$debloatTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$debloatTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))

$debloatTablePanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 50)))

$debloatTabPage.Controls.Add($debloatTablePanel)
$debloatCheckedListBox = Create-TitledControlPanel $debloatTablePanel "Tarefas de Otimizacao" (New-Object System.Windows.Forms.CheckedListBox)
$bloatwarePanel = Create-ListViewManagementPanel "Gerenciar apps nativos" "Verificar Status" "Aplicar Acoes"
$bloatwarePanel.Control.Name = 'bloatwareListView' # Atribui um nome para o estado da ordenacao
$bloatwarePanel.Control.Add_ColumnClick({ Sort-ListView @args }) # Adiciona o evento de ordenacao
$debloatTablePanel.Controls.Add($bloatwarePanel.Group, 1, 0)

# --- Aba Limpeza de Arquivos e Registros ---
$filesAndRegTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $filesAndRegTablePanel.Dock = "Fill"; $filesAndRegTablePanel.ColumnCount = 2
$filesAndRegTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$filesAndRegTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50)))
$filesTabPage.Controls.Add($filesAndRegTablePanel)

# Lado Esquerdo (Arquivos)
$filesPanel = Create-TreeViewAnalysisPanel "Limpeza de Arquivos" "Analisar Arquivos" "Limpar Selecionados"
$filesAndRegTablePanel.Controls.Add($filesPanel.Group, 0, 0)

# Lado Direito (Registro) - INICIO DA CORREÇÃO
$regCleanerGroup = New-Object System.Windows.Forms.GroupBox; $regCleanerGroup.Text = "Limpeza de Registro"; $regCleanerGroup.Dock = "Fill"

$regCleanerListView = New-Object System.Windows.Forms.ListView; $regCleanerListView.Dock = "Fill"; $regCleanerListView.View = "Details"; $regCleanerListView.CheckBoxes = $true
$regCleanerListView.Name = 'registryCleanerListView' 
$regCleanerListView.Add_ColumnClick({ Sort-ListView @args }) 
Add-ListViewColumns $regCleanerListView @("(#)", "Tipo", "Registro", "Localizacao")

$regCleanerSummaryLabel = New-Object System.Windows.Forms.Label
$regCleanerSummaryLabel.Dock = "Bottom"
$regCleanerSummaryLabel.Text = "Total de itens selecionados: 0"
$regCleanerSummaryLabel.TextAlign = "MiddleRight"
$regCleanerSummaryLabel.Padding = New-Object System.Windows.Forms.Padding(0,0,5,5)

$regCleanerButtonPanel = New-Object System.Windows.Forms.Panel; $regCleanerButtonPanel.Height = 30; $regCleanerButtonPanel.Dock = "Bottom"

# Botões Corrigidos com AutoSize
$analyzeRegButton = New-Object System.Windows.Forms.Button; $analyzeRegButton.Text = "Analisar"; $analyzeRegButton.Dock = "Left"
$analyzeRegButton.AutoSize = $true; $analyzeRegButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $analyzeRegButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)

$backupRegButton = New-Object System.Windows.Forms.Button; $backupRegButton.Text = "Fazer Backup"; $backupRegButton.Dock = "Left"; $backupRegButton.Enabled = $false
$backupRegButton.AutoSize = $true; $backupRegButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $backupRegButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)

$cleanRegButton = New-Object System.Windows.Forms.Button; $cleanRegButton.Text = "Limpar Selecionados"; $cleanRegButton.Dock = "Right"; $cleanRegButton.Enabled = $false
$cleanRegButton.AutoSize = $true; $cleanRegButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $cleanRegButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)

# 1. Adiciona botões ao painel de botões
$regCleanerButtonPanel.Controls.AddRange(@($analyzeRegButton, $backupRegButton, $cleanRegButton))

# 2. Adiciona Lista, Label e Botões ao Grupo (GroupBox)
$regCleanerGroup.Controls.AddRange(@($regCleanerListView, $regCleanerSummaryLabel, $regCleanerButtonPanel))

# 3. Adiciona o Grupo ao Painel Principal (Lado Direito - Coluna 1)
$filesAndRegTablePanel.Controls.Add($regCleanerGroup, 1, 0)
# --- FIM DA CORREÇÃO ---
# Endpoint Security
# CRIA UM PAINEL DE LAYOUT PARA ABRIGAR O AVISO E A LISTA
$endpointContainerPanel = New-Object System.Windows.Forms.TableLayoutPanel
$endpointContainerPanel.Dock = "Fill"
$endpointContainerPanel.ColumnCount = 1
$endpointContainerPanel.RowCount = 2 # Duas linhas: uma para o aviso, uma para o conteudo
$endpointContainerPanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::AutoSize))) # A primeira linha se ajusta ao tamanho do texto
$endpointContainerPanel.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 100))) # A segunda linha ocupa o resto do espaco
$endpointSecurityTabPage.Controls.Add($endpointContainerPanel)

# CRIA O LABEL DE AVISO
$endpointInfoLabel = New-Object System.Windows.Forms.Label
$endpointInfoLabel.Text = "Nota: A instalacao requer que a pagina de download do agente seja aberta no navegador. Siga as instrucoes que aparecerao na tela.
Se nao souber qual versao instalar, pergunte ao System Team"
$endpointInfoLabel.Dock = "Top"
$endpointInfoLabel.AutoSize = $true
$endpointInfoLabel.Padding = New-Object System.Windows.Forms.Padding(5)
$endpointInfoLabel.ForeColor = [System.Drawing.Color]::Khaki
$endpointContainerPanel.Controls.Add($endpointInfoLabel) # Adiciona o label na primeira linha

$endpointSecurityCheckedListBox = Create-TitledControlPanel $endpointContainerPanel "Instalacao de Agente de Seguranca" (New-Object System.Windows.Forms.CheckedListBox)

# Aba Softwares
$softwaresTablePanel = New-Object System.Windows.Forms.TableLayoutPanel; $softwaresTablePanel.Dock = "Fill"; $softwaresTablePanel.ColumnCount = 2
$softwaresTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 40)))
$softwaresTablePanel.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 60)))
$softwaresTabPage.Controls.Add($softwaresTablePanel)
$treeViewForApps = New-Object System.Windows.Forms.TreeView
$treeViewForApps.CheckBoxes = $true
$appsTreeView = Create-TitledControlPanel $softwaresTablePanel "Instalacao de Aplicativos e Atalhos" $treeViewForApps

$appsTreeGroup = $appsTreeView.Parent
$appsTreeButtonPanel = $appsTreeGroup.Controls | Where-Object { $_ -is [System.Windows.Forms.Panel] }

$cleanChocoCacheButton = New-Object System.Windows.Forms.Button
$cleanChocoCacheButton.Text = "Limpar Cache Choco"
$cleanChocoCacheButton.Dock = "Left"
$cleanChocoCacheButton.AutoSize = $true
$cleanChocoCacheButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$cleanChocoCacheButton.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0)
$cleanChocoCacheButton.BringToFront() 

$appsTreeButtonPanel.Controls.Add($cleanChocoCacheButton)

$managementSplitContainer = New-Object System.Windows.Forms.SplitContainer; $managementSplitContainer.Dock = "Fill"; $managementSplitContainer.Orientation = "Horizontal"
$softwaresTablePanel.Controls.Add($managementSplitContainer, 1, 0)

$managementSplitContainer.Panel1.Controls.Add($chocoUpdatesGroup)
$chocoUpdatesGroup = New-Object System.Windows.Forms.GroupBox; $chocoUpdatesGroup.Text = "Aplicativos Gerenciados (Chocolatey)"; $chocoUpdatesGroup.Dock = "Fill"
$chocoUpdatesListView = New-Object System.Windows.Forms.ListView; $chocoUpdatesListView.Dock = "Fill"; $chocoUpdatesListView.View = "Details"; $chocoUpdatesListView.CheckBoxes = $true
$chocoUpdatesListView.Name = 'chocoUpdatesListView' # Atribui um nome para o estado da ordenacao
$chocoUpdatesListView.Add_ColumnClick({ Sort-ListView @args }) # Adiciona o evento de ordenacao
Add-ListViewColumns $chocoUpdatesListView @("(#)", "Nome", "Versao Atual", "Nova Versao")
$chocoUpdatesButtonPanel = New-Object System.Windows.Forms.Panel; $chocoUpdatesButtonPanel.Height = 30; $chocoUpdatesButtonPanel.Dock = "Bottom"

# Botão Scanner Choco
$scanChocoButton = New-Object System.Windows.Forms.Button
$scanChocoButton.Text = "Scanner Choco"
$scanChocoButton.Dock = "Left"
$scanChocoButton.AutoSize = $true
$scanChocoButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$scanChocoButton.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0)

# Botão Atualizar Selecionados
$updateChocoButton = New-Object System.Windows.Forms.Button
$updateChocoButton.Text = "Atualizar Selecionados"
$updateChocoButton.Dock = "Right"
$updateChocoButton.Enabled = $false
$updateChocoButton.AutoSize = $true
$updateChocoButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$updateChocoButton.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0)

$chocoUpdatesButtonPanel.Controls.AddRange(@($scanChocoButton, $updateChocoButton))
$chocoUpdatesGroup.Controls.AddRange(@($chocoUpdatesListView, $chocoUpdatesButtonPanel))

$managementSplitContainer.Panel1.Controls.Add($chocoUpdatesGroup)
$regUpdatesGroup = New-Object System.Windows.Forms.GroupBox; $regUpdatesGroup.Text = "Todos os aplicativos instalados"; $regUpdatesGroup.Dock = "Fill"

$regSearchBox = New-Object System.Windows.Forms.TextBox
$regSearchBox.Dock = "Top" # Define que ela ficará no topo do GroupBox


$regUpdatesListView = New-Object System.Windows.Forms.ListView; $regUpdatesListView.Dock = "Fill"; $regUpdatesListView.View = "Details"; $regUpdatesListView.CheckBoxes = $true;
$regUpdatesListView.Name = 'registeredAppsListView' # Atribui um nome para o estado da ordenacao
$regUpdatesListView.Add_ColumnClick({ Sort-ListView @args }) # Adiciona o evento de ordenacao
Add-ListViewColumns $regUpdatesListView @("Origem", "(#)", "Nome", "Versao", "Desenvolvedor")
$regButtonPanel = New-Object System.Windows.Forms.Panel; $regButtonPanel.Height = 30; $regButtonPanel.Dock = "Bottom"

# Botão Scanner Registro
$scanRegButton = New-Object System.Windows.Forms.Button
$scanRegButton.Text = "Scanner Registro"
$scanRegButton.Dock = "Left"
$scanRegButton.AutoSize = $true
$scanRegButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$scanRegButton.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0)

# Botão Pesquisar Att.
$searchForUpdateButton = New-Object System.Windows.Forms.Button
$searchForUpdateButton.Text = "Pesquisar Att."
$searchForUpdateButton.Dock = "Right"
$searchForUpdateButton.Enabled = $false
$searchForUpdateButton.AutoSize = $true
$searchForUpdateButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$searchForUpdateButton.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0)

# Botão Desinstalar Selecionados
$uninstallRegButton = New-Object System.Windows.Forms.Button
$uninstallRegButton.Text = "Desinstalar Selecionados"
$uninstallRegButton.Dock = "Right"
$uninstallRegButton.Enabled = $false
$uninstallRegButton.AutoSize = $true
$uninstallRegButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$uninstallRegButton.Padding = New-Object System.Windows.Forms.Padding(10, 0, 10, 0)

# A ordem aqui define quem fica mais à direita. 
# O primeiro adicionado com Dock=Right fica na extrema direita.
$regButtonPanel.Controls.AddRange(@($scanRegButton, $searchForUpdateButton, $uninstallRegButton))
$regUpdatesGroup.Controls.AddRange(@($regUpdatesListView, $regButtonPanel, $regSearchBox))
$managementSplitContainer.Panel2.Controls.Add($regUpdatesGroup)

# Aba God Mode
$godModeGroup = New-Object System.Windows.Forms.GroupBox; $godModeGroup.Text = "Atalhos do Painel de Controle (Duplo Clique para Abrir)"; $godModeGroup.Dock = "Fill"
$godModeSearchBox = New-Object System.Windows.Forms.TextBox; $godModeSearchBox.Dock = "Top"
$godModeListView = New-Object System.Windows.Forms.ListView; $godModeListView.Dock = "Fill"; $godModeListView.View = "Details"; $godModeListView.FullRowSelect = $true
$godModeListView.Name = 'godModeListView' # Atribui um nome para o estado da ordenacao
$godModeListView.Add_ColumnClick({ Sort-ListView @args }) # Adiciona o evento de ordenacao
Add-ListViewColumns $godModeListView @("Nome da Configuracao", "Comando")
$godModeGroup.Controls.AddRange(@($godModeListView, $godModeSearchBox))
$godModeTabPage.Controls.Add($godModeGroup)

# --- Controles Principais (Log, Botoes, Progresso) ---
$statusGroup = New-Object System.Windows.Forms.GroupBox; $statusGroup.Text = "Log de Execucao";
$statusBox = New-Object System.Windows.Forms.TextBox; $statusBox.Multiline = $true; $statusBox.Dock = "Fill"; $statusBox.ScrollBars = "Vertical"; $statusBox.Font = "Consolas, 10"; $statusBox.ReadOnly = $true; $statusGroup.Controls.Add($statusBox)
$mainButtonPanel = New-Object System.Windows.Forms.Panel; $mainButtonPanel.Height = 40; $mainButtonPanel.Dock = "Bottom"

# Botões Esquerda (Executar) - AutoSize e Padding maior para destaque
$runCurrentTabButton = New-Object System.Windows.Forms.Button; $runCurrentTabButton.Text = "Executar Aba Atual"; $runCurrentTabButton.Dock = "Left"
$runCurrentTabButton.AutoSize = $true; $runCurrentTabButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $runCurrentTabButton.Padding = New-Object System.Windows.Forms.Padding(15,0,15,0)

$runAllButton = New-Object System.Windows.Forms.Button; $runAllButton.Text = "Executar Tudo"; $runAllButton.Dock = "Left"
$runAllButton.AutoSize = $true; $runAllButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $runAllButton.Padding = New-Object System.Windows.Forms.Padding(15,0,15,0)

# Botões Direita (Fechar/Log)
$clearLogButton = New-Object System.Windows.Forms.Button; $clearLogButton.Text = "Limpar Log"; $clearLogButton.Dock = "Right"
$clearLogButton.AutoSize = $true; $clearLogButton.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $clearLogButton.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)

$closeButtonMain = New-Object System.Windows.Forms.Button; $closeButtonMain.Text = "Fechar"; $closeButtonMain.Dock = "Right"
$closeButtonMain.AutoSize = $true; $closeButtonMain.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink; $closeButtonMain.Padding = New-Object System.Windows.Forms.Padding(10,0,10,0)

# O restante do código do timer/label permanece igual...
$shutdownLabel = New-Object System.Windows.Forms.Label
$shutdownLabel.Name = 'shutdownLabel' # Damos um nome para encontra-lo depois
$shutdownLabel.Text = "15:00"
$shutdownLabel.Dock = "Right"
$shutdownLabel.Width = 60
$shutdownLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$shutdownLabel.TextAlign = "MiddleCenter"

# Adicionamos o contador ao painel
$mainButtonPanel.Controls.Add($shutdownLabel)

$mainButtonPanel.Controls.AddRange(@($runAllButton, $runCurrentTabButton, $clearLogButton, $closeButtonMain))
$stopOnFailCheckBox = New-Object System.Windows.Forms.CheckBox
$stopOnFailCheckBox.Text = "Parar na primeira falha"
$stopOnFailCheckBox.Dock = "Right"
$stopOnFailCheckBox.Width = 180
$stopOnFailCheckBox.Padding = New-Object System.Windows.Forms.Padding(0, 5, 0, 0)
$mainButtonPanel.Controls.Add($stopOnFailCheckBox)

# CORRECAO: A barra de progresso foi removida da interface principal.
$mainAreaPanel = New-Object System.Windows.Forms.Panel; $mainAreaPanel.Dock = "Fill"
$tabControl.Dock = "Top"; $tabControl.Height = 350
$statusGroup.Dock = "Fill"
$mainAreaPanel.Controls.AddRange(@($statusGroup, $tabControl))
$form.Controls.AddRange(@($mainAreaPanel, $titleBar, $mainButtonPanel))
$script:controlsToToggle = @($tabControl, $runAllButton, $runCurrentTabButton, $scanChocoButton, $updateChocoButton, $scanRegButton, $searchForUpdateButton, $uninstallRegButton, $clearLogButton, $analyzeRegButton, $backupRegButton, $windowsFeaturesListView, $cleanRegButton)

# --- LOGICA PRINCIPAL E EVENTOS ---

# =================================================================================================
# Todas as tarefas com Confirm-Action serao marcadas como Interativas.
# =================================================================================================
$systemTasks = [ordered]@{
    "Validar/Alterar Nome da Maquina"          = @{ Action = { Handle-Hostname }; Interactive = $true }
    "Ativar o Windows (Precisa da Chave)"                         = @{ Action = { Activate-Windows }; Interactive = $true }
    "Instalar Gerenciador de Pacotes Chocolatey" = { Install-Chocolatey }
    "Instalar Microsoft Visual C++ Runtimes"   = { Install-VCRedist }
    "Instalar .NET Framework (Mais Recente)"     = { Install-DotNetFX }
    "Instalar .NET Framework 3.5"              = { Install-DotNetFX35 }
    "Instalar .NET Framework 4.8"              = { Install-DotNetFX48 }
    "Instalar DirectX"                         = { Install-DirectX }
    "Definir Versao de Destino do Windows (25H2)" = { Set-TargetReleaseVersion }
    "Forcar Todas as Atualizacoes do Windows (Vai pedir para reiniciar)"  = { Force-WindowsUpdates }
}

$personalizationTasks = [ordered]@{
    "Configurar Tema e Barra de Tarefas"       = { Configure-System-ThemeAndTaskbar }
    "Configurar Wallpaper do Windows (com Selecao)" = @{ Action = { Configure-System-Wallpaper }; Interactive = $true }
    "Instalar Fundos do Microsoft Teams (AINDA NAO FUNCIONA)"  = @{ Action = { Configure-Teams-Backgrounds }; Interactive = $true }
}

$debloatTasks = [ordered]@{
    "Desativar Telemetria"                     = @{ Action = { Disable-Telemetry }; Interactive = $true }
    "Ajustar para Melhor Desempenho"           = @{ Action = { Adjust-For-Performance }; Interactive = $true }
    "Limpar Prefetch do Windows"               = @{ Action = { Clean-Prefetch }; Interactive = $true }
    "Esvaziar Lixeira"                         = @{ Action = { Empty-RecycleBin }; Interactive = $true }
    "Executar Limpeza de Disco Avancada (Demorado)"       = @{ Action = { Disk-Cleanup }; Interactive = $true }
    "Limpar Arquivos Temporarios de Instalacao (Demorado)" = @{ Action = { Clean-TempFiles }; Interactive = $true }
}

$maintenanceTasks = [ordered]@{
    "Verificar Integridade do Sistema (SFC)"       = { Run-SFC-Scan }
    "Reparar Imagem do Windows (DISM)"             = { Run-DISM-Repair }
    "Verificar Disco (Chkdsk - requer reinicializacao)" = @{ Action = { Run-Chkdsk }; Interactive = $true }
    "Limpar Cache de DNS"                          = { Flush-DNS-Cache }
    "Redefinir Catalogo Winsock (requer reinicializacao)" = { Reset-Winsock }
	"Redefinir Pesquisa do Windows (WebExperience) - Quando menu iniciar estiver lento" = { Start-ResetWebExperience } 
    "Manutencao OneDrive"                          = @{ Action = { Validate-And-Repair-OneDrive }; Interactive = $true }
}

$appTasks = [ordered]@{
    "Instalar OneDrive"                        = { Install-OneDrive }
}

$shortcutTasks = [ordered]@{ }

# --- Populacao dinamica de tarefas de software ---
$allAppDefinitions = $script:config.RecommendedApps + $script:config.OptionalApps
$allAppDefinitions | ForEach-Object {
    $app = $_
    $taskName = "$($app.Name)"
    $taskAction = $null

    # Condição especial para o softphone usar sua própria função de instalação
    if ($app.ChocoPackage -eq "softphone-interno") {
        $taskAction = { Install-Softphone }
    } 
    # Lógica padrão para todos os outros apps
    else {
        $executableValue = if ([string]::IsNullOrEmpty($app.Executable)) { "" } else { $app.Executable }
        $taskAction = [scriptblock]::Create("Install-App -appInfo @{Name=`"$($app.Name)`"; ChocoPackage=`"$($app.ChocoPackage)`"; Executable=`"$executableValue`"}")
    }
    
    $appTasks.Add($taskName, $taskAction)
}

$script:config.WebShortcuts | ForEach-Object {
    $shortcut = $_
    $taskName = "Criar Atalho: $($shortcut.Name)"
    $taskAction = [scriptblock]::Create("Create-SingleWebShortcut -ShortcutName `"$($shortcut.Name)`"")
    $shortcutTasks.Add($taskName, $taskAction)
}

$endpointSecurityTasks = [ordered]@{
    "Instalar Trend Micro (Subscricao NFR)" = { Install-TrendMicroAgent -SubscriptionType "NFR" -ActivationUrl "https://wfbs-svc-nabu.trendmicro.com/scansource_br:f80e424527c74decad12f7d4f519d706/download/pt/view/activation_mgclink?id=la8EQHxcCAR-qQ2yx9sL6wZQpAVk-iRH6T9w5U1zRDGn13cJ3T-PisiQ74SfuUBUYegl6tmbSzq25eoUyFljyJi9vNiPYLzKPT_r-JQvLFSV7ZundxYfo8PTuN8e_vgne9ZyQHNJZEwAuBEnvpczbw%3D%3D&store=1&pscd=scd6GSqa" }
    "Instalar Trend Micro (Subscricao Paga)" = { Install-TrendMicroAgent -SubscriptionType "Paga" -ActivationUrl "https://wfbs-svc-nabu.trendmicro.com/scansource_br:f80e424527c74decad12f7d4f519d706/download/en/view/activation_mgclink?id=c_PkZgH9vGVgXwp4nTZjNxJY8zsDLWE7eI8Z1sxW3282gCYv7DtA0WUrTcF8c6SDZV2aACx-Y0C4aHBbLJp4IssPsmadDKR42iBZKqHWmGfxsVb0U7F234d8D50LOwUPwNjqOk_SFeDWXv6xZUh3SQ%3D%3D&store=1&pscd=wzjvpzqa" }
}

# --- Populacao Inicial dos Controles ---
$systemTasks.Keys | ForEach-Object { $systemCheckedListBox.Items.Add($_, $false) }
$maintenanceTasks.Keys | ForEach-Object { $maintenanceCheckedListBox.Items.Add($_, $false) }
$personalizationTasks.Keys | ForEach-Object { $personalizationCheckedListBox.Items.Add($_, $false) }
Populate-AppsTreeView
$debloatTasks.Keys | ForEach-Object { $debloatCheckedListBox.Items.Add($_, $false) }
$endpointSecurityTasks.Keys | ForEach-Object { $endpointSecurityCheckedListBox.Items.Add($_, $false) }
Add-ListViewColumns $bloatwarePanel.Control @("(#)", "Nome", "Status")


# #############################################################################
# ####### INICIO DA ASSOCIACAO DE EVENTOS #######
# #############################################################################

# --- Evento do botao de MANUTENCAO COMPLETA (Choco + Registro) ---
$cleanChocoCacheButton.Add_Click({
    if (-not (Confirm-Action "Isso ira executar uma MANUTENCAO COMPLETA:`n`n1. Limpar registros orfaos do Windows.`n2. Atualizar o Choco e limpar seus caches.`n3. Forcar sincronia do Choco com o Windows.`n`nEste e o 'botao do panico' para resolver problemas de instalacao. Deseja continuar?")) { return }
    
    # Executa a limpeza de registro primeiro, pois ela pode ser a causa dos problemas do Choco
    Clean-OrphanedRegistryEntries

    # Executa a manutencao completa do Chocolatey
    Run-Task "Manutencao Completa do Chocolatey" {
        Ensure-ChocolateyIsInstalled | Out-Null
        $chocoExe = "$env:ProgramData\chocolatey\bin\choco.exe"
        
        Update-Status "--> ETAPA 1/2: Atualizando o Chocolatey e limpando caches..."
        & $chocoExe upgrade chocolatey -y -r
        $tempPath = Join-Path $env:ProgramData "chocolatey\temp"
        if (Test-Path $tempPath) { Remove-Item -Path "$tempPath\*" -Recurse -Force -ErrorAction SilentlyContinue }
        $downloadsPath = Join-Path $env:ProgramData "chocolatey\downloads"
        if (Test-Path $downloadsPath) { Remove-Item -Path "$downloadsPath\*" -Recurse -Force -ErrorAction SilentlyContinue }

        Update-Status "--> ETAPA 2/2: Iniciando Sincronizacao Forcada do Choco..."
        Update-Status "... Obtendo lista de pacotes do Chocolatey..."
        $chocoPackages = & $chocoExe list --local-only --exact --limit-output -r | ForEach-Object { ($_.Split('|')[0]) }
        
        Update-Status "... Re-verificando lista de programas do Registro do Windows..."
        $installedWindowsApps = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
        $regPaths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
        foreach ($p in $regPaths) {
            Get-ChildItem -Path $p -ErrorAction SilentlyContinue | ForEach-Object {
                $displayName = $_.GetValue("DisplayName")
                if (-not [string]::IsNullOrWhiteSpace($displayName)) {
                    $installedWindowsApps.Add($displayName) | Out-Null
                }
            }
        }
        
        Update-Status "... Comparando as listas para encontrar pacotes choco orfaos..."
        $orphanFound = $false
        foreach ($pkgName in $chocoPackages) {
            if ([string]::IsNullOrWhiteSpace($pkgName) -or $pkgName -eq 'chocolatey') { continue }
			$match = $installedWindowsApps | Where-Object { $_ -match "\b$([regex]::Escape($pkgName))\b" }
            if (-not $match) {
                $orphanFound = $true
                Update-Status "AVISO: Pacote Choco orfao detectado: '$pkgName'."
                Update-Status "--> Forcando desinstalacao para limpar o registro do Choco..."
                & $chocoExe uninstall $pkgName --force -y -r
            }
        }

        if (-not $orphanFound) {
            Update-Status "... Nenhum pacote choco orfao encontrado. O Chocolatey esta sincronizado."
        }
        
        Update-Status "--> Manutencao concluida. Atualizando todas as listas no AZTools..."
        Refresh-AppLists
    }
})

# Evento para o timer que dispara as analises iniciais assim que a UI e exibida
$script:hasInitialized = $false

$script:initialScanTimer.Add_Tick({
    # 1. Tenta parar o timer usando o próprio objeto emissor ($this) para garantir
    $this.Stop()
    
    # 2. Trava de Segurança: Se já rodou, cancela e sai imediatamente.
    if ($script:hasInitialized) { return }
    $script:hasInitialized = $true

    try {
        # Como ajustamos as funcoes, agora elas sao rapidas (apenas leitura local)
        Update-Status "Carregando lista de aplicativos nativos..."
        Analyze-Bloatware
              
        Update-Status "Carregando lista de programas instalados..."
        Run-Task "Listar Aplicativos" { Update-RegisteredAppsList }
        
        Update-Status "Atualizando arvore de softwares..."
        Populate-AppsTreeView
        
        Update-Status "Inicializacao concluida."
    } catch {
        Update-Status "ERRO durante a analise inicial: $($_.Exception.Message)"
    }
})

# --- LOGICA DO TEMPORIZADOR DE INATIVIDADE ---
$script:shutdownTimer.Interval = 1000 # O timer dispara a cada 1 segundo
$script:shutdownTimer.Add_Tick({
    
	if ($script:executionJob -ne $null -and $script:executionJob.State -eq 'Running') {
        $script:shutdownSecondsRemaining = 15 * 60
        return
    }
	
	$script:shutdownSecondsRemaining--
    $timespan = [TimeSpan]::FromSeconds($script:shutdownSecondsRemaining)
    # Usamos o .Find para garantir que o controle seja encontrado mesmo apos a criacao do form
    $shutdownLabel = $form.Controls.Find('shutdownLabel', $true)[0]
    $shutdownLabel.Text = $timespan.ToString("mm\:ss")

    # Muda a cor para vermelho no ultimo minuto
    if ($script:shutdownSecondsRemaining -le 60 -and $shutdownLabel.ForeColor -ne [System.Drawing.Color]::Salmon) {
        $shutdownLabel.ForeColor = [System.Drawing.Color]::Salmon
    }

    # Se o tempo acabar, fecha o programa
    if ($script:shutdownSecondsRemaining -le 0) {
        $script:shutdownTimer.Stop()
        Update-Status "Temporizador de inatividade de 15 minutos atingido. Fechando o aplicativo."
        $form.Close()
    }
})

# Funcao para resetar o timer sempre que houver atividade
$resetShutdownTimer = {
    $script:shutdownSecondsRemaining = 15 * 60
    # O Try/Catch e para o caso de a UI ainda nao estar 100% pronta no primeiro movimento
    try {
        $shutdownLabel = $form.Controls.Find('shutdownLabel', $true)[0]
        if ($shutdownLabel.IsHandleCreated -and $shutdownLabel.ForeColor -ne $script:themeColors.Foreground) {
            $shutdownLabel.ForeColor = $script:themeColors.Foreground
        }
    } catch {}
}

# Associa o reset do timer a movimentos do mouse e pressionamento de teclas no formulario
$form.Add_MouseMove($resetShutdownTimer)
$form.Add_KeyDown($resetShutdownTimer)
# --- FIM DO BLOCO A SER ADICIONADO ---

# Evento para o timer que monitora o progresso da execucao em segundo plano
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
                Update-Status "[$percent%] Executando: $taskName..."
                if ($script:loadingOverlay -and $script:loadingOverlay.IsHandleCreated) {
                    $script:loadingOverlay.Controls[0].Text = "Executando: $taskName..."
                }
            }
            elseif ($msg.StartsWith("LOG:")) {
                Update-Status $msg.Substring(4)
            }
        }
    }

    if ($script:executionJob.State -in @('Completed', 'Failed', 'Stopped')) {
        $script:progressTimer.Stop()
        $allFinalOutput = (Get-Job -Id $script:executionJob.Id).ChildJobs[0].Output
        $finalMessage = $allFinalOutput | Where-Object { $_ -like "COMPLETE:*" } | Select-Object -Last 1
        $anyTaskFailed = $false
        if ($finalMessage -and ($finalMessage.ToString().Split(":")[1] -eq 'True')) {
            $anyTaskFailed = $true
        }
        $rebootMessage = $allFinalOutput | Where-Object { $_ -like "REBOOT_REQUIRED:*" } | Select-Object -Last 1
        if ($rebootMessage -and ($rebootMessage.ToString().Split(":")[1] -eq 'True')) {
            $script:rebootRequired = $true
        }

        if ($script:loadingOverlay -and $script:loadingOverlay.IsHandleCreated) {
            $script:loadingOverlay.Close(); $script:loadingOverlay.Dispose()
        }
        $script:controlsToToggle.ForEach({ if ($_.IsHandleCreated) { $_.Enabled = $true } })

        # --- ALTERAÇÃO: REMOVIDAS AS CHAMADAS AUTOMÁTICAS DE REFRESH ---
        # O script não vai mais buscar atualizações do Choco/Registro automaticamente ao fim de cada tarefa.
        # O usuário deve usar os botões "Scanner" nas abas se quiser atualizar as listas.
        
        # Reinicia e retoma o temporizador de inatividade
        Update-Status "Reiniciando temporizador de inatividade..."
        $resetShutdownTimer.Invoke() # Reseta a contagem para 15:00
        $script:shutdownTimer.Start() # Retoma o timer
        
        if ($anyTaskFailed) { 
            Update-Status "Execucao concluida com uma ou mais falhas." 
        } else { 
            Update-Status "Execucao concluida com sucesso." 
        }

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

# --- Eventos dos Controles da Interface ---

$form.Add_FormClosing({
    $script:stopLogJob = $true
    if ($script:logJob) {
        Stop-Job $script:logJob
        Remove-Job $script:logJob -Force
    }
})

$appsTreeView.Add_AfterCheck({
    param($sender, $e)
    if ($script:isUpdatingChecks) { return }
    try {
        $script:isUpdatingChecks = $true
        $currentNode = $e.Node
        if ($currentNode.Nodes.Count -gt 0) {
            foreach ($childNode in $currentNode.Nodes) { $childNode.Checked = $currentNode.Checked }
        }
        if ($currentNode.Parent -ne $null) {
            $allSiblingsChecked = $true
            foreach ($siblingNode in $currentNode.Parent.Nodes) {
                if (-not $siblingNode.Checked) { $allSiblingsChecked = $false; break }
            }
            $currentNode.Parent.Checked = $allSiblingsChecked
        }
    }
    finally { $script:isUpdatingChecks = $false }
})

$closeButtonMain.Add_Click({ $form.Close() })
$clearLogButton.Add_Click({ $statusBox.Clear() })
$runAllButton.Add_Click({ Start-Execution -AllTabs })
$runCurrentTabButton.Add_Click({ Start-Execution })

# Eventos da Aba de Limpeza
$filesPanel.AnalyzeButton.Add_Click({ Analyze-CleanableFiles })
$filesPanel.CleanButton.Add_Click({ Clean-SelectedFiles })
$filesPanel.Control.Add_AfterCheck({
    param($sender, $e)
    if ($script:isUpdatingChecks) { return }
    try {
        $script:isUpdatingChecks = $true
        $currentNode = $e.Node
        if ($currentNode.Nodes.Count -gt 0) {
            foreach ($childNode in $currentNode.Nodes) { $childNode.Checked = $currentNode.Checked }
        }
        if ($currentNode.Parent -ne $null) {
            $allSiblingsChecked = $true
            foreach ($siblingNode in $currentNode.Parent.Nodes) {
                if (-not $siblingNode.Checked) { $allSiblingsChecked = $false; break }
            }
            $currentNode.Parent.Checked = $allSiblingsChecked
        }
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
    finally { $script:isUpdatingChecks = $false }
})
$analyzeRegButton.Add_Click({ Analyze-RegistryIssues })
$backupRegButton.Add_Click({ Backup-SelectedRegistryIssues })
$cleanRegButton.Add_Click({ Clean-SelectedRegistryIssues })
$regCleanerListView.Add_ItemChecked({
    param($sender, $e)
    $count = $this.CheckedItems.Count
    $regCleanerSummaryLabel.Text = "Total de itens selecionados: $count"
})

# Eventos da Aba de Softwares
$scanChocoButton.Add_Click({ Scan-OutdatedChocoApps })
$updateChocoButton.Add_Click({ Update-SelectedChocoApps })
$scanRegButton.Add_Click({ Scan-RegistryApps })
$uninstallRegButton.Add_Click({ Uninstall-SelectedApps })
$regUpdatesListView.Add_ItemChecked({ $uninstallRegButton.Enabled = ($this.CheckedItems.Count -gt 0) })
$regUpdatesListView.Add_SelectedIndexChanged({ $searchForUpdateButton.Enabled = ($this.SelectedItems.Count -gt 0) })
$searchForUpdateButton.Add_Click({
    if ($regUpdatesListView.SelectedItems.Count -gt 0) {
        $appName = $regUpdatesListView.SelectedItems[0].SubItems[2].Text
        if (-not [string]::IsNullOrWhiteSpace($appName)) {
            $encodedAppName = [System.Web.HttpUtility]::UrlEncode("$appName download da ultima versao")
            Start-Process "https://www.google.com/search?q=$encodedAppName"
        }
    }
})
$regSearchBox.Add_TextChanged({
    param($sender, $e)
    $searchText = $sender.Text
    if ($null -eq $script:cachedInstalledApps) { return }
    $regUpdatesListView.BeginUpdate()
    $regUpdatesListView.Items.Clear()
    $filteredApps = $script:cachedInstalledApps.Values | Where-Object { $_.Name -like "*$searchText*" } | Sort-Object Name
    $i = 1
    foreach ($app in $filteredApps) {
        $item = New-Object System.Windows.Forms.ListViewItem($app.Origin)
        $item.SubItems.Add($i.ToString()); $item.SubItems.Add($app.Name); $item.SubItems.Add($(if ($app.Version) { $app.Version } else { "N/D" })); $item.SubItems.Add($(if ($app.Publisher) { $app.Publisher } else { "N/D" })); $item.Tag = $app.UninstallString
        $regUpdatesListView.Items.Add($item) | Out-Null
        $i++
    }
    $regUpdatesListView.EndUpdate()
})

# Eventos da Aba de Otimização e Bloatware
$bloatwarePanel.AnalyzeButton.Add_Click({ Analyze-Bloatware })
$bloatwarePanel.CleanButton.Add_Click({ Apply-BloatwareActions })
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

# Eventos da Aba de Recursos do Windows
$featuresSearchBox.Add_TextChanged({
    param($sender, $e)
    $searchText = $sender.Text
    if ($null -eq $script:cachedWindowsFeatures) { return }
    $windowsFeaturesListView.BeginUpdate()
    $windowsFeaturesListView.Items.Clear()
    $filteredFeatures = $script:cachedWindowsFeatures | Where-Object { $_.FeatureName -like "*$searchText*" }
    foreach ($feature in $filteredFeatures) {
        $item = New-Object System.Windows.Forms.ListViewItem($feature.FeatureName)
        $item.SubItems.Add($feature.State) | Out-Null
        $item.Tag = $feature.FeatureName
        if ($feature.State -eq 'Enabled') { $item.ForeColor = [System.Drawing.Color]::LightGreen; $item.Checked = $false } else { $item.ForeColor = [System.Drawing.Color]::Salmon }
        $windowsFeaturesListView.Items.Add($item) | Out-Null
    }
    $windowsFeaturesListView.EndUpdate()
})

# Evento da troca de Abas
$tabControl.Add_SelectedIndexChanged({
$runnableTabs = @("Sistema e Manutencao", "(BETA) Recursos do Windows", "(BETA) Personalizacao", "Softwares", "Otimizacao e Bloatware", "Endpoint Security")
    $runCurrentTabButton.Enabled = $tabControl.SelectedTab.Text -in $runnableTabs

    # Logica para auto-analisar a aba de limpeza na primeira vez que e aberta
    if (($tabControl.SelectedTab.Text -eq "Limpeza de Arquivos e Registros") -and (-not $script:cleanupTabHasBeenAnalyzed)) {
        Update-Status "Executando analise inicial da aba de limpeza..."
        Analyze-CleanableFiles
        Analyze-RegistryIssues
        $script:cleanupTabHasBeenAnalyzed = $true
        Update-Status "Analise inicial da limpeza concluida."
    }
})
# #############################################################################
# ####### FIM DA ASSOCIACAO DE EVENTOS #######
# #############################################################################

# --- Inicializacao do Formulario ---
$form.Add_Shown({
    $form.Activate()
    try {
        Update-Status "Baixando icone do cabecalho..."
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
        $imageData = $webClient.DownloadData($script:config.LogoUrl)
		$memoryStream = [System.IO.MemoryStream]::new($imageData)
        $titleIcon.Image = [System.Drawing.Image]::FromStream($memoryStream)
        Update-Status "Icone carregado com sucesso."
    } catch {
        Update-Status "AVISO: Nao foi possivel carregar o logo da URL: $($_.Exception.Message.Trim()). O icone nao sera exibido."
    }
    Populate-GodModeList
    Set-FormTitleBarColor -Form $form -TitleBarBackgroundColor $script:themeColors.Accent -TitleBarTextColor $script:themeColors.ForegroundButton
    Update-Status "Interface pronta. Disparando analises iniciais..."
    $script:initialScanTimer.Interval = 100
    $script:initialScanTimer.Start()
	
    $script:shutdownTimer.Start()

})

Apply-DarkTheme -Control $form
[void]$form.ShowDialog()
$form.Dispose()

