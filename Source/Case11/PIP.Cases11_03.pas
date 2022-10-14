unit PIP.Cases11_03;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

procedure Main;
var
  i, j, n: integer;
begin
  Write('请输入菱形对称轴的行数：');
  n := 5;
  WriteLn(n);

  for i := 1 to n do
  begin
    for j := 1 to n + i - 1 do
    begin
      if (j = n + 1 - i) or (j = n - 1 + i) then
        Write('*')
      else
        Write(' ');
    end;

    WriteLn;
  end;

  for i := 1 to n - 1 do
  begin
    for j := 1 to 2 * n - 1 - i do
    begin
      if (j = i + 1) or (j = 2 * n - 1 - i) then
        Write('*')
      else
        Write(' ');
    end;
    WriteLn;
  end;
end;

end.
