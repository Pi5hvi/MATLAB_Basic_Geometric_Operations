%Choose number of circles to input
prompt='Input number of circles:';
n=input(prompt);
%Program to store data on each circle input
i=0;
while i<n;
    i=i+1;
  %Choosing form of input
  prompt='\n Please define the form of input: \n 1)Centre and Radius \n 2)Implicit (ax^2+ay^2+bx+cy+d=0) \n 3)Explicit (y=sqrt[-x^2+ax+by]+c) \n';
  j=input(prompt);
    if j==1;
    prompt='input X-coordinate of centre:';
    o(i)=input(prompt);
    prompt='input Y-coordinate of centre:';
    s(i)=input(prompt);
    prompt='input radius of circle:';
    r(i)=input(prompt);
    fprintf 'Success!!\n';
     else if j==2;%Conversion of implicit to centre radius
            prompt='input value of a:';
            ca=input(prompt);
            prompt='input value of b:';
            cb=input(prompt);
            prompt='input value of c:';
            cc=input(prompt);
            prompt='input value of d:';
            cd=input(prompt);
            o(i)=-cb/(2*ca);
            s(i)=-cc/(2*ca);
            r(i)=sqrt(-(cd/ca)+(o(i)^2)+(s(i)^2));
            fprintf 'Success!!\n';
           else if j==3;%conversion of explicit to centre radius
                prompt='input value of a:';
                ca=input(prompt);
                prompt='input value of b:';
                cb=input(prompt);
                prompt='input value of c:';
                cc=input(prompt);
                s(i)=cc;
                o(i)=ca/2;
                r(i)=sqrt(cb+(o(i)^2));
                fprintf 'Success!!\n';
               else i=i-1;
                   fprintf 'INVALID INPUT\n'
               end
         end
    end
end
for i=1:n;
    fprintf('\n Circle %d: \n Parametric:x=%dcos(Theeta)+%d,y=%dsin(Theeta)+%d \n Implicit: (x-%d)^2+(y-%d)^2-(%d)^2=0 \n Explicit: y=sqrt[%d^2-(x-%d)^2]-%d\n',i,r(i),o(i),r(i),s(i),o(i),s(i),r(i),r(i),o(i),s(i));
end