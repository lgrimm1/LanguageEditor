unit UnitDelete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormDelete = class(TForm)
    Label1: TLabel;
    BDelete: TButton;
    BBack: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDelete: TFormDelete;

implementation

{$R *.dfm}

/////////////////////////////////////////////////
procedure TFormDelete.FormCreate(Sender: TObject);
begin
FormDelete.Caption:='Confirm';
BDelete.Caption:='&Delete!';
BDelete.ModalResult:=1;
BBack.Caption:='&Cancel';
BBack.ModalResult:=2;
end;

end.
