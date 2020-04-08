unit UTrieTree;

interface

uses
  Windows,
  SysUtils,
  UTreeNode,
  ComCtrls;
  
Type
  TTrieTree = class
    private
      FTree: TNode;
    public
      Constructor Create;
      function IsEmpty: boolean;
      procedure Push (s: string);
      function delete(wrd:string):integer;
      procedure Clear;
      procedure Print(treeView:TTreeView);
      procedure pop (s:string);
      destructor Destroy;
    end;

implementation
const
  N=100;

constructor TTrieTree.Create;
begin
  Inherited Create;
  FTree:=TNode.Create;
end;

function TTrieTree.IsEmpty: boolean;
begin
  result:=Ftree.IsEmpty;
end;

procedure TTrieTree.Push(s: string);
begin
  if Ftree= nil then
    FTree := TNode.Create();
  if length(s)>0 then
    FTree.Push(s,1);
end;

function TTrieTree.delete(wrd:string):integer;
var
  Arr:array[0..N] of string;
  i,count:Integer;
begin
  count:=0;
  FTree.delete(count,Arr,'',wrd);
  for i:=0 to count-1 do
    pop(arr[i]);
end;

procedure TTrieTree.print(treeView:TTreeView);
begin
  treeView.Items.Clear;
  Ftree.print(treeView, nil);
  treeView.FullExpand;
end;

procedure TTrieTree.pop(s:string);
begin
  if Length(s)>0 then
    FTree.pop(s);
end;

procedure TTrieTree.Clear;
begin
  if not IsEmpty then
    FTree.Destroy;
end;

destructor TTrieTree.Destroy;
begin
  if FTree <> nil then
    Clear;
  inherited Destroy;
end;

end.
