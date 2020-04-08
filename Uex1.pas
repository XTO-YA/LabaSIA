{Из Trie-дерева удалить все слова, начинающиеся с заданной
последовательности букв}
unit Uex1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,UTrieTree, ComCtrls;

type
  TForm1 = class(TForm)
    inputPnl: TGroupBox;
    btnPanel: TPanel;
    memoPnl: TPanel;
    inputMemo: TMemo;
    DeleteBtn: TButton;
    resulPnl: TGroupBox;
    ResTreeView: TTreeView;
    WrdEdit: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    SourceTreeView: TTreeView;
    lbl3: TLabel;
    Label1: TLabel;
    lbl4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationIdle(Sender: TObject; var done: Boolean);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure WrdEditKeyPress(Sender: TObject; var Key: Char);
    procedure DeleteBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnIdle:=ApplicationIdle;
end;

procedure  TForm1.ApplicationIdle(Sender: TObject; var done: Boolean);
var isNotEmpty: Boolean;
begin
  isNotEmpty:=(inputMemo.Text <> '') or (WrdEdit.Text <> '');
  DeleteBtn.Enabled:=isNotEmpty;
end;

procedure TForm1.edtInputKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in['a'..'z']) and (Ord(Key)>32) then
     Key:=#0;
end;

procedure TForm1.WrdEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['a'..'z']) and (Ord(Key)<>8) then
    Key:=#0;
end;

Function NextWord(str:string; var i:integer):string;
var
  len:integer;
begin
  len:=length(str);
  while (i<=len) and (str[i]=' ') do
    inc(i);
  result:='';
  while (i<=len) and (str[i]<>' ') do
    begin
      result:=result+str[i];
      inc(i);
    end;
end;

procedure TForm1.DeleteBtnClick(Sender: TObject);
var
  i,k:integer;
  root:TTrieTree;
  s,wrd:string;
begin
  root:=TTrieTree.Create;
  for i:=0 to inputMemo.lines.Count-1 do
    begin
      k:=1;
      if trim(inputMemo.Lines[i])<>'' then
        while k<=length(inputMemo.Lines[i]) do
            root.push(NextWord(inputMemo.Lines[i],k));
    end;
  if not(root.IsEmpty) then
    begin
      root.print(SourceTreeView);
      wrd:=WrdEdit.Text;
      if wrd<>'' then
        begin
          i:=root.delete(wrd);
          str(i,s);
        end;
    end;
  root.print(ResTreeView);
end;

end.
