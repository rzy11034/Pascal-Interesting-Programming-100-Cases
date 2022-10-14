unit PIP.Cases08_04;

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
  a: TArr2D_int;
  Count, i, j, k, m, n: integer;
  flag: boolean;
begin
  Count := 0;
  SetLength(a, 3, 3);


  WriteLn('It exists possible distribtion plans:');
  for i := 0 to 3 do
  begin
    a[0, 0] := i;

    j := i;
    while (j <= 7 - i) and (j <= 3) do
    begin
      a[1, 0] := j;

      a[2, 0] := 7 - j - a[0, 0];
      if a[2, 0] > 3 then
      begin
        j += 1;
        Continue;
      end;

      if a[2, 0] < a[1, 0] then
        Break;

      k := 1;
      while k <= 5 do
      begin
        a[0, 1] := k;

        m := 1;
        while m < 7 - k do
        begin
          a[1, 1] := m;
          a[2, 1] := 7 - k - m;

          flag := true;
          n := 0;
          while flag and (n < 3) do
          begin
            if (a[n, 0] + a[n, 1] < 7) and (a[n, 0] * 2 + a[n, 1] = 7) then
              a[n, 2] := 7 - a[n, 0] - a[n, 1]
            else
              flag := false;

            n += 1;
          end;

          if flag then
          begin
            Count += 1;
            WriteLnF('No. %d Full basdet Semi-basket Empthy', [Count]);

            for n := 0 to 2 do
              WriteLnF(' fisher %s: %d  %d  %d', [
                Chr(Ord('A') + n), a[n, 0], a[n, 1], a[n, 2]]);
          end;

          m += 2;
        end;

        k += 2;
      end;

      j += 1;
    end;
  end;
end;

end.
