unit PIP.Cases03_06;

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
  i, t, k: integer;
  a: TArr_int;
begin
  SetLength(a, 3);

  WriteLn('There are following Armstrong number smaller than 1000:');

  for i := 2 to 999 do
  begin
    t := 0;
    k := i;

    while k <> 0 do
    begin
      a[t] := k mod 10;
      k := k div 10;
      t += 1;
    end;

    if a[0] ** 3 + a[1] ** 3 + a[2] ** 3 = i then
      WriteF('%d  ', [i]);
  end;

  WriteLn;
end;

end.
