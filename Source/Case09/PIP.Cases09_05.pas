unit PIP.Cases09_05;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function C(x, y: integer): integer;
var
  z: integer;
begin
  if (y = 1) or (y = x) then
    Result := 1
  else
  begin
    z := C(x - 1, y - 1) + C(x - 1, y);
    Result := z;
  end;
end;

procedure Main;
var
  n, i, j: integer;
begin
  Write('请输入杨辉三角的行数：');
  n := 10;
  WriteLnF('%d', [n]);

  for i := 1 to n do
  begin
    for j := 0 to n - i do
      Write('  ');
    for j := 1 to i do
      WriteF('%4d', [c(i, j)]);
    WriteLn;
  end;
end;

end.
