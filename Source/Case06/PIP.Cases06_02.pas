unit PIP.Cases06_02;

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
  x, y, z: char;
begin
  for x := 'A' to 'C' do
  begin
    for y := 'A' to 'C' do
    begin
      for z := 'A' to 'C' do
      begin
        if (x <> 'A') and (x <> 'C') and (z <> 'C') and (x <> y)
          and (x <> z) and (y <> z) then
        begin
          WriteLnF('新娘 X 与新郎 %s 结婚。', [x]);
          WriteLnF('新娘 Y 与新郎 %s 结婚。', [y]);
          WriteLnF('新娘 Z 与新郎 %s 结婚。', [z]);
        end;
      end;
    end;
  end;
end;

end.
