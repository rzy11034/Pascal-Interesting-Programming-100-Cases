unit PIP.Cases11_06;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs;

type
  TFrm_Cases11_06 = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    procedure __Circle(x, y, r: integer);
  public

  end;

var
  Frm_Cases11_06: TFrm_Cases11_06;

procedure Main;

implementation

procedure Main;
var
  frm: TFrm_Cases11_06;
begin
  frm := TFrm_Cases11_06.Create(nil);
  try
    Application.Initialize;
    frm.ShowModal;
    Application.Run;
  finally
    frm.Free;
  end;
end;

{$R *.frm}

{ TFrm_Cases11_06 }

procedure TFrm_Cases11_06.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Cases11_06.FormCreate(Sender: TObject);
begin
  Self.Height := 640;
  Self.Width := 800;
  Self.Color := clBlack;
  BorderStyle := TFormBorderStyle.bsDialog;
  Self.Position := TPosition.poScreenCenter;
end;

procedure TFrm_Cases11_06.FormPaint(Sender: TObject);
begin
  with Self.Canvas do
  begin
    Brush.Color := clWhite;
    Clear;
    Pen.Color := clGreen;
    __Circle(240, 300, 60);
    Pen.Color := clBlue;
    __Circle(360, 300, 60);
  end;
end;

procedure TFrm_Cases11_06.__Circle(x, y, r: integer);
var
  x1, y1, x2, y2: integer;
begin
  x1 := x - r;
  y1 := y - r;
  x2 := x + r;
  y2 := y + r;
  Canvas.Ellipse(x1, y1, x2, y2);
end;

end.
