unit PIP.Utils;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.UString;

type
  //////////////////////////////
  UChar = DeepStar.UString.UChar;
  UString = DeepStar.UString.UString;

  /////////////////////////////////
  TArr_int = array of integer;

  //////////////////////////////////
  TLAUtils = class
  public
    class procedure DrawLine;
  end;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

procedure WriteF(const Fmt: string; const Args: array of const);
procedure WriteLnF(const Fmt: string; const Args: array of const);

implementation

procedure WriteF(const Fmt: string; const Args: array of const);
begin
  Write(Format(Fmt, Args));
end;

procedure WriteLnF(const Fmt: string; const Args: array of const);
begin
  WriteLn(Format(Fmt, Args));
end;

{ TLAUtils }

class procedure TLAUtils.DrawLine;
var
  i: integer;
begin
  for i := 0 to 70 do
  begin
    Write('-');
  end;
  Writeln;
end;

end.
