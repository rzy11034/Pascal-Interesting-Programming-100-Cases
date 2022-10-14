unit PIP.Cases11_02;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

procedure Original_Case();
var
  m: double;
  y, x: integer;
begin
  for y := 10 downto -10 do
  begin
    m := 2 * Sqrt(100 - y * y);

    x := 1;
    while x < 30 - m do
    begin
      Write(' ');
      x += 1;
    end;

    WriteLn('*');

    while x < 30 + m do
    begin
      Write(' ');
      x += 1;
    end;

    WriteLn('*');
  end;
end;

procedure Solution();
var
  r, y, x, i: integer;
begin
  r := 10;

  for y := r downto -1 * r do
  begin
    x := round(2.2 * Sqrt(r * r - y * y));

    for i := 0 to round(r * 2.5 - x) do
      Write(' ');

    Write('*');

    for i := 0 to 2 * x do
      Write(' ');

    Write('*');

    WriteLn;
  end;
end;

procedure Main;
begin
  Solution;
end;

end.
