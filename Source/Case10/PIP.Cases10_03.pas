unit PIP.Cases10_03;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

const
  N = 30000;

procedure Main;
var
  x, y: single;
  c, d: integer;
begin
  c := 0;
  d := 0;
  Randomize;

  while c <= N do
  begin
    c += 1;

    x := Random(100);
    y := Random(100);

    if x * x + y * y <= 10000 then
      d += 1;
  end;

  WriteLnF('π=%f', [4 * d / N]);
end;

end.
