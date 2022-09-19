unit PIP.Cases03_01;

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
  i, j, s, n: integer;
begin
  n := 1000;

  for i := 2 to n do
  begin
    s := 0;

    for j := 1 to i - 1 do
    begin
      if i mod j = 0 then
        s += j;
    end;

    if s = i then
      WriteLnF('It''s a perfect number: %d.', [i]);
  end;
end;

end.
