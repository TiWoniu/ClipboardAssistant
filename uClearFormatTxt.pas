{ ... }
unit uClearFormatTxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmClearFormatTxt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    e: TEdit;
    m: TMemo;
    procedure FormShow(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure mChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClearFormatTxt: TfrmClearFormatTxt;

implementation uses Clipbrd;
{$R *.dfm}

procedure TfrmClearFormatTxt.FormShow(Sender: TObject);
begin
    e.clear;
    m.Clear;
    e.SetFocus;
end;

procedure TfrmClearFormatTxt.eChange(Sender: TObject);
begin
   if trim(e.Text)='' then exit;
   Clipboard.AsText:=Trim(e.Text);
   caption:=' COPYED : '+ e.Text;
   close;
end;

procedure TfrmClearFormatTxt.mChange(Sender: TObject);
begin
   if trim(m.Text)='' then exit;
  Clipboard.AsText:=Trim(m.Lines.Text);
  caption:=' COPYED : '+ m.Text
  ;close;
end;

end.
