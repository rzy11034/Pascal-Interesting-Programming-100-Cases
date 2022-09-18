unit PIP.Cases02_10;

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
  x, y, z, number: integer;
begin
  number := 0;
  for x := 0 to 10 do
  begin
    y := 20 - 2 * x;
    z := 30 - x - y;
    if 3 * x + 2 * y + z = 50 then
    begin
      number += 1;
      WriteLnF('%-4d: Men:%-4d Women:%-4d Children:%-4d', [number, x, y, z]);
    end;
  end;
end;

end.
