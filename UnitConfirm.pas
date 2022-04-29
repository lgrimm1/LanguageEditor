unit UnitConfirm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormConfirm = class(TForm)
    Label1: TLabel;
    BYes: TButton;
    BNo: TButton;
    BBack: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfirm: TFormConfirm;

implementation

{$R *.dfm}

/////////////////////////////////////////////////
procedure TFormConfirm.FormCreate(Sender: TObject);
begin
FormConfirm.Caption:='Save before Exit';
BYes.Caption:='&Save and Exit';
BYes.ModalResult:=1;
BNo.Caption:='Just E&xit';
BNo.ModalResult:=2;
BBack.Caption:='&Cancel';
BBack.ModalResult:=3;
end;

end.
