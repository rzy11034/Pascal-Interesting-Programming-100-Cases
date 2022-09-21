unit PIP.Cases06_03;

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
  x, y, z: boolean;
begin
  for x := false to true do
  begin
    for y := false to true do
    begin
      for z := false to true do
      begin
        if ((x and not y) or (not x and y))
          and ((y and not z) or (not y and z))
          and ((((z and x = false) and y) = false) or (Ord(not (z) and x) + Ord(y) <> 0)) then
        begin
          WriteLnF('张三说的是 %s 。', [specialize IfThen<string>(x, '真话', '假话')]);
          WriteLnF('李四说的是 %s 。', [specialize IfThen<string>(y, '真话', '假话')]);
          WriteLnF('王五说的是 %s 。', [specialize IfThen<string>(z, '真话', '假话')]);

          Exit;
        end;
      end;
    end;
  end;
end;

end.
