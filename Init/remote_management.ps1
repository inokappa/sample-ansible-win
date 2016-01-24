#
# Ansible 向けに WinRM をセットアップする準備
#
# ConfigureRemotingForAnsible.ps1 を取得する
Invoke-WebRequest -Uri https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile ConfigureRemotingForAnsible.ps1
# NetworkCategory を Private に変更する
Set-NetConnectionProfile -InterfaceAlias (Get-NetConnectionProfile -IPv4Connectivity Internet).InterfaceAlias -NetworkCategory Private
# ConfigureRemotingForAnsible.ps1 を実行する
powershell -ExecutionPolicy RemoteSigned .\ConfigureRemotingForAnsible.ps1

#
# Refer to http://opcdiary.net/?p=29576
#
# PowerShellで外部スクリプトを実行可能にする
Set-ExecutionPolicy -ExecutionPolicy "RemoteSigned" -Force
Get-ExecutionPolicy
 
# リモートアクセスを有効にする
Enable-PSRemoting -Force
 
# タイムアウト設定
Set-Item -Path "WSMan:\localhost\MaxTimeoutms" 1800000
Get-Item -Path "WSMan:\localhost\MaxTimeoutms"
 
# 暗号化されていない接続を許可
Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" "true"
Get-Item -Path "WSMan:\localhost\Service\AllowUnencrypted"
 
# Basic認証を許可
Set-Item -Path "WSMan:\localhost\Service\Auth\Basic" "true"
Get-Item -Path "WSMan:\localhost\Service\Auth\Basic"
