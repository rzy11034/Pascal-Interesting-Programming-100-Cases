unit PIP.Cases05_04;

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

  for i := 1000 to 9999 do
  begin
    if i mod 10 = 0 then
    begin
      Continue;
    end;

    str := i.ToString;
    n := str.ReverseString.ToInteger;
    if TMath.IsPrime(n) and TMath.IsPrime(i) then
    begin
      Count += 1;
      WriteF('%-6d', [i]);
    end;
  end;

  WriteLnF(LineEnding + 'Total Count: %d.', [Count]);
end;

end.
