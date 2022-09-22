unit PIP.Cases06_04;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

procedure Main;
var
  i, a, b, c, d: integer;
begin
  a := 1;
  b := 0;
  c := 0;
  d := 0;

  for i := 1 to 4 do
  begin
    if (b + d = 1) and (b + c = 1) and (a + b = 1) then
    begin
      Break;
    end
    else
    begin
      case i of
        1:
        begin
          a := 0;
          b := 1;
        end;

        2:
        begin
          b := 0;
          c := 1;
        end;

        3:
        begin
          c := 0;
          d := 1;
        end;
      end;
    end;
  end;

  WriteLn('判断结果：');
  case i of
    1: WriteLn('甲是窃贼');
    2: WriteLn('乙是窃贼');
    3: WriteLn('丙是窃贼');
    4: WriteLn('丁是窃贼');
  end;
end;

end.
