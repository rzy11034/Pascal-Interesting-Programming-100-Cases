unit PIP.Cases03_08;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function maxof3(a, b, c: integer): integer;
begin
  if a < b then specialize Swap<integer>(a, b);
  if a < c then specialize Swap<integer>(a, c);
  if b < c then specialize Swap<integer>(b, c);

  Result := a * 100 + b * 10 + c;
end;

function minof3(a, b, c: integer): integer;
begin
  if a < b then specialize Swap<integer>(a, b);
  if a < c then specialize Swap<integer>(a, c);
  if b < c then specialize Swap<integer>(b, c);

  Result := c * 100 + b * 10 + a;
end;

procedure Main;
var
  i, k: integer;
  hun, oct, Data, max, min, j, h: integer;
begin
  WriteLn('请输入一个三位数：');
  ReadLn(i);

  hun := i div 100;
  oct := i mod 100 div 10;
  Data := i mod 10;
  max := maxof3(hun, oct, Data);
  min := minof3(hun, oct, Data);
  j := max - min;

  k := 0;
  while true do
  begin
    h := j;
    hun := j div 100;
    oct := j mod 100 div 10;
    Data := j mod 10;
    max := maxof3(hun, oct, Data);
    min := minof3(hun, oct, Data);
    j := max - min;
    if j = h then
    begin
      WriteLn(j);
      Break;
    end;

    k += 1;
  end;
end;

end.
