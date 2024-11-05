from collections import deque

def display(moves):
  for move in moves:
    print(f'From {move[0]} to {move[1]}')

def dfs(n,s,a,t):
  stack=[(n,s,a,t)]
  moves=[]
  while stack:
    n,s,a,t=stack.pop()
    if n==1:
      moves.append((s,t))
    else:
      stack.append((n-1,a,s,t))
      stack.append((1,s,a,t))
      stack.append((n-1,s,t,a))
  display(moves)

def bfs(n):
  queue=deque([(n,'A','C','B',[])])
  fmoves=[]
  while queue:
    n,s,a,t,moves=queue.popleft()
    if n==1:
      fmoves.append((s,t))
    else:
      queue.append((n-1,s,a,t,moves+[(s,a)]))
      queue.append((1,s,t,a,moves+[(s,t)]))
      queue.append((n-1,a,t,s,moves+[(a,t)]))
  display(fmoves)

print("DFS")
dfs(3,'A','B','C')
print("\nBFS")
bfs(3)
