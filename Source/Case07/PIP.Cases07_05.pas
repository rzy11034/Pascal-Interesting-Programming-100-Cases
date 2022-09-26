unit PIP.Cases07_05;

{$mode objfpc}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure P(b: TArr_int; n: TArr_chr);
var
  i: integer;
begin
  Write(#006' ');
  for i := 0 to 12 do
    if b[i] div 13 = 0 then
      WriteLnF('%s ', [n[b[i] mod 13]]);

  Write(#003' ');
  for i := 0 to 12 do
    if b[i] div 13 = 1 then
      WriteLnF('%s ', [n[b[i] mod 13]]);

  Write(#004' ');
  for i := 0 to 12 do
    if b[i] div 13 = 2 then
      WriteLnF('%s ', [n[b[i] mod 13]]);

  Write(#005' ');
  for i := 0 to 12 do
    if (b[i] div 13 = 3) or (b[i] div 13 = 4) then
      WriteLnF('%s ', [n[b[i] mod 13]]);

  WriteLn;
end;

{$REGION 'The book the original case'}
procedure Original_Case;
var
  n: TArr_chr;
  a, b1, b2, b3, b4: TArr_int;
  b11, b22, b33, b44, t, m, flag, i: integer;
begin
  n := ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'];
  SetLength(a, 53);
  SetLength(b1, 13);
  SetLength(b2, 13);
  SetLength(b3, 13);
  SetLength(b4, 13);
  b11 := 0;
  b22 := 0;
  b33 := 0;
  b44 := 0;
  t := 1;

  Randomize;

  while t <= 52 do
  begin
    m := Random(51);

    flag := 1;
    i := 1;
    while (i <= t) and (flag <> 0) do
    begin
      if m = a[i] then
        flag := 0;
      i += 1;
    end;

    if flag <> 0 then
    begin
      a[t] := m;
      t += 1;

      if t mod 4 = 0 then
      begin
        b1[b11] := a[t - 1];
        b11 += 1;
      end
      else if t mod 4 = 1 then
      begin
        b2[b22] := a[t - 1];
        b22 += 1;
      end
      else if t mod 4 = 2 then
      begin
        b3[b33] := a[t - 1];
        b33 += 1;
      end
      else if t mod 4 = 3 then
      begin
        b4[b44] := a[t - 1];
        b44 += 1;
      end;
    end;
  end;

  TArrayUtils_int.Sort(b1);
  TArrayUtils_int.Sort(b2);
  TArrayUtils_int.Sort(b3);
  TArrayUtils_int.Sort(b4);

  P(b1, n);
  P(b2, n);
  P(b3, n);
  P(b4, n);
end;
{$ENDREGION}

procedure Main;
begin

end;

end.
