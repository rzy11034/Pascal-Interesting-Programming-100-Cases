unit PIP.Cases10_04;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

procedure Main;

implementation

procedure Fun(n: integer);
var
  cube: integer;
  i, j, sum: integer;
begin
  sum := 0;
  Write('请输入n值：');
  WriteLn(n);

  cube := n ** 3;

  i := 1;
  while i < cube do
  begin
    j := i;
    while j < cube do
    begin
      sum += j;
      if sum = cube then
        WriteLnF('%d=%d+%d+...+%d', [cube, i, i + 2, j]);

      if sum > cube then
      begin
        sum := 0;
        Break;
      end;
      j += 2;
    end;
    i += 2;
  end;
end;

procedure Main;
var
  n: integer;
begin
  n := 5;
  Fun(n);
  DrawLineBlockEnd;

  n := 14;
  Fun(n);
end;

end.
