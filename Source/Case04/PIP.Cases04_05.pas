unit PIP.Cases04_05;

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
  i, num1, num2, temp, n: integer;
begin
  n := 0;

  WriteLn('The fraction serials with demominator 40 is:');

  for i := 1 to 39 do
  begin
    num1 := 40;
    num2 := i;

    while num2 <> 0 do
    begin
      temp := num1 mod num2;
      num1 := num2;
      num2 := temp;
    end;

    if num1 = 1 then
    begin
      n += 1;
      WriteF('%2d/40 ', [i]);
      if n mod 8 = 0 then
        WriteLn;
    end;
  end;
end;

end.
