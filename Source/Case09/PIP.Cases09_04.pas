unit PIP.Cases09_04;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function A(n: integer): integer;
begin
  if n >= 9 then
    Result := 1
  else
    Result := 2 * (A(n + 1) + 1);
end;

procedure Main;
begin
  WriteLnF('猴子第一天总共摘了%d个桃子。', [A(0)]);
end;

end.
