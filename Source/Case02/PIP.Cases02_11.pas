unit PIP.Cases02_11;

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
  Count, x, y, z: integer;
begin
  Count := 1;
  WriteLn('可能的兑换方法如下：');

  x := 0;
  while x <= 50 do
  begin
    y := 0;
    while y <= 50 - x do
    begin
      for z := 0 to 50 - x - y do
      begin
        if x + y + z = 50 then
        begin
          if Count mod 3 <> 0 then
          begin
            WriteF('%d: 10*%d+5*%d+1*%d'#09, [Count, x div 10, y div 5, z]);
            Count += 1;
          end
          else
          begin
            WriteLnF('%d: 10*%d+5*%d+1*%d', [Count, x div 10, y div 5, z]);
            Count += 1;
          end;
        end;
      end;

      y += 5;
    end;

    x += 10;
  end;

  WriteLn;
end;

end.
