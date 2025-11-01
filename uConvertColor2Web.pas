unit uConvertColor2Web;

interface

uses
  Windows, SysUtils, StrUtils;

type
  TColorConverter = class
  public
    // 将 Delphi TColor ($00BBGGRR) 转为 Web 字符串
    // IncludeAlpha: 若为 True，会尝试从高位字节取 Alpha（非标准，慎用）
    class function DelphiToWeb(Color: DWORD; IncludeAlpha: Boolean = False): string;

    // Web 字符串转为 Delphi TColor ($00BBGGRR)
    class function WebToDelphi(const AWebColor: string): DWORD;
  end;

implementation

function HexToByte(const H: string): Byte;
begin
  if Length(H) <> 2 then
    raise Exception.Create('Invalid hex length');
  Result := StrToInt('$' + H);
end;

function ParseRGBValue(const S: string): Byte;
var
  Val: Integer;
begin
  Val := StrToInt(Trim(S));
  if (Val < 0) or (Val > 255) then
    raise Exception.Create('RGB out of range');
  Result := Byte(Val);
end;

function ParseAlphaValue(const S: string): Byte;
var
  Temp: string;
  F: Double;
  Val: Integer;
begin
  Temp := Trim(S);
  if Pos('.', Temp) > 0 then
  begin
    F := StrToFloat(Temp);
    if (F < 0.0) or (F > 1.0) then
      raise Exception.Create('Alpha float out of [0,1]');
    Result := Round(F * 255);
  end
  else
  begin
    Val := StrToInt(Temp);
    if (Val < 0) or (Val > 255) then
      raise Exception.Create('Alpha int out of [0,255]');
    Result := Byte(Val);
  end;
end;

{ TColorConverter }

class function TColorConverter.DelphiToWeb(Color: DWORD; IncludeAlpha: Boolean = False): string;
var
  R, G, B: Byte;
  A: Byte;
begin
  // Delphi TColor: $00BBGGRR
  R := Color and $000000FF;          // Red is lowest byte
  G := (Color and $0000FF00) shr 8;  // Green
  B := (Color and $00FF0000) shr 16; // Blue

  if IncludeAlpha then
  begin
    A := (Color and $FF000000) shr 24; // Non-standard: high byte as alpha
    Result := Format('#%.2x%.2x%.2x%.2x', [A, R, G, B]);
  end
  else
    Result := Format('#%.2x%.2x%.2x', [R, G, B]);
end;

class function TColorConverter.WebToDelphi(const AWebColor: string): DWORD;
var
  WebColor: string;
  HexStr: string;
  Len: Integer;
  R, G, B, A: Byte;
  Parts: TArray<string>;
begin
  WebColor := UpperCase(Trim(AWebColor));
  if WebColor = '' then
    raise Exception.Create('Empty color');

  A := $00; // 默认 Alpha = 0（因为 TColor 通常不用高位）

  if WebColor.StartsWith('#') then
  begin
    HexStr := Copy(WebColor, 2, MaxInt);
    Len := Length(HexStr);

    if Len = 3 then
      HexStr := HexStr[1]+HexStr[1] + HexStr[2]+HexStr[2] + HexStr[3]+HexStr[3]
    else if Len = 4 then
      HexStr := HexStr[1]+HexStr[1] + HexStr[2]+HexStr[2] + HexStr[3]+HexStr[3] + HexStr[4]+HexStr[4];

    Len := Length(HexStr);

    if Len = 6 then
    begin
      R := HexToByte(Copy(HexStr, 1, 2));
      G := HexToByte(Copy(HexStr, 3, 2));
      B := HexToByte(Copy(HexStr, 5, 2));
      A := $00;
    end
    else if Len = 8 then
    begin
      A := HexToByte(Copy(HexStr, 1, 2)); // Alpha first in #AARRGGBB
      R := HexToByte(Copy(HexStr, 3, 2));
      G := HexToByte(Copy(HexStr, 5, 2));
      B := HexToByte(Copy(HexStr, 7, 2));
    end
    else
      raise Exception.Create('Invalid hex length');
  end
  else if StartsText('RGB(', WebColor) then
  begin
    WebColor := Copy(WebColor, 5, Length(WebColor) - 5);
    if WebColor.EndsWith(')') then SetLength(WebColor, Length(WebColor) - 1);
    Parts := SplitString(WebColor, ',');
    if Length(Parts) <> 3 then raise Exception.Create('rgb() error');
    R := ParseRGBValue(Parts[0]);
    G := ParseRGBValue(Parts[1]);
    B := ParseRGBValue(Parts[2]);
    A := $00;
  end
  else if StartsText('RGBA(', WebColor) then
  begin
    WebColor := Copy(WebColor, 6, Length(WebColor) - 6);
    if WebColor.EndsWith(')') then SetLength(WebColor, Length(WebColor) - 1);
    Parts := SplitString(WebColor, ',');
    if Length(Parts) <> 4 then raise Exception.Create('rgba() error');
    R := ParseRGBValue(Parts[0]);
    G := ParseRGBValue(Parts[1]);
    B := ParseRGBValue(Parts[2]);
    A := ParseAlphaValue(Parts[3]);
  end
  else
    raise Exception.Create('Unsupported format');

  // 构建 Delphi TColor: $00BBGGRR
  // 注意：A 放在最高位是非标准用法，通常 TColor 不带 Alpha
  Result := (DWORD(A) shl 24) or (DWORD(B) shl 16) or (DWORD(G) shl 8) or DWORD(R);
end;

end.
