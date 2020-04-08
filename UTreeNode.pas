unit UTreeNode;

interface
uses
  SysUtils,
  ComCtrls;

Type
  TIndex = 'a'..'z';
  PtrTrieTree = ^TNode;
  TNode = class
  private
    Ptrs: array [TIndex] of TNode;
    eow: boolean;
  public
  Constructor Create;
  procedure Push (s: string; i:byte);
  procedure delete (var count:Integer;var Arr:array of string; s:string;wrd:string);
  function IsEmpty:boolean;
  procedure SetEow(ok:boolean);
  procedure print(treeView: TTreeView; parent:TTreeNode);
  function pop(var wrd:string):Boolean;
  destructor Destroy; override;
end;

implementation

constructor TNode.Create;
var ch:char;
begin
  inherited Create;
  eow:=false;
  for ch:=low(TIndex) to High(TIndex) do
    Ptrs[ch]:=nil;
end;

Function TNode.IsEmpty: boolean;
var chr:char;
begin
  result:=true;
  chr:=Low(TIndex);
  repeat
    result:=Ptrs[chr]=nil;
    inc(chr);
  until (not result) or (chr = High(TIndex))
end;

procedure TNode.SetEow(ok:Boolean);
begin
  eow:=ok;
end;

procedure TNode.Push (s: string; i:byte);
begin
  if ptrs[s[i]] = nil then
    ptrs[s[i]] := TNode.Create;
  if length(s)<=i then
     ptrs[s[i]].SetEow(true)
  else
    Ptrs[S[i]].Push(s,i+1);
end;

procedure TNode.print(treeView: TTreeView; parent:TTreeNode);
var
  i:Char;
  newParent: TTreeNode;
begin
  for i:= Low(TIndex) to high(TIndex) do
    if ptrs[i]<>nil then
      begin
        newParent := treeView.Items.AddChild(parent, i);
        ptrs[i].print(treeView, newParent);
      end;
end;

procedure TNode.delete (var count:Integer;var Arr:array of string; s:string;wrd:string);
var
  ch: TIndex;
begin
  if eow then
    begin
      if (length(wrd) <= length(s)) then
        if  (copy(s,1,length(wrd))=wrd) then
          begin
            Arr[count]:=s;
            Inc(count);
          end;
    end;
  for ch:=Low(TIndex) to High(TIndex) do
    if Ptrs[ch]<>nil then
      Ptrs[ch].delete(count,arr,s+ch,wrd)
end;

function TNode.pop(var wrd: string): Boolean;
var
  f: TIndex;
begin
  if wrd = '' then
    begin
      Result:= eow;
      eow:= False;
    end
  else
    begin
      f:= wrd[1];
      System.Delete(wrd, 1, 1);
      Result:= (ptrs[f] <> nil) and (ptrs[f].pop(wrd));
      if Result and ptrs[f].IsEmpty then
        FreeAndNil(ptrs[f]);
    end;
end;

Destructor TNode.Destroy;
var ch: TIndex;
begin
  for ch:=low(TIndex) to High(TIndex) do
    if Ptrs[ch] <> nil then
      Ptrs[ch].Destroy;
  inherited Destroy;
end;

end.
