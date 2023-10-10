# Tarea 4: Script en PowerShell para validar el estado de recursos en la máquina Windows

# Obtener información del sistema
$cpuInfo = Get-WmiObject Win32_Processor
$cpuUsage = [math]::Round($cpuInfo.LoadPercentage, 1)

$ramInfo = Get-WmiObject -Class Win32_PerfRawData_PerfOS_Memory
$ramAvailable = [math]::Round(($ramInfo.AvailableBytes / 1GB), 1)

$ramInfo = Get-WmiObject -Class Win32_ComputerSystem
$ramTotal = [math]::Round(($ramInfo.TotalPhysicalMemory / 1GB), 1)
$ramFree = $ramAvailable
$ramUse = $ramTotal - $ramAvailable

$diskSpace = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, @{Name="FreeSpaceGB"; Expression={[math]::Round(($_.FreeSpace / 1GB), 1)}}, @{Name="SizeGB"; Expression={[math]::Round(($_.Size / 1GB), 1)}}

# Crear el contenido HTML
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
<title>Estado de Recursos</title>
<style>
    h1 {
		font-family: sans-serif;
		font-size: 20px;
		color: #0099CC;
	}
	h2 {
		font-family: sans-serif;
		font-size: 16px;
		color: #00CC99;
	}
    p {
        margin-bottom: 10px;
    }
</style>
</head>
<body>

<h1>Estado de Recursos</h1>

<h2>Uso de CPU:</h2>
<p>$cpuUsage%</p>

<h2>Uso de RAM:</h2>
<p>Libre: $ramFree GB</p>
<p>Total: $ramTotal GB</p>
<p>En Uso: $ramUse GB</p>

<h2>Espacio en Disco:</h2>
"@

foreach ($disk in $diskSpace) {
    $htmlContent += "<p>Unidad $($disk.DeviceID):</p>"
    $htmlContent += "<p>Espacio Libre: $($disk.FreeSpaceGB) GB</p>"
    $htmlContent += "<p>Espacio Total: $($disk.SizeGB) GB</p>"
}

$htmlContent += @"
</body>
</html>
"@

# Guardar el contenido HTML en un archivo
$htmlContent | Out-File -FilePath "EstadoRecursos.html" -Encoding UTF8

Write-Host "El script se ha ejecutado exitosamente. El resultado se ha guardado en EstadoRecursos.html"
