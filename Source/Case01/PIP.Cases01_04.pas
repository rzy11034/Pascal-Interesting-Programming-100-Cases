unit PIP.Cases01_04;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  PIP.Utils;

procedure Main;

implementation

procedure Main;
var
  i, j, k, temp: integer;
  flag: boolean;
begin
  flag := false;

  for i := 0 to 9 do
  begin
    if flag then Break;

    for j := 0 to 9 do
    begin
      if flag then Break;

      if i <> j then
      begin
        k := 1000 * i + 100 * i + 10 * j + j;

        for temp := 31 to 99 do
        begin
          if temp * temp = k then
          begin
            WriteLnF('车牌号为：%d', [k]);

            flag := true;
            Break;
          end;
        end;
      end;
    end;
  end;
end;

end.
