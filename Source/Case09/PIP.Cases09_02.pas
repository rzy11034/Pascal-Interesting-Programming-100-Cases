unit PIP.Cases09_02;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function Fish(n, x: integer): integer;
begin
  if (x - 1) mod 5 = 0 then
  begin
    if n = 1 then
      Exit(1)
    else
      Exit(Fish(n - 1, (x - 1) div 5 * 4));
  end;

  Result := 0;
end;

procedure Main;
var
  i, flag, x: integer;
begin
  i := 0;
  flag := 0;

  repeat
    i += 1;
    x := i * 5 + 1;

    if Fish(5, x) <> 0 then
    begin
      flag := 1;
      WriteLnF('五个人合伙捕到的鱼总数为%d。', [x]);
    end;

  until flag = 1;
end;

end.
