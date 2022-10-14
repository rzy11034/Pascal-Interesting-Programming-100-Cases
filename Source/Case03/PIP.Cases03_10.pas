unit PIP.Cases03_10;

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
  i, j, k, Count: integer;
begin
  Count := 0;

  for i := 1 to 4 do
  begin
    for j := 1 to 4 do
    begin
      for k := 1 to 4 do
      begin
        if (i <> k) and (i <> j) and (j <> k) then
        begin
          Count += 1;
          WriteF('%d%d%d ', [i, j, k]);

          if Count mod 8 = 0 then
            WriteLn;
        end;
      end;
    end;
  end;

  WriteLnF('The total number is %d.', [Count]);
end;

end.
