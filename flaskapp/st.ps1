Start-Process -NoNewWindow -FilePath "gunicorn" -ArgumentList "--bind 127.0.0.1:5000 wsgi:app" -PassThru | Out-File -FilePath "app_pid.txt"
Start-Sleep -Seconds 5
Write-Host "start client"
python client.py
Start-Sleep -Seconds 5
$APP_PID = Get-Content "app_pid.txt"
Write-Host "Stopping process with PID: $APP_PID"
Stop-Process -Id $APP_PID
Remove-Item -Path "app_pid.txt"
exit 0
