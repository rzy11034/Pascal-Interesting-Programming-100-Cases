unit PIP.Cases02_08;

{$mode objfpc}{$H+}
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
  i, j, n: integer;
  a: TArr_int;
begin
  Setlength(a, 14);
  j := 1;
  WriteLn('魔术师手中的牌原始次序是：');

  for i := 1 to 13 do
  begin
    n := 1;

    repeat
      if j > 13 then
        j := 1;

      if a[j] <> 0 then
      begin
        j += 1;
      end
      else
      begin
        if (n = i) then
          a[j] := i;

        j += 1;
        n += 1;
      end;
    until n > i;
  end;

  for i := 1 to 13 do
    Write(a[i], ' ');

  WriteLn;
end;

end.
