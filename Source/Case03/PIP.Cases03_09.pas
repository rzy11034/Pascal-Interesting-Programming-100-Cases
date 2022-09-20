unit PIP.Cases03_09;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  a, b, c, Count: integer;
begin
  count:=0;

  WriteLn('100以内的勾股数有：');
  WriteLn('   a    b    c     a    b    c     a    b    c     a    b    c');
  for a := 1 to 100 do
  begin
    for b := a + 1 to 100 do
    begin
      c := Round(Sqrt(a ** 2 + b ** 2));
      if (c ** 2 = a ** 2 + b ** 2) and (a + b > c) and (a + c > b)
        and (b + c > a) and (c <= 100) then
      begin
        WriteF('%4d %4d %4d'#09, [a, b, c]);
        Count += 1;

        if Count mod 4 = 0 then
          WriteLn;
      end;
    end;
  end;

  WriteLn;
end;

end.
