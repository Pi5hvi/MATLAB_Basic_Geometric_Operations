%Choose number of lines to input
prompt='Input number of lines:';
n=input(prompt);
%Program to store data on each line input
i=0;
while i<(n)
    %Choosing form of input
    i=i+1;
    fprintf('\nLine%d',i);
    prompt='\n Please define the form of input: \n 1)Point and vector \n 2)Two Points \n 3)Implicit (ax+by+c=0) \n 4)Explicit (y=mx+c) \n';
    j=input(prompt);
    if j==1;%Point-Vector form
        prompt='Input X coordinate of Point on Line:';
        a(i)=input(prompt);
        prompt='Input Y coordinate of Point on line:';
        b(i)=input(prompt);
        prompt='Input i component of Vector:';
        u(i)=input(prompt);
        prompt='Input j component of vector:';
        v(i)=input(prompt);
        fprintf 'Success!!'\n;
    else if j==2;%Conversion of Two point to point and vector form
        prompt='Input X coordinate of first Point on Line:';
        a(i)=input(prompt);
        prompt='Input Y coordinate of first Point on line:';
        b(i)=input(prompt);
        prompt='Input X coordinate of second Point on Line:';
        d(i)=input(prompt);
        prompt='Input Y coordinate of second Point on Line:';
        e(i)=input(prompt);
        if a(i)==d(i);%To avoid problem of infinite slope
            u(i)=0;
            v(i)=1;
            fprintf 'Success!!\n';
        else
            u(i)=1;
            v(i)=(e(i)-b(i))/(d(i)-a(i));
            fprintf 'Success!!\n';
        end
        else if j==3;%Conversion of Implicit to Point and Vector form
                prompt='Input value of a:';
                f(i)=input(prompt);
                prompt='Input value of b:';
                g(i)=input(prompt);
                prompt='Input value of c:';
                h(i)=input(prompt);
                if g(i)==0;%To avoid problem of infinite slope
                    a(i)=-h(i)/f(i);
                    b(i)=0;
                    u(i)=0;
                    v(i)=1;
                    fprintf 'Success!!\n';
                else
                    a(i)=0;
                    b(i)=-h(i)/g(i);
                    u(i)=1;
                    v(i)=-f(i)/g(i);
                    fprintf 'Success!!\n';
                end
            else if j==4;%Conversion of Explicit to Point and Vector form
                    prompt='Input value of m:';
                    m(i)=input(prompt);
                    prompt='Input value of c:';
                    c(i)=input(prompt);
                    a(i)=0;
                    b(i)=c(i);
                    u(i)=1;
                    v(i)=m(i);
                    fprintf 'Success!!\n'
                else i=i-1;  
                    disp('INVALID INPUT\n')
                   
                end
            end
        end
    end
end
for i=1:n;
    %Obtaining other variables in terms of point and vector
    m(i)=v(i)/u(i);
    if u(i)==0;%Line parallel to Y-axis
        if b(i)==0;%Line parallel to Y-axis and Point 1 is on X-axis
            d(i)=a(i);
            e(i)=1;
        else%Line parallel to Y-axis and Point 1 not on X-axis
            d(i)=a(i);
            e(i)=0;
        end
        c(i)=inf;%Limitation of code. c=+or-inf, and can take infinite values if a(i)=0
        f(i)=1;
        g(i)=0;
        h(i)=-a(i);
    else%Line not parallel to Y-axis
        c(i)=b(i)-m(i)*a(i);
        f(i)=m(i);
        g(i)=-1;
        h(i)=c(i);
        if a(i)==0;%Given Point is on Y-axis
            if b(i)==0;%Line passes through the origin
                d(i)=u(i);
                e(i)=v(i);
            else%Line does not pass through the origin
                d(i)=-b(i)/m(i);
                e(i)=0;
            end
        else%Given point is not on Y-axis
            d(i)=0;
            e(i)=c(i);
        end
    end
end

for i=1:n;
    fprintf('\n Line %d: \n Vector,Point:[%di+%dj],(%d,%d) \n Two point:(%d,%d),(%d,%d) \n Implicit: %dx+(%d)y+(%d)=0 \n Explicit: y=(%d)x+(%d)\n',i,u(i),v(i),a(i),b(i),a(i),b(i),d(i),e(i),f(i),g(i),h(i),m(i),c(i));
end