unit PIP.Cases12_02;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

var
  Count: integer;

function Judge(b: TArr_int): integer;
var
  l, i: integer;
begin
  for l := 1 to 3 do
  begin
    for i := l + 1 to 4 do
    begin
      if b[l] = b[i] then
        Exit(0);
    end;
  end;

  Result := 1;
end;

procedure Print(u: TArr_int);
var
  i: integer;
begin
  Count += 1;
  WriteF(LineEnding + '结果%d:', [Count]);
  for i := 0 to 5 do
  begin
    if i mod 3 = 0 then
      WriteF(LineEnding + '%d ', [u[i]])
    else
      WriteF('%d ', [u[i]]);
  end;
  WriteLn;
end;

procedure Main;
var
  a: TArr_int;
begin
  a := [1, 2, 3, 4, 5, 6];
  WriteLn('满足条件的结果为：');

  a[1] := a[0] + 1;
  while a[1] <= 5 do
  begin
    a[2] := a[1] + 1;
    while a[2] <= 5 do
    begin
      a[3] := a[0] + 1;
      while a[3] <= 5 do
      begin
        a[4] := specialize IfThen<integer>(a[1] > a[3], a[1] + 1, a[3] + 1);
        while a[4] <= 5 do
        begin
          if Judge(a) <> 0 then
            Print(a);

          a[4] += 1;
        end;

        a[3] += 1;
      end;

      a[2] += 1;
    end;

    a[1] += 1;
  end;
end;

end.
