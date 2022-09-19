unit PIP.Cases03_04;

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
  m: TArr_int;
  n, i, t, Count: integer;
  a, k: cardinal;
begin
  SetLength(m, 16);
  Count := 0;

  WriteLn('No.    number    it''s square(palindrome)');

  for n := 1 to 256 - 1 do
  begin
    k := 0;
    t := 1;
    a := n * n;

    i := 0;
    while a <> 0 do
    begin
      m[i] := a mod 10;
      a := a div 10;

      i += 1;
    end;

    while i > 0 do
    begin
      k += m[i - 1] * t;
      t *= 10;

      i -= 1;
    end;

    if k = a then
    begin
      Count += 1;
      WriteLnF('%2d%10d%10d', [Count, n, n * n]);
    end;
  end;
end;

end.
