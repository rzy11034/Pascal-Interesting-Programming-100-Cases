unit PIP.Cases02_04;

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
  red, white, black, Count: integer;
begin
  Count := 0;

  for red := 0 to 3 do
  begin
    for white := 0 to 3 do
    begin
      black := 8 - red - white;

      if black in [1..6] then
      begin
        Count += 1;
        WriteLnF('%2d:  %d  %d  %d', [Count, red, white, black]);
      end;
    end;
  end;
end;

end.
