%Obtaining and reading Line:
i=0;
while i<1;
    prompt='\n Please define the form of input for Line: \n 1)Point and vector \n 2)Two Points \n 3)Implicit (ax+by+c=0) \n 4)Explicit (y=mx+c) \n 5+)STOP PROGRAM \n';
    j=input(prompt);
    if j==1;%Point-Vector form
        prompt='Input X coordinate of Point on Line:';
        a=input(prompt);
        prompt='Input Y coordinate of Point on line:';
        b=input(prompt);
        prompt='Input i component of Vector:';
        u=input(prompt);
        prompt='Input j component of vector:';
        v=input(prompt);
        i=2;
        fprintf 'Success!!'\n;
    else if j==2;%Conversion of Two point to point and vector form
        prompt='Input X coordinate of first Point on Line:';
        a=input(prompt);
        prompt='Input Y coordinate of first Point on line:';
        b=input(prompt);
        prompt='Input X coordinate of second Point on Line:';
        d=input(prompt);
        prompt='Input Y coordinate of second Point on Line:';
        e=input(prompt);
        if a==d;%To avoid problem of infinite slope
            u=0;
            v=1;
            i=2;
            fprintf 'Success!!\n';
        else
            u=1;
            v=(e-b)/(d-a);
            i=2;
            fprintf 'Success!!\n';
        end
        else if j==3;%Conversion of Implicit to Point and Vector form
                prompt='Input value of a:';
                f=input(prompt);
                prompt='Input value of b:';
                g=input(prompt);
                prompt='Input value of c:';
                h=input(prompt);
                if g==0;%To avoid problem of infinite slope
                    a=-h/f;
                    b=0;
                    u=0;
                    v=1;
                    i=2;
                    fprintf 'Success!!\n';
                else
                    a=0;
                    b=-h/g;
                    u=1;
                    v=-f/g;
                    i=2;
                    fprintf 'Success!!\n';
                end
            else if j==4;%Conversion of Explicit to Point and Vector form
                    prompt='Input value of m:';
                    m=input(prompt);
                    prompt='Input value of c:';
                    c=input(prompt);
                    a=0;
                    b=c;
                    u=1;
                    v=m;
                    i=2;
                    fprintf 'Success!!\n'
                else i=0;
                    fprintf '\nINVALID INPUT\n'
                end
            end
        end
    end
end
    %Obtaining other variables in terms of point and vector
    m=v/u;
    if u==0;%Line parallel to Y-axis
        if b==0;%Line parallel to Y-axis and Point 1 is on X-axis
            d=a;
            e=1;
        else%Line parallel to Y-axis and Point 1 not on X-axis
            d=a;
            e=0;
        end
        c=inf;%Limitation of code. c=+or-inf, and can take infinite values if a(i)=0
        f=1;
        g=0;
        h=-a;
    else%Line not parallel to Y-axis
        c=b-m*a;
        f=m;
        g=-1;
        h=c;
        if a==0;%Given Point is on Y-axis
            if b==0;%Line passes through the origin
                d=u;
                e=v;
            else%Line does not pass through the origin
                d=-b/m;
                e=0;
            end
        else%Given point is not on Y-axis
            d=0;
            e=c;
        end
    end
%Obtaining the user defined point on line
i=2;
while i>1;
prompt='Input X coordinate of Point on Line:';
pa=input(prompt);
prompt='Input Y coordinate of Point on line:';
pb=input(prompt);
if f*pa+g*pb+h==0;%to check that point lies on the line
    prompt='Input distance from given Point on Line:';%obtain distance
    pd=input(prompt);
    syms p q;%Solving both equations simultaneously
    [solx,soly]=solve(sqrt((p-pa)^2+(q-pb)^2)==pd,f*p+g*q+h==0);
    fprintf ('\nThe Points at a distance=%d from point (%d,%d) on the line are:\n',pd,pa,pb);
    x=eval (solx(1));
    y=eval (soly(1));
    fprintf ('\nPoint A:(%d,%d)',x,y);
    x=eval (solx(2));
    y=eval (soly(2));
    fprintf ('\nPoint B:(%d,%d)\n',x,y);
    i=-10;%Exit loop
else
    fprintf ('\nPoint (%d,%d) does not lie on the given line. Please check input.\n',pa,pb);
end
end