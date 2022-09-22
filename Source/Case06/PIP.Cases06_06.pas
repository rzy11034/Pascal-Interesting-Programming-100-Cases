unit PIP.Cases06_06;

{$mode objfpc}{$H+}{$J+}
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
  A, B, C, D, E, F: integer;
begin
  for A := 0 to 1 do
  begin
    for B := 0 to 1 do
    begin
      for C := 0 to 1 do
      begin
        for D := 0 to 1 do
        begin
          for E := 0 to 1 do
          begin
            for F := 0 to 1 do
            begin
              if (A + B >= 1) and (A + D <> 2) and (A + E + F = 2)
                and ((B + C = 0) or (B + C = 2))
                and (C + D = 1) and ((D + E = 0) or (D = 1)) then
              begin
                WriteLnF('A%s被选择去完成任务。',
                  [specialize IfThen<string>(A <> 0, '', '未')]);
                WriteLnF('B%s被选择去完成任务。',
                  [specialize IfThen<string>(B <> 0, '', '未')]);
                WriteLnF('C%s被选择去完成任务。',
                  [specialize IfThen<string>(C <> 0, '', '未')]);
                WriteLnF('D%s被选择去完成任务。',
                  [specialize IfThen<string>(D <> 0, '', '未')]);
                WriteLnF('E%s被选择去完成任务。',
                  [specialize IfThen<string>(E <> 0, '', '未')]);
                WriteLnF('F%s被选择去完成任务。',
                  [specialize IfThen<string>(F <> 0, '', '未')]);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
