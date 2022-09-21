unit PIP.Cases05_06;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.Math;

procedure Main;

implementation

procedure Main;
var
  Count, i, n: integer;
begin
  Count := 0;

  for i := 3 to 999 do
  begin
    if i mod 10 = 0 then Continue;

    n := i + 2;
    if TMath.IsPrime(n) and TMath.IsPrime(i) then
    begin
      Count += 1;
      WriteF('[%-6d, %-6d]   ', [i, n]);

      if Count mod 5 = 0 then
        Write(LineEnding);
    end;
  end;

  WriteLnF(LineEnding + 'Total Count: %d', [Count]);
end;

end.
