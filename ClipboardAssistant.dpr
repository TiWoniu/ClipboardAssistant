program ClipboardAssistant;

uses
  Windows,
  Messages,
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uClearFormatTxt in 'uClearFormatTxt.pas' {frmClearFormatTxt},
  uConvertColor2Web in 'uConvertColor2Web.pas';

{$R *.res}

begin
    CreateMutex(nil, false, PChar('系统快捷键自动填充剪切板实用小程序'));
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      PostMessage(FindWindow(nil,'自定义快速剪切板填充程序'),WM_HOTKEY,201010,201010);
      Exit;
    end;

  Application.Initialize;
  Application.Title := '快捷剪切版';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmClearFormatTxt, frmClearFormatTxt);
  Application.Run;
end.
