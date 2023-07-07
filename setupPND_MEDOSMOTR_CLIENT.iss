; Скрипт создан через Мастер Inno Setup Script.
; ИСПОЛЬЗУЙТЕ ДОКУМЕНТАЦИЮ ДЛЯ ПОДРОБНОСТЕЙ ИСПОЛЬЗОВАНИЯ INNO SETUP!


#define MyAppName "Medins Doc"
#define MyAppServerName "Medins Doc Server"
#define MyAppVersion "2_2_72"
#define MyAppPublisher "Medins"
#define MyAppURL "http://softerium.ru"
#define MyAppExeName "PND.exe"
#define MyAppServerExeName "PNDServer.exe"
#define MyAppDir "Medins"
#define MyAppLoaderName "Medins Doc Обновление"
#define MyAppLoaderExeName "MedinsLoader.exe"

#define ClientName "MEDOSMOTR"

[Setup]
; Примечание: Значение AppId идентифицирует это приложение.
; Не используйте одно и тоже значение в разных установках.
; (Для генерации значения GUID, нажмите Инструменты | Генерация GUID.)
UsePreviousAppDir = no
AppId={{BCB9510B-5156-4C06-9FAF-70DBCBB6D4EE}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppDir}
DefaultGroupName={#MyAppName}
;LicenseFile={#file AddBackslash(SourcePath) + "license.txt"}
;InfoAfterFile=ChangeLog.txt
OutputBaseFilename=MedinsPND_{#MyAppVersion}_{#ClientName}_client_setup
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"; 
;LicenseFile: license.txt;

[Types]
Name: Custom; Description: Выборочная установка; Flags: IsCustom; Languages: russian;

[Components]

;Name: server; Description: Сервер системы;  Types: Custom;
;Name: server; Description: Сервер системы; Flags: fixed;
Name: client; Description: Рабочее место; Types: Custom;

[Tasks]
;Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
;Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; OnlyBelowVersion: 0,6.1

[Dirs]
Name: "{commonappdata}\Softerium"; Permissions: everyone-modify;

[Files]
; ================ OtherPackages ================
;Source: "Distr\instsrv.exe"; DestDir: {sys}; Components: server; Flags:  onlyifdoesntexist;                                               
;Source: "Distr\srvany.exe"; DestDir: {sys};  Components: server; Flags:  onlyifdoesntexist; 
;Source: "Distr\Firebird-2.5.3.26778_0_Win32.exe"; DestDir: "{app}\OtherPackage"; Components: server; Flags: ignoreversion
;Source: "Distr\Firebird-3.0.5.33220_0_x64.exe"; DestDir: "{app}\OtherPackage"; Components: server; Flags: ignoreversion
;Source: "Distr\LSEncrLib-Setup.exe"; DestDir: "{app}\OtherPackage"; Components: client; Flags: ignoreversion
;Source: "Distr\MedinsGuardian_PND_1.3.exe"; DestDir: "{app}\OtherPackage"; Components: client; Flags: ignoreversion

;================= Lissi-soft =================
;Source: "LSEncrLib.dll"; DestDir: "{app}"; Components: server client; Flags: ignoreversion; 
;Source: "LSEncrLib.cfg"; DestDir: "{app}"; Components: server client; Flags: ignoreversion; 

; ================ SERVER ================
;Source: "Db\PNDServer\{#ClientName}\*"; DestDir: "{commonappdata}\Softerium\Medins\PNDServer\Db"; Components: server; Flags: ignoreversion recursesubdirs createallsubdirs onlyifdoesntexist;
;Source: "PNDServer.exe"; DestDir: "{app}"; Components: server; Flags: ignoreversion
Source: "DBEngine.dll"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "DBCarSessions.dll"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "libzmq.dll"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "Server.crt"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "Server.key"; DestDir: "{app}";  Components: client; Flags: ignoreversion
;Source: "PNDDBBackup.exe"; DestDir: "{app}";  Components: server; Flags: ignoreversion

; ================ ARM ================
Source: "fastreport\*"; DestDir: "{app}\fastreport"; Components: client; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "map\PND\*"; DestDir: "{app}\map"; Components: client; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "sounds\*"; DestDir: "{app}\sounds"; Components: client; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "locales\*"; DestDir: "{app}\locales"; Components: client; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "swiftshader\*"; DestDir: "{app}\swiftshader"; Components: client; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "*.pak"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "*.dll"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "*.map"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "*.bin"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "*.lib"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "icudtl.dat"; DestDir: "{app}";  Components: client; Flags: ignoreversion

Source: "MedinsLoader\MedinsLoader.exe"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "MedinsLoader\MedinsLoader.ini"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "settings\{#ClientName}\settings.ini"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "PND.exe"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "Журнал всех услуг.xls"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "Мониторинг_ПНД.xlsx"; DestDir: "{app}"; DestName: "Мониторинг1.xlsx";  Components: client; Flags: ignoreversion
Source: "images\logo\pnd\{#ClientName}.png"; DestDir: "{app}\img\logo\pnd"; Components: client; Flags: ignoreversion
Source: "UpdateInfoPND.html"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "Client.crt"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "Client.key"; DestDir: "{app}";  Components: client; Flags: ignoreversion

; ================ SSL ===========================
Source: "ssleay32.dll"; DestDir: "{app}";  Components: client; Flags: ignoreversion
Source: "libeay32.dll"; DestDir: "{app}";  Components: client; Flags: ignoreversion

[Registry]
;Root: HKLM; SubKey: SYSTEM\CurrentControlSet\Services\PNDServer\Parameters; ValueType: string; ValueName: Application; ValueData: {app}\PNDServer.exe; Components: server;
;Root: HKLM; SubKey: SYSTEM\CurrentControlSet\Services\PNDServer; ValueType: string; ValueName: DependOnService; ValueData: "FirebirdServerDefaultInstance"; Components: server; 
;Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "RPROServer"; ValueData: "{app}\RPROServer.exe"; Flags: uninsdeletevalue

; Примечание: Не используйте "Flags: ignoreversion" для системных файлов

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
;Name: "{group}\{#MyAppServerName}"; Filename: "{app}\{#MyAppServerExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{commondesktop}\{#MyAppLoaderName}"; Filename: "{app}\{#MyAppLoaderExeName}"; Tasks: desktopicon
;Name: "{group}\{#Instruction}"; Filename: "{app}\Руководство пользователя.docx";
;Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon
;Name: "{commonstartup}\PNDServer"; Filename: "{app}\PNDServer.exe";

[Run]
;Filename: "{app}\OtherPackage\Firebird-3.0.5.33220_0_x64.exe"; Components: server;
;Filename: "{app}\OtherPackage\MedinsGuardian_PND_1.3.exe"; Parameters: "/DIR=""{app}"" /VERYSILENT /SUPPRESSMSGBOXES /SP /COMPONENTS=GuardianClient,GuardianServer,Loader"; Components: server;
;Filename: "{app}\OtherPackage\MedinsGuardian_PND_1.3.exe"; Parameters: "/DIR=""{app}"" /VERYSILENT /SUPPRESSMSGBOXES /COMPONENTS=Loader"; Components: client;
;Filename: "{app}\OtherPackage\LSEncrLib-Setup.exe"; Components: server client
;Filename: "{app}\OtherPackage\LSEncrLib-Setup.exe"; Parameters: "/DIR=""{app}"" /VERYSILENT /SUPPRESSMSGBOXES"; Components: client
;Filename: "{app}\PNDServer.exe"; Flags: nowait postinstall skipifsilent; Components: server
;Filename: "{app}\MedGuardClt.exe"; Flags: nowait postinstall; Components: server
;Components: "stray"; Filename: "{sys}\INSTSRV.exe"; Parameters: "STray C:\windows\system32\SRVANY.EXE"; StatusMsg: "Registering STray"; Flags: runhidden;
;Components: "stray"; Filename: "{sys}\net.exe"; Parameters: "start ""STray"""; StatusMsg: "Starting STray"; Flags: runhidden;
;Components: "server"; Filename: "{app}\PNDServer.exe"; StatusMsg: "Starting PNDServer"; Flags: nowait skipifnotsilent
;Components: "server"; Filename: "{sys}\INSTSRV.exe"; Parameters: "PNDServer C:\windows\system32\SRVANY.EXE"; StatusMsg: "Registering PNDServer..."; Flags: runhidden;
;Components: "server"; Filename: "{sys}\net.exe"; Parameters: "start ""PNDServer"""; StatusMsg: "Starting PNDServer..."; Flags: runhidden; 
Components: "client"; Filename: "{app}\PND.exe"; StatusMsg: "Starting PND..."; Flags: nowait postinstall skipifsilent unchecked
;Components: "server"; Filename: "schtasks"; Parameters: "/create /tn PNDDBBackup /tr ""{app}\PNDDBBackup.exe"" /sc daily /mo 1 /st 03:00 /ru ""System"""; StatusMsg: "Registering PNDDBBackup..."; Flags: nowait runhidden;

;Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

;[Registry]
;Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers\"; ValueType: String; ValueName: "{app}\RPROServer.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletekeyifempty uninsdeletevalue;
;Root: HKLM; SubKey: SYSTEM\CurrentControlSet\Services\STray\Parameters; ValueType: string; ValueName: Application; ValueData: {app}\STray.exe; Components: STray;

[Code]

procedure KillProcess(aProcess: string);
var
  ResCode: integer;
begin
  try
    Exec('taskkill', '/F /IM ' + aProcess, '', 0, ewWaitUntilTerminated, ResCode);
  except
    Log(format('Ошибка завершение процесса %s (error code: %d)', [aProcess, ResCode]));
  end;
end;

procedure KillNet(aNet: string);
var
  ResCode: integer;
begin
  try
    Exec(GetSystemDir + '\net.exe', 'stop ' + aNet, GetSystemDir, SW_HIDE, ewWaitUntilTerminated, ResCode);
  except
    Log(format('Ошибка остановки службы %s (error code: %d)', [aNet, ResCode]));
  end;
end;

procedure KillProcessAndNet;
begin
  KillProcess('PND.exe');
  KillProcess('PNDServer.exe');
  KillNet('PNDServer');
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
    ResCode: Integer;
begin
  if CurUninstallStep = usUninstall then
  begin
     KillProcessAndNet;
  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  KillProcessAndNet;
end;

//setup.exe /VERYSILENT /SUPPRESSMSGBOXES /COMPONENTS="server client"


