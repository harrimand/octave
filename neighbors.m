
function [count, done] = neighbors(M)

%{  
  tstart = tic;

  mW =  shift(M, -1, 2);
  mE =  shift(M, 1, 2);
  mN =  shift(M, -1, 1);
  mS =  shift(M, 1, 1);
  mNW = shift(mW, -1, 1);
  mNE = shift(mE, -1, 1);
  mSW = shift(mW, 1, 1);
  mSE = shift(mE, 1, 1);
  
  count = cast(mW + mE + mN + mS + mNW + mNE + mSW + mSE, 'uint8');
  toc(tstart)
%}
%%{
  % tstart = tic;
  m(:,:,8) = shift(M, -1, 2);         %shift Left
  m(:,:,7) = shift(M, 1, 2);          %shift Right
  m(:,:,6) = shift(M, -1, 1);         %shift Up
  m(:,:,5) = shift(M, 1, 1);          %shift Down
  m(:,:,4) = shift(m(:,:,8), -1, 1);  %shift up-left
  m(:,:,3) = shift(m(:,:,7), -1, 1);  %shift up-right
  m(:,:,2) = shift(m(:,:,8), 1, 1);   %shift down-left
  m(:,:,1) = shift(m(:,:,7), 1, 1);   %shift down-right
  
  count = cast(sum(m, 3), 'uint8');
  persistent evencycleCount = count;
  
  persistent evencycle = true;
  persistent done = false;
  evencycle = ~evencycle;
  if evencycle
    if count == evencycleCount
      done = true;
      clear evencycleCount;
      clear evencycle;
    else
      evencycleCount = count;
    end
  end
  
  % toc(tstart)
%%}
  end
  