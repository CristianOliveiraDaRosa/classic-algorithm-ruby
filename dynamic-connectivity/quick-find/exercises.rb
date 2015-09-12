require_relative 'quick_find'

qf = QuickFind.new 10

qf.union(2,0)
  .union(0,9)
  .union(9,8)
  .union(5,7)
  .union(5,6)
  .union(1,4)

p qf.elements
