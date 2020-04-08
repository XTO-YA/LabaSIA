program Ex_1;

uses
  Forms,
  Uex1 in 'Uex1.pas' {Form1},
  UTreeNode in 'UTreeNode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
