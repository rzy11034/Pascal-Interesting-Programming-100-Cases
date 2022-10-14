unit PIP.Cases11_01;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math;

procedure Main;

implementation

procedure Main;
var
  y, m: double;
  x: integer;
begin
  y := 1;
  while y >= -1 do
  begin
    m := ArcCos(y) * 10;

    x := 1;
    while x < m do
    begin
      Write(' ');
      x += 1;
    end;

    Write('*');

    while x < 62 - m do
    begin
      Write(' ');
      x += 1;
    end;

    WriteLn('*');

    y -= 0.1;
  end;
end;

end.
