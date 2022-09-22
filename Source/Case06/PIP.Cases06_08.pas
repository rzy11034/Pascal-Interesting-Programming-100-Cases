unit PIP.Cases06_08;

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
  a, b, c, d, e: integer;
begin
  for a := 0 to 1 do
  begin
    for b := 0 to 1 do
    begin
      for c := 0 to 1 do
      begin
        for d := 0 to 1 do
        begin
          for e := 0 to 1 do
          begin
            if ((a <> 0) and (b + c + d + e = 3) or not (a <> 0) and (b + c + d + e <> 3))
              and ((b <> 0) and (a + c + d + e = 0) or not (b <> 0) and (a + c + d + e <> 0))
              and ((c <> 0) and (a + b + d + e = 1) or not (c <> 0) and (a + b + d + e <> 1))
              and ((d <> 0) and (a + b + c + e = 4) or not (d <> 0) and (a + b + c + e <> 4)) then
            begin
              WriteLnF('A额头上的贴纸是%s色的。',
                [specialize IfThen<string>(a.ToBoolean, '白', '黑')]);
              WriteLnF('B额头上的贴纸是%s色的。',
                [specialize IfThen<string>(b.ToBoolean, '白', '黑')]);
              WriteLnF('C额头上的贴纸是%s色的。',
                [specialize IfThen<string>(c.ToBoolean, '白', '黑')]);
              WriteLnF('D额头上的贴纸是%s色的。',
                [specialize IfThen<string>(d.ToBoolean, '白', '黑')]);
              WriteLnF('E额头上的贴纸是%s色的。',
                [specialize IfThen<string>(e.ToBoolean, '白', '黑')]);
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
