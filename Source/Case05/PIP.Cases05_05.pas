unit PIP.Cases05_05;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString,
  DeepStar.Math;

procedure Main;

implementation

procedure Main;
var
  Count, i, n: integer;
  str: string;
begin
  Count := 0;

  for i := 10 to 1000 do
  begin
    if i mod 10 = 0 then Continue;

    str := i.ToString;
    n := str.ReverseString.ToInteger;
    if (i = n) and TMath.IsPrime(n) and TMath.IsPrime(i) then
    begin
      Count += 1;
      WriteF('%-6d', [i]);
    end;
  end;

  WriteLnF(LineEnding + 'Total Count: %d.', [Count]);
end;

end.
