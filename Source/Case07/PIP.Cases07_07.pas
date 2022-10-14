unit PIP.Cases07_07;

{$mode objfpc}{$J-}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

const
  op: TArr_chr = ('#', '+', '-', '*', '/');

function Cal(x, y: double; op: integer): double;
var
  res: double;
begin
  case op of
    1: res := x + y;
    2: res := x - y;
    3: res := x * y;
    4: res := x / y;
  end;

  Result := res;
end;

function Calculate_model1(i, j, k, t: double; op1, op2, op3: integer): double;
var
  r1, r2, r3: double;
begin
  r1 := Cal(i, j, op1);
  r2 := Cal(r1, k, op2);
  r3 := Cal(r2, t, op3);
  Result := r3;
end;

function Calculate_model2(i, j, k, t: double; op1, op2, op3: integer): double;
var
  r1, r2, r3: double;
begin
  r1 := Cal(j, k, op1);
  r2 := Cal(i, r1, op2);
  r3 := Cal(r2, t, op3);
  Result := r3;
end;

function Calculate_model3(i, j, k, t: double; op1, op2, op3: integer): double;
var
  r1, r2, r3: double;
begin
  r1 := Cal(k, t, op1);
  r2 := Cal(j, r1, op2);
  r3 := Cal(i, r2, op3);
  Result := r3;
end;

function Calculate_model4(i, j, k, t: double; op1, op2, op3: integer): double;
var
  r1, r2, r3: double;
begin
  r1 := Cal(j, k, op1);
  r2 := Cal(r1, t, op2);
  r3 := Cal(i, r2, op3);
  Result := r3;
end;

function Calculate_model5(i, j, k, t: double; op1, op2, op3: integer): double;
var
  r1, r2, r3: double;
begin
  r1 := Cal(i, j, op1);
  r2 := Cal(k, t, op2);
  r3 := Cal(r1, r2, op3);
  Result := r3;
end;

function Get24(i, j, k, t: integer): integer;
var
  op1, op2, op3, flag: integer;
begin
  flag := 0;

  for op1 := 1 to 4 do
  begin
    for op2 := 1 to 4 do
    begin
      for op3 := 1 to 4 do
      begin
        if Calculate_model1(i, j, k, t, op1, op2, op3) = 24 then
        begin
          WriteLnF('((%d%s%d)%s%d)%s%d=24', [i, op[op1], j, op[op2], k, op[op3], t]);
          flag := 1;
        end;

        if Calculate_model2(i, j, k, t, op1, op2, op3) = 24 then
        begin
          WriteLnF('(%d%s(%d%s%d))%s%d=24', [i, op[op1], j, op[op2], k, op[op3], t]);
          flag := 1;
        end;

        if Calculate_model3(i, j, k, t, op1, op2, op3) = 24 then
        begin
          WriteLnF('%d%s(%d%s(%d%s%d))=24', [i, op[op1], j, op[op2], k, op[op3], t]);
          flag := 1;
        end;

        if Calculate_model4(i, j, k, t, op1, op2, op3) = 24 then
        begin
          WriteLnF('%d%s((%d%s%d)%s%d)=24', [i, op[op1], j, op[op2], k, op[op3], t]);
          flag := 1;
        end;

        if Calculate_model5(i, j, k, t, op1, op2, op3) = 24 then
        begin
          WriteLnF('(%d%s%d)%s(%d%s%d)=24', [i, op[op1], j, op[op2], k, op[op3], t]);
          flag := 1;
        end;
      end;
    end;
  end;

  Result := flag;
end;

procedure Main;
var
  i, j, k, t: integer;
begin
  WriteLn('Please input four integer (1~10)');
  i := 1;
  j := 2;
  k := 3;
  t := 4;
  WriteLnF('%d %d %d %d ', [i, j, k, t]);

  if (not i in [1..10]) or (not j in [1..10]) or (not k in [1..10]) or (not t in [1..10]) then
  begin
    WriteLn('Input illege, Please input again');
  end;

  if Get24(i, j, k, t) = 0 then
    WriteLn('Sorry, the four integer cannot be calculated to get 24');
end;

end.
