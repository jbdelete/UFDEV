function [colCount,colAry, dsq, rsq] = CountCollisions(obj)
    
    collisionCount = 0;
colary = [];
    for ii=1:obj.ptot-1
        
        for jj=1:obj.ptot-1
            if 0
            if(obj.p(jj).rnum ~= obj.p(ii).rnum)
                fprintf('Diff rod %d,%d\r\n',obj.p(ii).rnum,obj.p(jj).rnum);
            end
            end
            if (jj~=ii && obj.p(jj).rnum ~= obj.p(ii).rnum)
                 if(ii == 3 && jj == 8)
                1;
                end
                  % Get target position
                xT = obj.p(jj).vecp(1);
                yT = obj.p(jj).vecp(2);
                zT = obj.p(jj).vecp(3);
            
                % Get source position
                xP = obj.p(ii).vecp(1);
                yP = obj.p(ii).vecp(2);
                zP = obj.p(ii).vecp(3);
            
                % Get distance between centers
                dsq = (((xP-xT)^2+(yP-yT)^2+(zP-zT)^2));
               
                % Get combined radii
                rsq = ((obj.p(ii).radius+obj.p(jj).radius)^2);
                
                % if distance is less than cobined radii there is a collision.
                if (dsq<rsq)
                    obj.p(jj).cflg = 1;
                    obj.p(ii).cflg = 1;
                    colary(end+1,:) = [ii,jj]
                    collisionCount= collisionCount+1;
                    %if mod(ii,1000) == 0
                        
                       fprintf("ColNum %d, FRM:%d,TO:%d dsq=%0.3f rsq = %0.3f \r\n",...
                           collisionCount,ii,jj,dsq,rsq);
                       fprintf("-->FRM:%d,xt=%0.3f,yt=%0.3f,xt=%0.3f\r\n",...
                           ii,xT,yT,zT);
                       fprintf("-->TO:%d,xp=%0.3f,yp=%0.3f,xp=%0.3f\r\n",...
                           ii,xP,yP,zP);

                    %end
                    colary(collisionCount,1) = ii;
                    colary(collisionCount,2) = jj;
                end
            end
        end
    end
    colAry = colary;
    colCount=collisionCount;
end