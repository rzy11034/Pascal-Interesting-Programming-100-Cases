unit PIP.Cases07_04;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

var
  number: integer;

procedure Print(a: TArr_int);
var
  i: integer;
begin
  WriteLnF('No. %2d：...........', [number]);
  number += 1;
  WriteLn(' ');

  for i := 0 to 6 do
    WriteF(' | %s', [
      specialize IfThen<string>(a[i] = 1, '○',
      specialize IfThen<string>(a[i] = 2, '●', ' '))]);

  WriteLn(' |');
end;

{$REGION 'The book the original case'}
procedure Original_Case;
var
  t: TArr_int;
  i, flag: integer;
begin
  t := [1, 1, 1, 0, 2, 2, 2];
  Print(t);

  while (t[0] + t[1] + t[2] <> 6) or (t[4] + t[5] + t[6] <> 3) do
  begin
    flag := 1;

    i := 0;
    while (flag <> 0) and (i < 5) do
    begin
      if (t[i] = 1) and (t[i + 1] = 2) and (t[i + 2] = 0) then
      begin
        specialize Swap<integer>(t[i], t[i + 2]);
        Print(t);
        flag := 0;
      end;
      i += 1;
    end;

    i := 0;
    while (flag <> 0) and (i < 6) do
    begin
      if (t[i] = 0) and (t[i + 1] = 1) and (t[i + 2] = 2) then
      begin
        specialize Swap<integer>(t[i], t[i + 2]);
        Print(t);
        flag := 0;
      end;
      i += 1;
    end;

    { TODO -orzy : 数组溢出 }
    i := 0;
    while (flag <> 0) and (i < 6) do
    begin
      if (t[i] = 1) and (t[i + 1] = 0) and ((i = 0) or (t[i - 1] <> t[i + 2])) then
      begin
        specialize Swap<integer>(t[i], t[i + 1]);
        Print(t);
        flag := 0;
      end;
      i += 1;
    end;

    i := 0;
    while (flag <> 0) and (i < 6) do
    begin
      if (t[i] = 0) and (t[i + 1] = 2) and ((i = 5) or (t[i - 1] <> t[i + 2])) then
      begin
        specialize Swap<integer>(t[i], t[i + 1]);
        Print(t);
        flag := 0;
      end;
      i += 1;
    end;
  end;
end;

{$ENDREGION}

procedure Solution;
var
  t: TArr_int;
  i: integer;
  flag: boolean;
begin
  t := [1, 1, 1, 0, 2, 2, 2];
  Print(t);

  while (t[0] + t[1] + t[2] <> 6) or (t[4] + t[5] + t[6] <> 3) do
  begin
    flag := true;
  end;
end;

procedure Main;
begin
  Original_Case;
  //Solution;
end;

end.
