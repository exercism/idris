module Satellite

public export
data Tree : Type where
        Leaf : Tree
        Branch : Tree -> Char -> Tree -> Tree

export
treeFromTraversals : List Char -> List Char -> Maybe Tree
treeFromTraversals preorder inorder = ?treeFromTraversals_rhs
