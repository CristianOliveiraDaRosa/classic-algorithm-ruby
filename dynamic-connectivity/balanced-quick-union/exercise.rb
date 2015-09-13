require_relative 'balanced_quick_union'

qu = Balanced::QuickUnion.new 10
qu.union 8,0
qu.union 3,5
qu.union 1,3
qu.union 9,2
qu.union 3,4
qu.union 8,9
qu.union 1,7
qu.union 1,6
qu.union 0,6
p qu.elements.join(' ')
