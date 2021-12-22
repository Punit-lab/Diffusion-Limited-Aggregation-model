	!program name:: formation of  fractal on two dimentional square lattics
	!student name :: Punit nagpure
	!the launching radius,maximum radius and killing radius kept fixed
	program fractal
	implicit none
	real::Rstart,Rmax,Rkilling,r,r2,r1,p1,particledistance,Rcheak
	integer::x0,y0,y1,x1,i,j,m,n,x,y,k,particlesize,n1,m1,flag,flag1,tol,count1=0,t=0,particle=0,d,values(1:8)
	integer::xposition(-1000:1000,-1000:1000)
	integer,allocatable::seed(:)
	open(unit=11,file="diffusion2.dat")
	open(unit=13,file="diffusiondim2.dat")
	!___________________input and variable used__________________________________________
	!n=dimention of row 
	!m=dimention of column
	n=100;m=100;particlesize=4000;tol=10
	!inner circle parameter
	n1=5;m1=5
	
	!____________initilization of 2d lattics_______________________________________________				
	do i=1,n
		do j=1,m
			xposition(i,j)=0
		end do
	end do
	x0=50;y0=50
	x1=x0;y1=y0
	xposition(x0,y0)=1
	Rstart=sqrt(real((x0-(n+n1))**2+(y0-(m+m1))**2))
	Rmax=sqrt(real((x0-(n))**2+(y0-(m))**2))
	!generating unique sequence of random number
	call date_and_time(values=values)
	call random_seed(size=d)
	allocate(seed(d))
	seed(:)=values(8)
	call random_seed(put=seed)
	!end
!_________________________formation of fractal____________________________________________	
	do k=1,particlesize
		call random_number(r)
		x=x0+(Rstart*cos(real(2*3.14*r)))
		y=y0+(Rstart*sin(real(2*3.14*r)))
	
		write(*,*) k
	!______________________movement of random walker_________________________________________
		do 
			call random_number(p1)
			if(p1>=0.0 .and. p1<0.25)then
				x=x+1
			else 
				if(p1>=0.25 .and.p1<0.5)then
					x=x-1
				else	
					if(p1>=0.5 .and.p1<0.75)then
						y=y+1
					else
						if(p1>=0.25 .and.p1<1.0)then
							y=y-1								
						end if
					end if
				end if
			end if

		!_____________________sticking of molecule to seed_____________________________________________
			if(x>0 .and.x<=n)then
				if(y>0 .and.y<=m)then
					flag=0
					flag1=0
					do i=1,n
						if(flag==1)exit
						if(flag1==1)exit
						do j=1,m
							if(xposition(i,j)==1)then
								x0=i;y0=j
								if(x==x0)then
									if(y==(y0+1))then
										if(xposition(x,y)==0)then
											Rcheak=sqrt(real((abs(x)-x1)**2 + (abs(y)-y1)**2))
											if(Rcheak>=(Rmax-tol))then
												flag1=1
												exit
											end if
											xposition(x,y)=1
											write(11,*)x,y
											flag=1
											exit
										else
											cycle
										end if
									else														
										if(y==(y0-1))then
											if(xposition(x,y)==0)then
											Rcheak=sqrt(real((abs(x)-x1)**2 + (abs(y)-y1)**2))
											if(Rcheak>=(Rmax-tol))then
												flag1=1
												exit
											end if
											xposition(x,y)=1
											write(11,*) x,y
											flag=1
											exit
											else
												cycle
											end if
										end if
									end if
								else
									if(y==y0)then
										if(x==(x0+1))then
											if(xposition(x,y)==0)then
												Rcheak=sqrt(real((abs(x)-x1)**2 + (abs(y)-y1)**2))
												if(Rcheak>=(Rmax-tol))then
													flag1=1
													exit
												end if
												xposition(x,y)=1
												write(11,*) x,y
												flag=1
												exit
											else
												cycle
											end if
										else
											if(x==(x0-1))then
												if(xposition(x,y)==0)then
													Rcheak=sqrt(real((abs(x)-x1)**2 + (abs(y)-y1)**2))
													if(Rcheak>=(Rmax-tol))then
														flag1=1
														exit
													end if
												xposition(x,y)=1
												write(11,*) x,y
												flag=1
												exit
												else
													cycle
												end if
											end if
										end if
									end if
								end if
							end if
						end do
					end do	
				end if
			end if
				!____________________exit condition for walker__________________________________
			if(flag==1)then	
				if(xposition(x,y)==1)then
				particle=particle +1
				flag=0
					exit
				end if
			end if
			if(flag1==1)then
				t=t+1
				flag1=0
				exit
			end if
			
			particledistance=sqrt(real((abs(x)-x1)**2 + (abs(y)-y1)**2))
			!if(particledistance>=Rmax)exit
			Rkilling=(2*Rstart)
			if(particledistance>=Rkilling)then 
			count1=count1+1
					exit
			end if
		end do
	end do
	
	write(*,*) t,particle,count1
	count1=0
	!____________________________calculation of fractal dimention______________________________________________________
	r1=1.0
	do 
		r1=r1+0.1
		flag1=0
		count1=0
		do i=1,n
			do j=1,m
				r2=sqrt(real((x1-i)**2+(y1-j)**2))
				if(r2<=r1)then
					if(xposition(i,j)==1)then
						count1=count1+1
					end if
				end if
			end do
		end do
		write(13,*) abs(log(r1)),abs(log(real(count1)))
		if(r1>=Rmax)exit
	end do
	end program fractal	