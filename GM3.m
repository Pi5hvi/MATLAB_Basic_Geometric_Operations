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
syms p q;%Solving both equations simultaneously
[solx,soly]=solve((p-o)^2+(q-s)^2-r^2==0,f*p+g*q+h==0);
tf = isreal(solx);%To check for real points of intersection
if tf==1;
    tf = isreal(soly);%To check for real points of intersection
    if tf==1;
        if length(solx)==1%To check for Tangency
            x=eval (solx(1));
            y=eval (soly(1));
            fprintf ('The given line is tangent at Point T (%d,%d)',x,y);
        else
        fprintf 'The Points of Intersection are:\n';
        x=eval (solx(1));
        y=eval (soly(1));
        fprintf ('\nPoint A:(%d,%d)',x,y);
        x=eval (solx(2));
        y=eval (soly(2));
        fprintf ('\nPoint B:(%d,%d)',x,y);
        end
    else
        fpintf 'The Line and Circle do not intersect\n'
    end
else
    fprintf 'The Line and Circle do not intersect\n'
end