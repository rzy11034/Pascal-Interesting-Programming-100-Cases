unit PIP.Cases01_07;

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
  money: double;
  i: integer;
begin
  money := 0.0;

  for i := 0 to 4 do
  begin
    money := (money + 1000) / (1 + 0.0063 * 12);
  end;

  WriteLnF('应存入的钱数为：%0.2f', [money]);
end;

end.
