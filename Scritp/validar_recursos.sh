#!/bin/bash

# 1. Validar el estado de recursos
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
ram_usage=$(free | awk '/Mem/{print $3/$2 * 100.0}')
disk_usage=$(df -h / | awk '/\// {print $(NF-1)}')

# 2. Guardar el resultado en un archivo HTML
echo "<html>
<head>
  <title>Estado de Recursos</title>
</head>
<body>
  <h1>Estado de Recursos en la Máquina Linux</h1>
  <p>Uso de CPU: $cpu_usage%</p>
  <p>Uso de RAM: $ram_usage%</p>
  <p>Uso de Disco: $disk_usage</p>
</body>
</html>" > estado_recursos.html

# 3. Documentación y ejecución
echo "El script valida el estado de recursos en una máquina Linux y guarda el resultado en estado_recursos.html."
echo "Para ejecutarlo, simplemente ejecuta el script en tu terminal: ./nombre_del_script.sh"

