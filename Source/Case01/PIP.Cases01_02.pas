unit PIP.Cases01_02;

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
  a, b, c, i: integer;
begin
  WriteLn('A, B, C三人所选的书分别为：');

  i := 0;

  for a := 1 to 5 do
  begin
    for b := 1 to 5 do
    begin
      c := 1;

      while (c <= 5) and (a <> b) do
      begin
        if (a <> c) and (b <> c) then
        begin
          WriteF('A:%d B:%d C:%d  ', [a, b, c]);

          i += 1;

          if i mod 4 = 0 then
            WriteLn;
        end;

        c += 1;
      end;
    end;
  end;

  WriteLnF('共有%d种有效借阅方法。', [i]);
end;

end.
