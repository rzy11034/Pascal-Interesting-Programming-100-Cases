unit PIP.Cases05_07;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,Math,
  DeepStar.Utils,
  DeepStar.Math;

procedure Main;

implementation

procedure Main;
var
  Count:integer;
  i, n: Int64;
begin
  Count := 0;

  for i := 1 to 30 do
  begin
    if i mod 10 = 0 then Continue;

    n := 2**i -1;
    if TMath.IsPrime(n) and TMath.IsPrime(i) then
    begin
      Count += 1;
      WriteLnF('(M: %d)=%-6d', [i,n]);
    end;
  end;

  WriteLnF('Total Count: %d', [Count]);
end;

end.

