unit PIP.Cases05_03;

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
  number: TArr_int;
  i, j, Count: integer;
begin
  Count := 0;
  SetLength(number, 320);
  WriteLn('列出第一行中差值为1989的所有素数组合：');

  j := 0;
  i := 3;
  while i <= 2000 do
  begin
    if TMath.IsPrime(i) then
    begin
      number[j] := i;
      j += 1;
    end;

    i += 2;
  end;

  //j -= 1;
  while number[j] > 1898 do
  begin
    i := 0;
    while number[j] - number[i] > 1898 do
    begin
      if number[j] - number[i] = 1898 then
      begin
        Count += 1;
        WriteLnF('(%d).%3d, %d' + LineEnding, [Count, number[i], number[j]]);
      end;

      i += 1;
    end;

    j -= 1;
  end;
end;

end.
