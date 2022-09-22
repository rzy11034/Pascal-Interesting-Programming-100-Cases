unit PIP.Cases06_07;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Example1();
var
  A, B, C: integer;
begin
  for A := 0 to 1 do
  begin
    for B := 0 to 1 do
    begin
      for C := 0 to 1 do
      begin
        if ((A <> 0) and (A + B + C = 2) or not (A <> 0) and (A + B + C <> 2))
          and ((B <> 0) and (A + B + C = 1) or not (B <> 0) and (A + B + C <> 1))
          and ((C <> 0) and (A + B + C = 1) or not (C <> 0) and (A + B + C <> 1)) then
        begin
          WriteLnF('第一个人来自%s',
            [specialize IfThen<string>(A <> 0, '诚实族', '说谎族')]);
          WriteLnF('第二个人来自%s',
            [specialize IfThen<string>(B <> 0, '诚实族', '说谎族')]);
          WriteLnF('第三个人来自%s',
            [specialize IfThen<string>(C <> 0, '诚实族', '说谎族')]);
        end;
      end;
    end;
  end;
end;

procedure Example2();
var
  L, M, R, LL, MM, RR: integer;
begin
  for L := 0 to 1 do
  begin
    for M := 0 to 1 do
    begin
      for R := 0 to 1 do
      begin
        for LL := 0 to 1 do
        begin
          for MM := 0 to 1 do
          begin
            for RR := 0 to 1 do
            begin
              if ((L <> 0) and not (LL <> 0) and (M <> 0) and not (MM <> 0) or not (L <> 0)) and not (M <> 0)
                and not (M <> 0) and ((R <> 0) and not (M <> 0) and not (MM <> 0) or ((RR <> 0) and not (R <> 0))
                or (not (R <> 0) and not (RR <> 0) and ((M <> 0) or (MM <> 0))) and (L + LL <> 2) and (M + MM <> 2)
                and (R + RR <> 2) and (L + M + R = 1) and (LL + MM + RR = 1)) then
              begin
                WriteLnF('第一个人来自%s', [specialize IfThen<string>(LL.ToBoolean, '两面族',
                  specialize IfThen<string>(L.ToBoolean, '诚实族', '说谎族'))]);
                WriteLnF('第二个人来自%s', [specialize IfThen<string>(MM.ToBoolean, '两面族',
                  specialize IfThen<string>(M.ToBoolean, '诚实族', '说谎族'))]);
                WriteLnF('第三个人来自%s', [specialize IfThen<string>(RR.ToBoolean, '两面族',
                  specialize IfThen<string>(R.ToBoolean, '诚实族', '说谎族'))]);

                Exit;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Main;
begin
  Example1;
  DrawLineBlockEnd;
  Example2;
end;

end.
