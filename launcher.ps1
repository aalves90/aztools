# ===================================================================================
# AZTools - Launcher (Modo: Sempre Online com Cache Buster)
# ===================================================================================

# --- Bloco de Configuracao ---
$config = @{
    CurrentVersion      = "2" # Versão atualizada do Launcher com correções
    OnlineScriptUrl     = "https://raw.githubusercontent.com/aalves90/aztools/main/AZTools-main.ps1"
    TempScriptName      = "AZTools-main.ps1"
}

# ===================================================================================
# INÍCIO DO BLOCO TRY PRINCIPAL
# ===================================================================================
try { 
    $scriptToRun = ""

    Write-Host "======================================"
    Write-Host " AZTools Launcher v$($config.CurrentVersion) (Modo Online)"
    Write-Host "======================================"
    Write-Host ""
    Write-Host "Baixando a versao mais recente do AZTools..." -ForegroundColor Yellow

    try {
        $tempScriptPath = Join-Path $env:TEMP $config.TempScriptName
        $cacheBuster = Get-Random
        $urlWithBuster = "$($config.OnlineScriptUrl)?v=$cacheBuster"
        Write-Host "URL de consulta: $urlWithBuster" -ForegroundColor DarkGray

        Invoke-WebRequest -Uri $urlWithBuster -OutFile $tempScriptPath
        
        # --- MELHORIA: Desbloqueia o arquivo baixado da internet ---
        Unblock-File -Path $tempScriptPath
        # --- FIM DA MELHORIA ---
        
        $scriptToRun = $tempScriptPath
        Write-Host "Script baixado e desbloqueado com sucesso." -ForegroundColor Green
    } catch {
        throw "ERRO FATAL: Nao foi possivel baixar o script principal.`nVerifique sua conexao com a internet e se o link esta correto.`nDetalhes: $($_.Exception.Message)"
    }

    Write-Host ""
    Write-Host "Iniciando AZTools..." -ForegroundColor Magenta
    Start-Sleep -Seconds 1

    if (-not (Test-Path $scriptToRun)) {
        throw "ERRO CRITICO: O script baixado nao foi encontrado. A execucao foi cancelada."
    }

    $powershellArgs = "-ExecutionPolicy Bypass -File `"$scriptToRun`""
    Write-Host "Executando comando: powershell.exe $powershellArgs" -ForegroundColor DarkGray
    
    # --- CORREÇÃO: Removido o espaço extra em "powershell.exe" ---
    Start-Process powershell.exe -ArgumentList $powershellArgs -Verb RunAs

} 
# ===================================================================================
# INÍCIO DO BLOCO FINALLY (A PAUSA DE SEGURANÇA)
# ===================================================================================
finally { 
    Write-Host ""
    Write-Host "------------------------------------------------" -ForegroundColor Gray
    Write-Host "O processo foi finalizado. Pressione ENTER para fechar esta janela." -ForegroundColor Gray
    Read-Host
}