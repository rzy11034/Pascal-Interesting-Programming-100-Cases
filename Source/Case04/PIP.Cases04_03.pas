unit PIP.Cases04_03;

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
  int, i, max, min, sum: integer;
  a: TArr_int;
begin
  sum := 0;
  max := integer.MinValue;
  min := integer.MaxValue;
  a := [46, 47, 98, 87, 77, 69, 43, 56, 38, 80];

  sum := 0;
  for i := 0 to 9 do
  begin
    int := a[i];
    sum += int;

    if int > max then max := int;
    if int < min then min := int;
  end;

  WriteLnF('Canceled max score:%d' + LineEnding + 'Canceled min score:%d',
    [max, min]);
  WriteLnF('Average score:%d', [(sum - max - min) div 8]);
end;

end.
