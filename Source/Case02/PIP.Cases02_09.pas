unit PIP.Cases02_09;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  sum: double;
  i: integer;
begin
  sum := 0;

  for i := 1 to 64 do
    sum += Power(2, i - 1);

  WriteLnF('国王总共需要赏赐给宰相的麦子数为：%f', [sum]);
end;

end.
