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
  PIP.Cases07_04;

procedure Test;
var
  i: Integer;
  s:string;
  a:TArr2D_int;
  c:char;
begin
  //SetLength(a, 10, 10);
  //c:= '♠';
  //s:=ord(c).ToHexString;
  ////'♠♣♥♦'
  //Write(c);
  Exit;
end;

procedure Run;
begin
  Test;
  Main;
end;

end.
