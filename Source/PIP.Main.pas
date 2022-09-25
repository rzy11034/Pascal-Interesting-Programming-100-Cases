unit PIP.Main;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  {%H-}Math,
  {%H-}DeepStar.Utils;

procedure Run;

implementation

uses
  PIP.Cases07_05;

procedure Test;
var
  i: Integer;
  s:string;
  a:TArr2D_int;
begin
  SetLength(a, 10, 10);
  s:=ord('♠').ToHexString;
  Write('♠♣♥♦');
  Exit;
end;

procedure Run;
begin
  Test;
  Main;
end;

end.
