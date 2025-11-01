{******************************************************************************}
{    2025 v2 add  list                Delph1 1.3                               }
{    2019 Back to developmen          Delphi 10.3                              }
{    2002 v1                          Delphi 7                                 }
{    2001 for jxOnline2 login quikly  Delphi 5                                 }
{******************************************************************************}

unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,Clipbrd,shellapi, inifiles, Registry, Winapi.ShlObj,ActiveX,  ComObj,
  ExtCtrls, Grids, Vcl.CheckLst, Vcl.ValEdit, Vcl.Buttons, Vcl.Menus, FileCtrl
  ,uConvertColor2Web,  System.JSON, Vcl.WinXCtrls
  ;

  CONST
  CONTROL_SHIFT_0 =  201000;
  CONTROL_SHIFT_1 =  201001;
  CONTROL_SHIFT_2 =  201002;
  CONTROL_SHIFT_3 =  201003;
  CONTROL_SHIFT_4 =  201004;
  CONTROL_SHIFT_5 =  201005;
  CONTROL_SHIFT_6 =  201006;
  CONTROL_SHIFT_7 =  201007;
  CONTROL_SHIFT_8 =  201008;
  CONTROL_SHIFT_9 =  201009;
  CONTROL_SHIFT_F12= 201010;

  CONTROL_SHIFT_A =  200901;

  CONTROL_SHIFT_M =  201011;
  CONTROL_SHIFT_N =  201012;
  CONTROL_SHIFT_T =  201013;
  CONTROL_SHIFT_V =  201014;
  CONTROL_SHIFT_H =  201015;
  CONTROL_SHIFT_Z =  201016;
  CONTROL_SHIFT_D =  201017;
  CONTROL_SHIFT_Q =  201018;
  CONTROL_SHIFT_Y =  201019;
  CONTROL_SHIFT_W =  201020;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label11: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label0: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Label110: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    mc: TMemo;
    GroupBox2: TGroupBox;
    Label_ChooseMC: TLabel;
    Button3: TButton;
    Label12: TLabel;
    Label14: TLabel;
    ls: TValueListEditor;
    Panel4: TPanel;
    Label15: TLabel;
    edtMC2Name: TEdit;
    mc2: TMemo;
    Button4: TSpeedButton;
    btnSaveMC2: TSpeedButton;
    TrayIcon: TTrayIcon;
    PopMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopList: TPopupMenu;
    PopListFixLine: TMenuItem;
    NPopListFixClickError: TMenuItem;
    edtDColor: TEdit;
    EdtWebColor: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    NSeting: TMenuItem;
    PopListFixLineBottom: TMenuItem;
    Label18: TLabel;
    SearchBox1: TSearchBox;
    Label19: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ClickEvent_WithNameEdit(Sender: TObject);
    procedure DBClickEvent_WithNameEdit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure btnSaveMC2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure lsClick(Sender: TObject);
    procedure lsDblClick(Sender: TObject);
    procedure mc2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TrayIconMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NPopListFixClickErrorClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure NSetingClick(Sender: TObject);
    procedure SearchBox1InvokeSearch(Sender: TObject);


  private
    { Private declarations }
    //HotKey1:THandle;
    FQuikNaneT:TEdit;
    procedure MyHotKey(var Message: TMessage); message WM_HOTKEY;
    procedure LoadContentFromFile(aFile:String;Loadto:TMemo);
    procedure SaveContentToFile(aFile:String;SaveFrom:TMemo);
    procedure QRClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uClearFormatTxt, IOUtils,StrUtils;

{$R *.dfm}
{--$R uac.res}


// 从 JSON 文件加载到 TValueListEditor
procedure LoadExList(ValueList: TValueListEditor; const AFileName: string);
var
  FullPath: string;
  JsonText: string;
  Obj: TJSONObject;
  i: Integer;
  Pair: TJSONPair;
begin
  FullPath := TPath.Combine(ExtractFilePath(ParamStr(0)), AFileName);
  if not TFile.Exists(FullPath) then
    Exit;

  try
    JsonText := TFile.ReadAllText(FullPath, TEncoding.UTF8);
    Obj := TJSONObject.ParseJSONValue(JsonText) as TJSONObject;
    if Obj = nil then
      Exit;

    ValueList.Strings.BeginUpdate;
    try
      ValueList.Strings.Clear;
      for i := 0 to Obj.Count - 1 do
      begin
        Pair := Obj.Pairs[i];
        // TValueListEditor 的格式：Key=Value（Value 可含换行）
        ValueList.Strings.Add(Pair.JsonString.Value + '=' + Pair.JsonValue.Value);
      end;
    finally
      ValueList.Strings.EndUpdate;
    end;
  finally
    Obj.Free;
  end;
end;

// 从 TValueListEditor 保存到 JSON 文件
procedure SaveExList(ValueList: TValueListEditor; const AFileName: string);
var
  FullPath: string;
  Obj: TJSONObject;
  i: Integer;
  Key, Value: string;
  EqPos: Integer;
begin
  FullPath := TPath.Combine(ExtractFilePath(ParamStr(0)), AFileName);
  // 确保目录存在
  TDirectory.CreateDirectory(ExtractFilePath(FullPath));

  Obj := TJSONObject.Create;
  try
    for i := 0 to ValueList.Strings.Count - 1 do
    begin
      // 解析 "Key=Value" 格式（注意：Value 可能含 '='，所以只分割第一个 '='）
      EqPos := Pos('=', ValueList.Strings[i]);
      if EqPos > 0 then
      begin
        Key := Copy(ValueList.Strings[i], 1, EqPos - 1);
        Value := Copy(ValueList.Strings[i], EqPos + 1, MaxInt);
      end
      else
      begin
        Key := ValueList.Strings[i];
        Value := '';
      end;
      Obj.AddPair(Key, Value);
    end;

    TFile.WriteAllText(FullPath, Obj.ToJSON, TEncoding.UTF8);
  finally
    Obj.Free;
  end;
end;


function AddToStartup(AppName: string = ''): Boolean;
var
  StartupFolderPath: array[0..MAX_PATH] of Char;
  ShortcutFileName: string;
  ShellLink: IShellLink;
  PersistFile: IPersistFile;
  ExePath: string;
begin
  Result := False;

  // 获取当前程序的完整路径
  ExePath := ExtractFilePath(ParamStr(0));
  if ExePath = '' then Exit; // 无法获取路径

  // 获取当前用户的“启动”文件夹路径
  if not SHGetSpecialFolderPath(0, StartupFolderPath, CSIDL_STARTUP, False) then
    Exit; // 无法获取启动文件夹路径

  // 如果未指定 AppName，则使用当前程序名称（不带路径和扩展名）
  if AppName = '' then
    AppName := ChangeFileExt(ExtractFileName(ParamStr(0)), '');

  // 构造快捷方式的完整路径（.lnk 文件）
  ShortcutFileName := IncludeTrailingPathDelimiter(StartupFolderPath) + AppName + '.lnk';

  // 创建 IShellLink 接口实例
  ShellLink := CreateComObject(CLSID_ShellLink) as IShellLink;
  if ShellLink = nil then Exit;

  // 设置快捷方式的目标为当前程序的完整路径
  ShellLink.SetPath(PChar(ExePath + ExtractFileName(ParamStr(0))));

  // （可选）设置工作目录
  ShellLink.SetWorkingDirectory(PChar(ExePath));

  // （可选）设置程序运行时是否显示窗口，比如可以设置为 SW_SHOW 或 SW_HIDE
  // ShellLink.SetShowCmd(SW_SHOW);

  // 获取 IPersistFile 接口以保存快捷方式文件
  PersistFile := ShellLink as IPersistFile;
  if PersistFile = nil then Exit;

  // 保存快捷方式文件 (.lnk)
  try
    OleCheck(PersistFile.Save(PWideChar(WideString(ShortcutFileName)), True));
    Result := True;
  except
    on E: Exception do
      OutputDebugString(PChar('创建启动快捷方式失败: ' + E.Message));
  end;
end;


procedure TfrmMain.MyHotKey(var Message: TMessage);
begin
  //mc2.Lines.Add(inttostr(Message.WParam));
  case Message.WParam of
  201000: DBClickEvent_WithNameEdit(Edit10);
  201001: DBClickEvent_WithNameEdit(Edit11);
  201002: DBClickEvent_WithNameEdit(Edit12);
  201003: DBClickEvent_WithNameEdit(Edit13);
  201004: DBClickEvent_WithNameEdit(Edit14);
  201005: DBClickEvent_WithNameEdit(Edit15);
  201006: DBClickEvent_WithNameEdit(Edit16);
  201007: DBClickEvent_WithNameEdit(Edit17);
  201008: DBClickEvent_WithNameEdit(Edit18);
  201009: DBClickEvent_WithNameEdit(Edit19);
  201010: begin
            if Showing then hide else begin show; Application.BringToFront; end;
          end;
          //m
  201011: ShellExecute(handle,nil,pchar('E:\Projects'),nil,nil,SW_shownormal);
          //n
  201012: ShellExecute(handle,'open',pchar('E:\钛网科技'),nil,nil,SW_shownormal);

  CONTROL_SHIFT_A:ShellExecute(handle,'open',pchar('E:\_营养师'),nil,nil,SW_shownormal);
  CONTROL_SHIFT_D:ShellExecute(handle,'open',pchar('D:\'),nil,nil,SW_shownormal);
  CONTROL_SHIFT_T:
        begin
          ShellExecute(handle,'open',pchar('T:\'),nil,nil,SW_shownormal);
        end;
  CONTROL_SHIFT_H: ShellExecute(handle,'open',pchar('H:\'),nil,nil,SW_shownormal);
  CONTROL_SHIFT_Q: ShellExecute(handle,'open',pchar('T:\剪影工作目录\JianyingPro Drafts'),nil,nil,SW_shownormal);
  CONTROL_SHIFT_Y: ShellExecute(handle,'open',pchar('E:\蜗牛\营养师'),nil,nil,SW_shownormal);
  CONTROL_SHIFT_Z:
        begin
          ShellExecute(handle,'open',pchar('E:\Projects\视频号\导播中控V2'),nil,nil,SW_shownormal);
        end;

          //p
  202001: ShellExecute(handle,nil,pchar('E:\钛网科技\Projectsx'),nil,nil,SW_shownormal);
  201101: begin
             if not frmClearFormatTxt.Showing then
             begin
                frmClearFormatTxt.Top:=10;
                frmClearFormatTxt.ShowModal
             end
             else
             frmClearFormatTxt.Close;
          end;
  end;

end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
     Hide;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
     Show;
end;

procedure TfrmMain.NSetingClick(Sender: TObject);
begin
     ShellExecute(handle,'open',pchar(ExtractFilePath(paramstr(0))+'QuitList.ini'),nil,pchar(ExtractFilePath(paramstr(0))),SW_SHOWNORMAL);
end;

procedure TfrmMain.NPopListFixClickErrorClick(Sender: TObject);
begin
     PopList.CloseMenu;
end;

procedure TfrmMain.QRClick(Sender: TObject);
var aItem:TMenuItem;
begin
     aItem :=  Sender As TMEnuItem;
     if (aItem.Caption<>'') and FileExists(aItem.Hint) then
     ShellExecute(handle,'open',pchar(aItem.Hint),nil,pchar(ExtractFileDir(aItem.Hint)),SW_SHOWNORMAL);
     //winexec( PAnsiChar(aItem.Hint),SW_SHOW);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  UnregisterHotKey(handle,201000);
  UnregisterHotKey(handle,201001);
  UnregisterHotKey(handle,201002);
  UnregisterHotKey(handle,201003);
  UnregisterHotKey(handle,201004);
  UnregisterHotKey(handle,201005);
  UnregisterHotKey(handle,201006);
  UnregisterHotKey(handle,201007);
  UnregisterHotKey(handle,201008);
  UnregisterHotKey(handle,201009);
  UnregisterHotKey(handle,201010);
//  UnregisterHotKey(handle,201011);
  //UnregisterHotKey(handle,201012);

  UnregisterHotKey(Handle,CONTROL_SHIFT_M);
  UnregisterHotKey(Handle,CONTROL_SHIFT_N);
  UnregisterHotKey(Handle,CONTROL_SHIFT_T);
  UnregisterHotKey(Handle,CONTROL_SHIFT_D);
  UnregisterHotKey(Handle,CONTROL_SHIFT_V);
  UnregisterHotKey(Handle,CONTROL_SHIFT_H);
  UnregisterHotKey(Handle,CONTROL_SHIFT_Q);
  UnregisterHotKey(Handle,CONTROL_SHIFT_Y);  //Y
  UnregisterHotKey(Handle,CONTROL_SHIFT_Z);

  UnregisterHotKey(handle,202001);
  SaveExList(ls,ExtractFilePath(paramstr(0))+'data\ls.json');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var s:string;
sfile,aTitle,aFile:String;  sList1:Tstringlist;
  I,iP: Integer;
begin
  registerhotkey(Handle,201000,MOD_CONTROL+MOD_SHIFT,$30); //0
  registerhotkey(Handle,201001,MOD_CONTROL+MOD_SHIFT,$31);
  registerhotkey(Handle,201002,MOD_CONTROL+MOD_SHIFT,$32);
  registerhotkey(Handle,201003,MOD_CONTROL+MOD_SHIFT,$33);
  registerhotkey(Handle,201004,MOD_CONTROL+MOD_SHIFT,$34);
  registerhotkey(Handle,201005,MOD_CONTROL+MOD_SHIFT,$35);
  registerhotkey(Handle,201006,MOD_CONTROL+MOD_SHIFT,$36);
  registerhotkey(Handle,201007,MOD_CONTROL+MOD_SHIFT,$37);
  registerhotkey(Handle,201008,MOD_CONTROL+MOD_SHIFT,$38);
  registerhotkey(Handle,201009,MOD_CONTROL+MOD_SHIFT,$39);
  registerhotkey(Handle,201010,MOD_CONTROL+MOD_SHIFT,vk_F12);

  registerhotkey(Handle,CONTROL_SHIFT_A,MOD_CONTROL+MOD_SHIFT,$41);  //A 65
  registerhotkey(Handle,CONTROL_SHIFT_M,MOD_CONTROL+MOD_SHIFT,$4D); //M
  registerhotkey(Handle,CONTROL_SHIFT_N,MOD_CONTROL+MOD_SHIFT,$4E); //N
  registerhotkey(Handle,CONTROL_SHIFT_D,MOD_CONTROL+MOD_SHIFT,68);  //D
  registerhotkey(Handle,CONTROL_SHIFT_T,MOD_CONTROL+MOD_SHIFT,$54); //N
  registerhotkey(Handle,CONTROL_SHIFT_V,MOD_CONTROL+MOD_SHIFT,$56); //M
  registerhotkey(Handle,CONTROL_SHIFT_H,MOD_CONTROL+MOD_SHIFT,$48); //N
  registerhotkey(Handle,CONTROL_SHIFT_Q,MOD_CONTROL+MOD_SHIFT,81);  //Q
  registerhotkey(Handle,CONTROL_SHIFT_Y,MOD_CONTROL+MOD_SHIFT,89); //Y
  registerhotkey(Handle,CONTROL_SHIFT_Z,MOD_CONTROL+MOD_SHIFT,90); //Z


  registerhotkey(Handle,201101,MOD_CONTROL,192); //`

  if not registerhotkey(Handle,202001,MOD_CONTROL+MOD_SHIFT,$50) then
  begin

  //mc2.Lines.Add('error');
  end;

  with TIniFile.Create( ExtractFilePath( ParamStr(0))+'params.ini') do
  begin
  try
    Label0.Caption:= '0:';Edit10.text:=trim( ReadString('params','k0n','') );
    Label1.Caption:= '1:';Edit11.text:=trim( ReadString('params','k1n','') );
    Label2.Caption:= '2:';Edit12.text:=trim( ReadString('params','k2n','') );
    Label3.Caption:= '3:';Edit13.text:=trim( ReadString('params','k3n','') );
    Label4.Caption:= '4:';Edit14.text:=trim( ReadString('params','k4n','') );
    Label5.Caption:= '5:';Edit15.text:=trim( ReadString('params','k5n','') );
    Label6.Caption:= '6:';Edit16.text:=trim( ReadString('params','k6n','') );
    Label7.Caption:= '7:';Edit17.text:=trim( ReadString('params','k7n','') );
    Label8.Caption:= '8:';Edit18.text:=trim( ReadString('params','k8n','') );
    Label9.Caption:= '9:';Edit19.text:=trim( ReadString('params','k9n','') );

    CheckBox2.Checked:= (ReadInteger('params','AutoShow',1) = 1 );

    Application.ShowMainForm:= CheckBox2.Checked;
    Visible:=CheckBox2.Checked;

  Except
  On E:Exception do
  begin
    s:=e.Message;
    MessageBox(handle,Pchar(S),'ReadString',MB_OK);
  end;
  end;
  free;
  end;//with

      //////////////list
      if fileExists( ExtractFilePath( ParamStr(0))+'QuitList.ini') then
      with TIniFile.Create( ExtractFilePath( ParamStr(0))+'QuitList.ini') do
      try

        PopList.Items.Delete(Poplist.Items.IndexOf(PopListFixLineBottom));
        PopList.Items.Delete(Poplist.Items.IndexOf(NSeting));

        var aItem:TMenuItem;
        for I := 1 to 9 do
        begin
             aTitle:=ReadString('QRList1_'+i.ToString,'title','');
             aFile :=ReadString('QRList1_'+i.ToString,'filename','');
             if (aTitle<>'') and FileExists(aFile) then
             begin
                  aItem:=TMenuItem.Create(PopList);
                  aItem.Caption:=aTitle;
                  aItem.Name:='N_QRList1_'+I.ToString;
                  aItem.Hint:=aFile;
                  aItem.OnClick:=QRClick;
                  PopList.Items.Add(aItem);
             end;
        end;

        aItem:=TMenuItem.Create(PopList);
        aItem.Caption:='-';
        aItem.Hint:='';
        PopList.Items.Add(aItem);

        for I := 1 to 9 do
        begin
             aTitle:=ReadString('QRList2_'+i.ToString,'title','');
             aFile :=ReadString('QRList2_'+i.ToString,'filename','');
             if (aTitle<>'') and FileExists(aFile) then
             begin
                  aItem:=TMenuItem.Create(PopList);
                  aItem.Caption:=aTitle;
                  aItem.Name:='N_QRList2_'+I.ToString;
                  aItem.Hint:=aFile;
                  aItem.OnClick:=QRClick;
                  PopList.Items.Add(aItem);
             end;
        end;

        PopList.Items.Add(PopListFixLineBottom);
        PopList.Items.Add(NSeting);
      finally
      free;
      end;
      /////////////////list

  with TRegistry.Create do
  begin
  try
    rootkey:=HKEY_CURRENT_USER;//HKEY_LOCAL_MACHINE;
    openkey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true);
    CheckBox1.Checked := ValueExists('ClipboardAssistant');
    CloseKey;
  Except
  On E:Exception do
  begin
    //s:=e.Message;
    //MessageBox(handle,Pchar(S),'ReadString',MB_OK);
  end;
  end;
  free;
  end;

    LoadExList(ls,ExtractFilePath(paramstr(0))+'data\ls.json');
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  Hide;
end;

procedure TfrmMain.Label11Click(Sender: TObject);
begin
     //ShellExecute(handle,nil,pchar('http://www.yxydev.com/'),nil,nil,SW_shownormal);
end;

procedure TfrmMain.btnSaveMC2Click(Sender: TObject);
var sKey,sValue:String;  curRowIndex:Integer;
begin
     mc2.Text :=Trim(mc2.Text);
     if mc2.Text <> '' then
     begin
        if (0 < ls.Row) and ( ls.Row < ls.RowCount ) and (ls.Strings.Count>0) then
        begin
             curRowIndex := ls.Row-1;
             sKey  := ls.Strings.Names[curRowIndex];
             sValue:= ls.Strings.ValueFromIndex[curRowIndex];
             if Application.MessageBox(Pchar('确定更新【'+edtMC2Name.Text+'】'#13#10'为【'+sKey+'】吗？'),pchar('更新确认'),MB_YESNO)=IDYES then
             begin
                ls.Keys[ls.Row] := edtMC2Name.Text;
                ls.Strings.ValueFromIndex[ curRowIndex ]:=mc2.Text;
             end;
        end;
     end;
     SaveExList(ls,ExtractFilePath(paramstr(0)) +'Data\ls.json' );
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  with TIniFile.Create( ExtractFilePath( ParamStr(0))+'params.ini') do
  try
    WriteString('params','k0n',trim(Edit10.Text));
    WriteString('params','k1n',trim(Edit11.Text));
    WriteString('params','k2n',trim(Edit12.Text));
    WriteString('params','k3n',trim(Edit13.Text));
    WriteString('params','k4n',trim(Edit14.Text));
    WriteString('params','k5n',trim(Edit15.Text));
    WriteString('params','k6n',trim(Edit16.Text));
    WriteString('params','k7n',trim(Edit17.Text));
    WriteString('params','k8n',trim(Edit18.Text));
    WriteString('params','k9n',trim(Edit19.Text));
    {
    WriteString('params','k0s',trim(Edit0.Text));
    WriteString('params','k1s',trim(Edit1.Text));
    WriteString('params','k2s',trim(Edit2.Text));
    WriteString('params','k3s',trim(Edit3.Text));
    WriteString('params','k4s',trim(Edit4.Text));
    WriteString('params','k5s',trim(Edit5.Text));
    WriteString('params','k6s',trim(Edit6.Text));
    WriteString('params','k7s',trim(Edit7.Text));
    WriteString('params','k8s',trim(Edit8.Text));
    WriteString('params','k9s',trim(Edit9.Text));
    }
  finally
    free;
  end;

end;

function AddToStartupViaRegistry(const AppName, AppPath: string;UnDo:Boolean=false): Boolean;
var
  Reg: TRegistry;
begin
  Result := False;
  Reg := TRegistry.Create(KEY_WRITE);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True) then
    begin
      if UnDo then
      begin
           Reg.DeleteValue(AppName);
      end
      else
      begin
      Reg.WriteString(AppName, '"' + AppPath + '"');
      end;
      Reg.CloseKey;
      Result := True;
    end;
  finally
    Reg.Free;
  end;
end;


procedure TfrmMain.CheckBox1Click(Sender: TObject);
begin
    AddToStartupViaRegistry('ClipboardAssistant',Application.ExeName,Not CheckBox1.Checked);
end;

procedure TfrmMain.CheckBox2Click(Sender: TObject);
begin
    with TIniFile.Create( ExtractFilePath( ParamStr(0))+'params.ini') do
    try
      if CheckBox2.Checked then
      begin
        WriteString('params','AutoShow','1');
      end
      else
      begin
        WriteString('params','AutoShow','0');
      end;
    finally
    free;
    end;
end;

procedure TfrmMain.LoadContentFromFile(aFile: String;Loadto:TMemo);
begin
  if (Loadto<>nil) and FileExists(aFile) then
  begin
     Loadto.Lines.LoadFromFile(afile);
  end
  else
  if Loadto<>nil then
  begin
    Loadto.Text:='尚未设置内容';
    Loadto.SetFocus;
    Loadto.SelectAll;
  end;
end;

procedure TfrmMain.lsClick(Sender: TObject);
begin
    if (0 < ls.Row) and ( ls.Row < ls.RowCount ) and (ls.Strings.Count>0) then
    begin
        edtMC2Name.Text := ls.Keys[ls.Row];
        mc2.Text := ls.Strings.ValueFromIndex[ ls.Row-1 ];
    end;
end;

procedure TfrmMain.lsDblClick(Sender: TObject);
begin
    if (0 <= ls.Row) and ( ls.Row < ls.RowCount ) and (ls.Strings.Count>0) then
    begin
        Clipboard.AsText :=ls.Strings.ValueFromIndex[ ls.Row-1 ];
        Close;
    end;
end;

procedure TfrmMain.mc2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if(ssCtrl in Shift) and  (Key = 83)  then
    btnSaveMC2Click(nil);
end;

procedure TfrmMain.SaveContentToFile(aFile: String; SaveFrom: TMemo);
begin
  if savefrom<>nil then
   SaveFrom.Lines.SaveToFile(afile);
   Application.MessageBox('保存成功','Result:',MB_ICONINFORMATION);
end;


procedure TfrmMain.SearchBox1InvokeSearch(Sender: TObject);
var rowIndex:Integer;
begin
     rowIndex:=-1;
     const keyWords = trim(SearchBox1.Text);
     for var i := 0 to ls.Strings.Count-1 do
     begin
          if Pos(UpperCase(keyWords), UpperCase(ls.Strings.Names[i])) > 0 then
          begin
            rowIndex:=i;
            Break;
          end;
     end;
     if rowIndex>-1 then
     ls.Row:=RowIndex+1;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
      EdtWebColor.Text:= TColorConverter.DelphiToWeb(strToint( edtDColor.Text ));
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
    edtDColor.Text:= '$00'+ copy(INTTOHEX( TColorConverter.WebToDelphi(EdtWebColor.Text )),3,6);
end;

procedure TfrmMain.TrayIconMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      if ssLeft in Shift then
      PopList.Popup(x,y-12);
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  if FQuikNaneT=nil then
  begin
    Application.MessageBox('请先双击选择要修改的项','Error',MB_ICONWARNING);
  end
  else
  SaveContentToFile(ExtractFilePath( ParamStr(0))+'/data/'+FQuikNaneT.Name+'.txt',mc);
  with TIniFile.Create( ExtractFilePath( ParamStr(0))+'params.ini') do
  try
    WriteString('params','k0n',trim(Edit10.Text));
    WriteString('params','k1n',trim(Edit11.Text));
    WriteString('params','k2n',trim(Edit12.Text));
    WriteString('params','k3n',trim(Edit13.Text));
    WriteString('params','k4n',trim(Edit14.Text));
    WriteString('params','k5n',trim(Edit15.Text));
    WriteString('params','k6n',trim(Edit16.Text));
    WriteString('params','k7n',trim(Edit17.Text));
    WriteString('params','k8n',trim(Edit18.Text));
    WriteString('params','k9n',trim(Edit19.Text));
  finally
    free;
  end;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
    if ls.Enabled then
    begin
          edtMC2Name.Text := Trim(edtMC2Name.Text);
          if (edtMC2Name.Text='') then
          begin
               raise Exception.Create('新条目标题不能为空');
          end;
          if (ls.Strings.IndexOfName(edtMC2Name.Text)>-1) then
          raise Exception.Create('条目[ '+edtMC2Name.Text+' ] 已经存在');

          ls.Strings.AddPair(edtMC2Name.Text,mc2.Text);
    end;
end;

procedure TfrmMain.ClickEvent_WithNameEdit(Sender: TObject);
begin
  FQuikNaneT:=(Sender as TEdit);
  Label_ChooseMC.caption:='当前编辑内容项：'+ FQuikNaneT.Text;
  LoadContentFromFile( ExtractFilePath( ParamStr(0))+'/data/'+FQuikNaneT.Name+'.txt',mc);
end;

procedure TfrmMain.DBClickEvent_WithNameEdit(Sender: TObject);
begin
  FQuikNaneT:=(Sender as TEdit);
  Label_ChooseMC.caption:='当前编辑内容项：'+ FQuikNaneT.Text;
  LoadContentFromFile( ExtractFilePath( ParamStr(0))+'/data/'+FQuikNaneT.Name+'.txt',mc );

  Clipboard.AsText:=Trim(mc.Lines.Text);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if not (GetKeyState(VK_CONTROL)<0) then
    begin
    Hide;
    CanClose:=false;
    end;
end;

end.
