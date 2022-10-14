unit PIP.Cases08_01;

{$mode objfpc}{$J-}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  n, i, x: integer;
  a: TArr_int;
begin
  n := 0;
  i := 0;
  x := 0;
  SetLength(a, 11);

  for i := 0 to 10 do
    a[i] := 1;

  for i := 0 to 999 do
  begin
    n += (i + 1);
    x := n mod 10;
    a[x] := 0;
  end;

  for i := 0 to 9 do
    if a[i] <> 0 then
      WriteLnF('可能在第%d个洞.', [i]);
end;

end.
