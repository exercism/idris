module Satellite

public export
data Tree : Type where
        Leaf : Tree
        Branch : Tree -> Char -> Tree -> Tree

data Triple = MkTriple Tree (List Char) (List Char)

startsWith : Maybe Char -> List Char -> Bool
startsWith (Just letter) (first :: rest) = (first == letter)
startsWith _ _ = False

traverse : Maybe Char -> List Char -> List Char -> Maybe Triple
traverse successor preorder inorder = if startsWith successor inorder then Just $ MkTriple Leaf preorder inorder
                                      else step1 preorder
  where
        step3 : Tree -> Char -> Maybe Triple -> Maybe Triple
        step3 l v Nothing = Nothing
        step3 l v (Just (MkTriple r preorder3 inorder3)) = Just $ MkTriple (Branch l v r) preorder3 inorder3
        step2 : Char -> Maybe Triple -> Maybe Triple
        step2 _ Nothing = Nothing
        step2 _ (Just (MkTriple _ _ [])) = Nothing
        step2 v (Just (MkTriple l preorder2 (_ :: []))) = Just $ MkTriple (Branch l v Leaf) preorder2 []
        step2 v (Just (MkTriple l preorder2 (_ :: inorder2))) = step3 l v $ traverse successor preorder2 inorder2
        step1 : List Char -> Maybe Triple
        step1 [] = Nothing
        step1 (v :: preorder1) = step2 v $ traverse (Just v) preorder1 inorder

containsRepeat : List Char -> Bool
containsRepeat [] = False
containsRepeat (first :: rest) = if contains first rest then True
                                 else containsRepeat rest
  where contains : Char -> List Char -> Bool
        contains letter [] = False
        contains letter (first1 :: rest1) = (first1 == letter) || (contains letter rest1)

export
treeFromTraversals : List Char -> List Char -> Maybe Tree
treeFromTraversals preorder inorder = if (length preorder) /= (length inorder) then Nothing
                                      else if (containsRepeat preorder) || (containsRepeat inorder) then Nothing
                                      else if (length preorder) == 0 then Just Leaf
                                      else extractTree $ traverse Nothing preorder inorder
  where extractTree : Maybe Triple -> Maybe Tree
        extractTree Nothing = Nothing
        extractTree (Just (MkTriple tree preorder inorder)) = Just tree
