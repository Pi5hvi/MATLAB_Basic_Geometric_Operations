%Obtaining and reading Equation of Circle
i=0;
while i<1;
  prompt='\n Please define the form of input for Circle: \n 1)Centre and Radius \n 2)Implicit (ax^2+ay^2+bx+cy+d=0) \n 3)Explicit (y=sqrt[-x^2+ax+by]+c) \n';
  j=input(prompt);
    if j==1;
    prompt='input X-coordinate of centre:';
    o=input(prompt);
    prompt='input Y-coordinate of centre:';
    s=input(prompt);
    prompt='input radius of circle:';
    r=input(prompt);
    i=2;
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
            o=-cb/(2*ca);
            s=-cc/(2*ca);
            r=sqrt(-(cd/ca)+(o^2)+(s^2));
            i=2;
            fprintf 'Success!!\n';
           else if j==3;%conversion of explicit to centre radius
                prompt='input value of a:';
                ca=input(prompt);
                prompt='input value of b:';
                cb=input(prompt);
                prompt='input value of c:';
                cc=input(prompt);
                s=cc;
                o=ca/2;
                r=sqrt(cb+(o^2));
                i=2;
                fprintf 'Success!!\n';
               else i=0;
                   fprintf '\nINVALID INPUT\n';
               end
         end
    end
end
    %Obtaining the user defined point on circle
i=2;
while i>1;
prompt='Input X coordinate of Point on Circle:';
ca=input(prompt);
prompt='Input Y coordinate of Point on Circle:';
cb=input(prompt);
if (ca-o)^2+(cb-s)^2==r^2;%to check that point lies on the circle
    th=atan((cb-s)/(ca-o));
    prompt='Input arc-length from the given Point on Circle:';%obtain arc-length
    cd=input(prompt);
    th1=(cd/r)+th;
    if abs(cos(th1))==1;%for pi/2 and pi
        fprintf ('\nThe Point at an arclength=%d from point (%d,%d) on the circle is:\n',cd,ca,cb);
        x1=r*cos(th1)+o;
        y1=r*sin(th1)+s;
        fprintf ('\nPoint A:(%d,%d)',x1,y1);
        i=-10;%Exit loop
    else
        fprintf ('\nThe Points at an arclength=%d from point (%d,%d) on the circle are:\n',cd,ca,cb);
        x1=r*cos(th1)+o;
        x2=r*cos(-th1)+o;
        y1=r*sin(th1)+s;
        y2=r*sin(-th1)+s;
        fprintf ('\nPoint A:(%d,%d)',x1,y1);
        fprintf ('\nPoint B:(%d,%d)\n',x2,y2);
        i=-10;%Exit loop
    end
else
    fprintf ('\nPoint (%d,%d) does not lie on the given circle. Please check input.\n',ca,cb);
end
end