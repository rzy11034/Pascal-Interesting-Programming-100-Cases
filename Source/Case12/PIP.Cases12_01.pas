unit PIP.Cases12_01;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Solution;
var
  red: TArr_int;
  checkRed: TArr_bool;
  blue, rand, i: integer;
begin
  SetLength(red, 7);
  SetLength(checkRed, 34);

  i := 1;
  repeat
    rand := Random(33) + 1;

    if checkRed[rand] then
      Continue;

    checkRed[rand] := true;
    red[i] := rand;
    i += 1;
  until i = 7;

  blue := Random(16) + 1;

  Write('红色球：');
  for i := 1 to 6 do
    WriteF('%d ', [red[i]]);
  WriteLnF('蓝色球：%d', [blue]);
end;

procedure Main;
var
  i: integer;
begin
  Randomize;
  for i := 0 to 6 do
  begin
    Solution;
  end;
end;

end.
