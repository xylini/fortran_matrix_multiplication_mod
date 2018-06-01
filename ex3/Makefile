PFUNIT = /opt/pfunit
F90_VENDOR = Intel
F90=ifort
O2 = -O2

include $(PFUNIT)/include/base.mk

FFLAGS = -std08 -warn all  -funroll-loops -pedantic -I$(PFUNIT)/mod
LIBS = $(PFUNIT)/lib/libpfunit$(LIB_EXT)

PFS = $(wildcard *.pf)
OBJS = $(PFS:.pf=.o)

%.F90: %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@

matmult00.o: matmult.F90
	$(F90) $(O2) -DDOT=0 -DCACHE=0 $(FFLAGS) -c $<


test00: testSuites.inc matmult00.o $(OBJS) #clean
	$(F90) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)

matmult01.o: matmult.F90
	$(F90) $(O2) -DDOT=0 -DCACHE=1 $(FFLAGS) -c $<


test01: testSuites.inc matmult01.o $(OBJS) #clean
	$(F90) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)


matmult10.o: matmult.F90
	$(F90) $(O2) -DDOT=1 -DCACHE=0 $(FFLAGS) -c $<

test10: testSuites.inc matmult10.o $(OBJS) #clean
	$(F90) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)


matmult11.o: matmult.F90
	$(F90) $(O2) -DDOT=1 -DCACHE=1 $(FFLAGS) -c $<

test11: testSuites.inc matmult11.o $(OBJS) #clean
	$(F90) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)

testsO2:
	make test00
	make clean
	make test01
	make clean
	make test10
	make clean
	make test11
	make clean


run_tests:
	./test00
	./test01
	./test10
	./test11

clean:
	find . -name "*genmod*" -type f -delete

main00:
	$(F90) -O2 -DDOT=0 -DCACHE=0 -std08 matmult.F90 main.f90 -o $@ #$(FFLAGS)

main01:
	$(F90) -O2 -DDOT=0 -DCACHE=1 -std08 matmult.F90 main.f90 -o $@

main10:
	$(F90) -O2 -DDOT=1 -DCACHE=0 -std08 matmult.F90 main.f90 -o $@

main11:
	$(F90) -O2 -DDOT=1 -DCACHE=1 -std08 matmult.F90 main.f90 -o $@

mainmatmul:
	$(F90) -O2 -std08 mainmatmul.f90 -o $@