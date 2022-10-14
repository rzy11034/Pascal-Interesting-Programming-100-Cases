unit PIP.Cases08_03;

{$mode objfpc}{$J-}
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
  a, b, c, d, i, j, k, l: integer;
  s: TArr_int;
begin
  a := 1;
  b := 3;
  c := 5;
  d := 10;
  SetLength(s, 1000);

  WriteLnF('%d  %d  %d  %d', [a, b, c, d]);
  for i := 0 to 5 do
  begin
    j := 0;
    while i + j <= 5 do
    begin
      k := 0;
      while k + i + j <= 5 do
      begin
        l := 0;
        while l + k + i + j <= 5 do
        begin
          if a * i + b * j + c * k + d * l <> 0 then
            s[a * i + b * j + c * k + d * l] += 1;

          l += 1;
        end;
        k += 1;
      end;
      j += 1;
    end;
  end;

  for i := 1 to 1000 do
    if s[i] = 0 then
      Break;

  i -= 1;
  WriteLnF('The max is %d.', [i]);
end;

end.
