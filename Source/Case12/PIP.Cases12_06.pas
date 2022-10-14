unit PIP.Cases12_06;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

const
  BLUE = 'B';
  WHITE = 'W';
  RED = 'R';

procedure Main;
var
  color: string;
  w, b, r, i: integer;
begin
  color := 'RWBWWBRBWR';
  w := 0;
  b := 0;
  r := color.Length - 1;

  for i := 0 to r do
    WriteF('%s ', [color.Chars[i]]);
  WriteLn;

  while w <= r do
  begin
    if color.Chars[w] = WHITE then
      w += 1
    else if color.Chars[w] = BLUE then
    begin
      Swap(color, b, w);
      b += 1;
      w += 1;
    end
    else
    begin
      while (w < r) and (color.Chars[r] = RED) do
        r -= 1;

      Swap(color, r, w);
      r -= 1;
    end;
  end;

  for i := 0 to color.Length - 1 do
    WriteF('%s ', [color.Chars[i]]);
  WriteLn;
end;

end.
