unit PIP.Cases11_07;

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
  TFrm_Cases11_07 = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    procedure __Circle(x, y, r: integer);
  public

  end;

procedure Main;

implementation

uses
  System.UITypes;

procedure Main;
var
  frm: TFrm_Cases11_07;
begin
  frm := TFrm_Cases11_07.Create(nil);
  try
    Application.Initialize;
    frm.ShowModal;
    Application.Run;
  finally
    frm.Free;
  end;
end;

{$R *.frm}

{ TFrm_Cases11_07 }

procedure TFrm_Cases11_07.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Cases11_07.FormCreate(Sender: TObject);
begin
  Self.Height := 640;
  Self.Width := 800;
  Self.Color := clBlack;
  BorderStyle := TFormBorderStyle.bsDialog;
  Self.Position := TPosition.poScreenCenter;
end;

procedure TFrm_Cases11_07.FormPaint(Sender: TObject);
begin
  with Self.Canvas do
  begin
    Brush.Color := TColorRec.LightBlue;
    Clear;
    Brush.Color := TColorRec.Red;
    Pen.Color := Brush.Color;
    __Circle(Width div 2, Height div 2, Height div 3);
  end;
end;

procedure TFrm_Cases11_07.__Circle(x, y, r: integer);
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
