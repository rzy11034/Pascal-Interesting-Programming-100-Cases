unit PIP.Cases03_02;

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
  a, i, b, n: integer;
begin
  for a := 1 to 3000 - 1 do
  begin
    b := 0;
    i := 1;
    while i <= a div 2 do
    begin
      if a mod i = 0 then
        b += i;

      i += 1;
    end;

    n := 0;
    i := 1;
    while i <= b div 2 do
    begin
      if b mod i = 0 then
        n += i;

      i += 1;
    end;

    if (n = a) and (a < b) then
      WriteLnF('%4d--%4d  ', [a, b]);
  end;
end;

end.
