unit PIP.Cases02_05;

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
  x, i, j: integer;
  flag: boolean;
begin
  flag := false;

  i := 23;
  while flag = false do
  begin
    j := 1; x := i;
    while (j <= 4) and (x >= 11) do
    begin
      if (x + 1) mod (j + 1) = 0 then
      begin
        x -= (x + 1) div (j + 1);
      end
      else
      begin
        x := 0;
        Break;
      end;

      j += 1;
    end;

    if (j = 5) and (x = 11) then
    begin
      WriteLnF('共有%d条金鱼。', [i]);
      flag := true;
    end;

    i += 2;
  end;
end;

end.
