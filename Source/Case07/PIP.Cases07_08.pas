unit PIP.Cases07_08;

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
  d1, d2, c1, c2, i, j: integer;
begin
  c1 := 0;
  c2 := 0;
  Randomize;

  for i := 0 to 100 do
  begin
    d1 := 0;
    d2 := 0;
    for j := 1 to 6 do
    begin
      d1 := d1 + Random(6) + 1;
      d2 := d2 + Random(6) + 1;
    end;

    if d1 > d2 then
      c1 += 1
    else if d1 < d2 then
      c2 += 1;
  end;

  if c1 > c2 then
    WriteLnF('%s', ['The first win.'])
  else if c1 < c2 then
    WriteLn('The second win.')
  else
    WriteLn('They tie.');
end;

end.
