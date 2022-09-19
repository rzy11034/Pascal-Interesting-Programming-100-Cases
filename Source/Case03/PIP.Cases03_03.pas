unit PIP.Cases03_03;

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
  mul, number, k, a, b: integer;
begin
  WriteLn('It exists following automorphic numbers small than 100000:');

  for number := 0 to 100000 - 1 do
  begin
    mul := number;
    k := 1;

    while mul div 10 > 0 do
    begin
      mul := mul div 10;
      k *= 10;
    end;

    a := k * 10;
    mul := 0;
    b := 10;

    while k > 0 do
    begin
      mul := (mul + (number mod (k * 10)) * (number mod b - number mod (b div 10))) mod a;
      k := k div 10;
      b *= 10;
    end;

    if number = mul then
      WriteF('%1d  ', [number]);
  end;

  WriteLn;
end;

end.
