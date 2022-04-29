unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, XPMan;

type
  TFormMain = class(TForm)
    LVText: TListView;
    BAdd: TButton;
    BDelete: TButton;
    BLoad: TButton;
    BSave: TButton;
    OD: TOpenDialog;
    GBStats: TGroupBox;
    BSort: TButton;
    BUncheck: TButton;
    GBRecord: TGroupBox;
    BModify: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EForm: TEdit;
    EUk: TEdit;
    EHun: TEdit;
    BClear: TButton;
    LUkSize: TLabel;
    LHunSize: TLabel;
    BExit: TButton;
    SD: TSaveDialog;
    Label4: TLabel;
    ELines: TEdit;
    Label6: TLabel;
    ERow: TEdit;
    MAbout: TMemo;
    XPManifest1: TXPManifest;
    Label5: TLabel;
    EControl: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure BUncheckClick(Sender: TObject);
    procedure BSortClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure EFormChange(Sender: TObject);
    procedure EUkChange(Sender: TObject);
    procedure EHunChange(Sender: TObject);
    procedure BClearClick(Sender: TObject);
    procedure BModifyClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BExitClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EFormKeyPress(Sender: TObject; var Key: Char);
    procedure EUkKeyPress(Sender: TObject; var Key: Char);
    procedure EHunKeyPress(Sender: TObject; var Key: Char);
    procedure LVTextSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure EControlChange(Sender: TObject);
    procedure EControlKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses UnitDelete, UnitConfirm;

const xorbase = 'LanguageEditor';
      fileext = '.lef';

var t : TListItem;
    xorchar : byte;
    sl : TStringList;

{$R *.dfm}

/////////////////////////////////////////////////
procedure SetStats;
var s : string;
begin
with FormMain do
begin
Str(LVText.Items.Count,s);
ELines.Text:=s;
if LVText.SelCount > 0
then begin
     Str(LVText.ItemIndex,s);
     ERow.Text:=s;
     end
else begin
     ERow.Text:='-';
     end;
end;
end;

/////////////////////////////////////////////////
function Coding(s : string) : string;
var i : byte;
begin
for i:=1 to Length(s) do
    begin
    s[i]:=Chr(Ord(s[i]) xor xorchar);
    end;
Result:=s;
end;

/////////////////////////////////////////////////
function Open : boolean;
var success : boolean;
    i : integer;
    s : string;
begin
with FormMain do
begin
success:=true;
if not(OD.Execute)
then begin
     success:=false;
     end;
if success
then begin
     LVText.Clear;
     sl.Clear;
     sl.LoadFromFile(OD.FileName);
     for i:=0 to sl.Count-1 do
         begin
         s:=sl.Strings[i];
         s:=Coding(s);
         t:=LVText.Items.Add;
         t.Caption:=Copy(s,1,Pos(#255,s)-1);
         Delete(s,1,Pos(#255,s));
         t.SubItems.Add(Copy(s,1,Pos(#254,s)-1));
         Delete(s,1,Pos(#254,s));
         t.SubItems.Add(Copy(s,1,Pos(#253,s)-1));
         Delete(s,1,Pos(#253,s));
         t.SubItems.Add(Copy(s,1,Length(s)));
         end;
     end;
end;
Result:=success;
end;

/////////////////////////////////////////////////
function Save : boolean;
var i : integer;
    success : boolean;
    s : string;
begin
with FormMain do
begin
success:=true;
if OD.FileName <> ''
then begin
     SD.FileName:=OD.FileName;
     end;
if not(SD.Execute)
then begin
     success:=false;
     end;
if success
then begin
     sl.Clear;
     for i:=0 to LVText.Items.Count-1 do
         begin
         s:=LVText.Items[i].Caption+#255+LVText.Items[i].SubItems[0]+#254+LVText.Items[i].SubItems[1]+#253+LVText.Items[i].SubItems[2];
         s:=Coding(s);
         sl.Add(s);
         end;
     if not((Pos(fileext,SD.FileName) > 0) and (Length(SD.FileName)-Pos(fileext,SD.FileName)+1 = Length(fileext)))
     then begin
          SD.FileName:=SD.FileName+fileext;
          end;
     sl.SaveToFile(SD.FileName);
     end;
end;
Result:=success;
end;

/////////////////////////////////////////////////
procedure UnCheckAll;
var i : integer;
begin
with FormMain do
begin
for i:=0 to LVText.Items.Count-1 do
    begin
    LVText.Items[i].Checked:=false;
    end;
end;
end;

/////////////////////////////////////////////////
procedure CheckButtons;
begin
with FormMain do
begin
if (EForm.Text <> '') and (EControl.Text <> '') and (EUk.Text <> '')
then begin
     BAdd.Enabled:=true;
     end
else begin
     BAdd.Enabled:=false;
     end;
if (LVText.SelCount > 0) and (EForm.Text <> '') and (EControl.Text <> '') and (EUk.Text <> '') and ((LVText.Selected.Caption <> EForm.Text) or (LVText.Selected.SubItems[0] <> EControl.Text) or (LVText.Selected.SubItems[1] <> EUk.Text) or (LVText.Selected.SubItems[2] <> EHun.Text))
then begin
     BModify.Enabled:=true;
     end
else begin
     BModify.Enabled:=false;
     end;
if (EForm.Text <> '') or (EControl.Text <> '') or (EUk.Text <> '') or (EHun.Text <> '')
then begin
     BClear.Enabled:=true;
     end
else begin
     BClear.Enabled:=false;
     end;
end;
end;

/////////////////////////////////////////////////
procedure TFormMain.FormCreate(Sender: TObject);
var i : byte;
begin
FormMain.Caption:='Language Editor';
GBStats.Caption:=' Information ';

GBRecord.Caption:=' Data ';
BAdd.Caption:='&Add Data to List';
BModify.Caption:='&Modify Selected Data';
BClear.Caption:='&Clear Data Fields';

BDelete.Caption:='&Delete Checked Data...';
BSort.Caption:='S&ort List by Form name';
BUncheck.Caption:='&Uncheck all Rows';

BLoad.Caption:='&Load Language File...';
BSave.Caption:='&Save Language File...';
BExit.Caption:='E&xit from Language Editor';

SetStats;
MAbout.Clear;
MAbout.Lines.Add('Creator: Grimm László, 2011.');
MAbout.Lines.Add('Language Editor was created for managing language localization files of specific programs created by the owner.');
OD.Title:='Open Language Editor File...';
OD.FileName:='';
SD.Title:='Save Language Editor File as...';
SD.FileName:='';
EForm.Clear;
EControl.Clear;
EUk.Clear;
EHun.Clear;
//CheckButtons;
BSave.Enabled:=false;
BDelete.Enabled:=false;
BSort.Enabled:=false;
BUncheck.Enabled:=false;
xorchar:=Ord(xorbase[1]);
for i:=2 to Length(xorbase) do
    begin
    xorchar:=xorchar xor Ord(xorbase[i]);
    end;
sl:=TStringList.Create;
end;

/////////////////////////////////////////////////
procedure TFormMain.BAddClick(Sender: TObject);
begin
t:=LVText.Items.Add;
t.Caption:=EForm.Text;
t.SubItems.Add(EControl.Text);
t.SubItems.Add(EUk.Text);
t.SubItems.Add(EHun.Text);
EControl.Clear;
EUk.Clear;
EHun.Clear;
//CheckButtons;
if LVText.Items.Count = 1
then begin
     BDelete.Enabled:=true;
     BSort.Enabled:=true;
     BUncheck.Enabled:=true;
     end;
BSave.Enabled:=true;
SetStats;
EForm.SetFocus;
end;

/////////////////////////////////////////////////
procedure TFormMain.BUncheckClick(Sender: TObject);
begin
UnCheckAll;
end;

/////////////////////////////////////////////////
procedure TFormMain.BSortClick(Sender: TObject);
begin
EForm.Clear;
EControl.Clear;
EUk.Clear;
EHun.Clear;
//CheckButtons;
UnCheckAll;
LVText.SortType:=stText;
LVText.SortType:=stNone;
BSave.Enabled:=true;
SetStats;
end;

/////////////////////////////////////////////////
procedure TFormMain.BDeleteClick(Sender: TObject);
var i : integer;
begin
if FormDelete.ShowModal = 1
then begin
     i:=LVText.Items.Count-1;
     while i > -1 do
           begin
           if LVText.Items[i].Checked
           then begin
                LVText.Items[i].Delete;
                end;
           i:=i-1;
           end;
     EControl.Clear;
     EUk.Clear;
     EHun.Clear;
     //CheckButtons;
     BDelete.Enabled:=LVText.Items.Count > 0;
     BSort.Enabled:=LVText.Items.Count > 0;
     BUncheck.Enabled:=LVText.Items.Count > 0;
     BSave.Enabled:=true;
     SetStats;
     end;
end;

/////////////////////////////////////////////////
procedure TFormMain.EFormChange(Sender: TObject);
begin
CheckButtons;
end;

/////////////////////////////////////////////////
function CheckLength(source : string) : string;
var s : string;
begin
Str(Length(source),s);
Result:='Chars: '+s;
end;

/////////////////////////////////////////////////
procedure TFormMain.EUkChange(Sender: TObject);
begin
LUkSize.Caption:=CheckLength(EUk.Text);
CheckButtons;
end;

/////////////////////////////////////////////////
procedure TFormMain.EHunChange(Sender: TObject);
begin
LHunSize.Caption:=CheckLength(EHun.Text);
CheckButtons;
end;

/////////////////////////////////////////////////
procedure TFormMain.BClearClick(Sender: TObject);
begin
EForm.Clear;
EControl.Clear;
EUk.Clear;
EHun.Clear;
//CheckButtons;
EForm.SetFocus;
end;

/////////////////////////////////////////////////
procedure TFormMain.BModifyClick(Sender: TObject);
begin
t:=LVText.Selected;
t.Caption:=EForm.Text;
t.SubItems[0]:=EControl.Text;
t.SubItems[1]:=EUk.Text;
t.SubItems[2]:=EHun.Text;
EControl.Clear;
EUk.Clear;
EHun.Clear;
//CheckButtons;
BSave.Enabled:=true;
EForm.SetFocus;
end;

/////////////////////////////////////////////////
procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var c : boolean;
    sm : integer;
begin
c:=true;
if BSave.Enabled
then begin
     sm:=FormConfirm.ShowModal;
     case sm of
          1 : begin //Save and Exit
              if not(Save)
              then begin
                   c:=false;
                   end;
              end;
          2 : begin //Exit without Save
              end;
          3 : begin //Cancel
              c:=false;
              end;
     end;
     end
else begin
     c:=true;
     end;
CanClose:=c;
end;

/////////////////////////////////////////////////
procedure TFormMain.BExitClick(Sender: TObject);
begin
FormMain.Close;
end;

/////////////////////////////////////////////////
procedure TFormMain.BSaveClick(Sender: TObject);
begin
if Save
then begin
     BSave.Enabled:=false;
     end;
end;

/////////////////////////////////////////////////
procedure TFormMain.BLoadClick(Sender: TObject);
begin
if Open
then begin
     CheckButtons;
     if LVText.Items.Count > 0
     then begin
          BDelete.Enabled:=true;
          BSort.Enabled:=true;
          BUncheck.Enabled:=true;
          end;
     BSave.Enabled:=false;
     SetStats;
     end;
end;

/////////////////////////////////////////////////
procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
sl.Free;
end;

/////////////////////////////////////////////////
procedure TFormMain.EFormKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) and (Length(EForm.Text) > 0)
then begin
     EControl.SetFocus;
     end;
end;

/////////////////////////////////////////////////
procedure TFormMain.EUkKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) and (Length(EUk.Text) > 0)
then begin
     EHun.SetFocus;
     end;
end;

/////////////////////////////////////////////////
procedure TFormMain.EHunKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13
then begin
     if (Length(EForm.Text) > 0) and (Length(EControl.Text) > 0) and (Length(EUk.Text) > 0) and (Length(EHun.Text) > 0)
     then begin
          t:=LVText.Items.Add;
          t.Caption:=EForm.Text;
          t.SubItems.Add(EControl.Text);
          t.SubItems.Add(EUk.Text);
          t.SubItems.Add(EHun.Text);
          EControl.Clear;
          EUk.Clear;
          EHun.Clear;
          //CheckButtons;
          if LVText.Items.Count = 1
          then begin
               BDelete.Enabled:=true;
               BSort.Enabled:=true;
               BUncheck.Enabled:=true;
               end;
          BSave.Enabled:=true;
          SetStats;
          end;
     EForm.SetFocus;
     end;
end;

/////////////////////////////////////////////////
procedure TFormMain.LVTextSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if LVText.SelCount > 0
then begin
     t:=LVText.Selected;
     EForm.Text:=t.Caption;
     EControl.Text:=t.SubItems[0];
     EUk.Text:=t.SubItems[1];
     EHun.Text:=t.SubItems[2];
     //CheckButtons;
     SetStats;
     end;
end;

/////////////////////////////////////////////////
procedure TFormMain.EControlChange(Sender: TObject);
begin
CheckButtons;
end;

/////////////////////////////////////////////////
procedure TFormMain.EControlKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) and (Length(EControl.Text) > 0)
then begin
     EUk.SetFocus;
     end;
end;

end.
