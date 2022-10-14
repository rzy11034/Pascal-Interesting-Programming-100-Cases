unit PIP.Cases08_10;

{$mode objfpc}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

procedure Main;
var
  str: string;
  sb: TStringBuilder;
  i: integer;
begin
  str := 'A1B23CD45';
  WriteLnF('%s', [str]);

  sb := TStringBuilder.Create();
  try
    for i := 0 to str.Length - 1 do
    begin
      if str.Chars[i] in ['0'..'9'] then
      begin
        sb.Append(char('$'));
        sb.Append(str.Chars[i]);
      end
      else
      begin
        sb.Append(str.Chars[i]);
      end;
    end;

    str := sb.ToString;
  finally
    sb.Free;
  end;

  WriteLnF('%s', [str]);
end;

end.
