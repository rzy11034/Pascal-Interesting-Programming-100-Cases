unit PIP.Cases08_06;

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
  n: TArr2D_int;
  i, j: integer;
begin
  n := [[1, 2, 3], [4, 5, 6], [7, 8, 9]];

  WriteLn('原始矩阵：');
  for i := 0 to 2 do
  begin
    for j := 0 to 2 do
    begin
      WriteF('%d  ', [n[i, j]]);
    end;
    WriteLn;
  end;

  DrawLineBlockEnd;

  for i := 0 to 2 do
  begin
    for j := 0 to 2 do
    begin
      if j > i then
        specialize Swap<integer>(n[i, j], n[j, i]);
    end;
  end;

  WriteLn('转置矩阵：');
  for i := 0 to 2 do
  begin
    for j := 0 to 2 do
    begin
      WriteF('%d  ', [n[i, j]]);
    end;
    WriteLn;
  end;
end;

end.
