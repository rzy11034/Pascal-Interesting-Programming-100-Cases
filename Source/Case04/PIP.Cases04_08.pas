unit PIP.Cases04_08;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

procedure Main;
var
  m, n, i, j, x: integer;
  remainder, quotient: TArr_int;
  a, strs: TArr_str;
begin
  a := ['1/40', '1/6', '25/95'];

  for x := 0 to High(a) do
  begin
    remainder := nil;
    quotient := nil;
    SetLength(remainder, 101);
    SetLength(quotient, 101);

    Write('Please input a fraction(m/n)(<0<m<n<=100):');
    WriteLn(a[x]);

    strs := a[x].Split(['/']);
    m := strs[0].ToInteger;
    n := strs[1].ToInteger;
    WriteF('%d/%d it''s accuracy value is: 0.', [m, n]);

    for i := 1 to 100 do
    begin
      remainder[m] := i;
      m *= 10;
      quotient[i] := m div n;
      m := m mod n;

      if m = 0 then
      begin
        for j := 1 to i do
          Write(quotient[j]);

        WriteLn;
        Break;
      end;

      if remainder[m] <> 0 then
      begin
        for j := 1 to i do
          Write(quotient[j]);

        WriteLnF(NEW_LINE + #9'and, it is a infinite cyclic fraction from %d',
          [remainder[m]]);
        WriteLnF(#9'digit to %d digit after decimal point.', [i]);

        Break;
      end;
    end;

    if x <> High(a) then
      DrawLineBlockEnd;
  end;
end;

end.
