unit PIP.Cases10_05;

{$mode ObjFPC}{$H+}
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
  n: integer;
begin
  n := 1001;
  while n <= 1999 do
  begin
    WriteF('%d:', [n]);
    WriteF('(%1d*%1d-1)/8', [n, n]);
    WriteF('=%1d', [(n * n - 1) div 8]);
    WriteLnF('+%1d', [(n * n - 1) mod 8]);
    n += 2;
  end;
end;

end.
