function [x, y, z] = Transform_initi_Key(initikey)
scaledown=1e3;
var1=max(double(initikey(1:end)))/scaledown;
var2=min(double(initikey(1:end)))/scaledown;
Tsize=300;
logistic=zeros(Tsize,1);
logistic(1)=(var1+var2)/2;
r=3.58;
for i=1:Tsize-1
logistic(i+1)=logistic(i)*r*(1-logistic(i));
end
x=max(logistic);
y=min(logistic);
z=mean(logistic);
end