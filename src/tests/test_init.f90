program test_init
use iso_fortran_env,only:int8,int16,int32,int64,real32,real64,real128
use mod_testing,only:assert,initialize_tests,report_tests
use mod_functional,only:init

implicit none

logical,dimension(:),allocatable :: tests
logical :: test_failed
integer :: n,norder,ntests
integer,parameter :: stdout = 6

n = 1
ntests = 9
call initialize_tests(tests,ntests)

tests(n) = assert(all(init([1_int8,2_int8]) == [1_int8]),'init, int8')
n = n + 1

tests(n) = assert(all(init([1_int16,2_int16]) == [1_int16]),'init, int16')
n = n + 1

tests(n) = assert(all(init([1_int32,2_int32]) == [1_int32]),'init, int32')
n = n + 1

tests(n) = assert(all(init([1_int64,2_int64]) == [1_int64]),'init, int64')
n = n + 1

tests(n) = assert(all(init([1._real32,2._real32]) == [1._real32]),'init, real32')
n = n + 1

tests(n) = assert(all(init([1._real64,2._real64]) == [1._real64]),'init, real64')
n = n + 1

tests(n) = assert(all(init([1._real128,2._real128]) == [1._real128]),'init, real128')
n = n + 1

tests(n) = assert(size(init([1])) == 0,'size(init([1])) == 0')
n = n + 1

tests(n) = assert(size(init(init([1]))) == 0,'size(init(init([1]))) == 0')
n = n + 1

test_failed = .false.
call report_tests(tests,test_failed)
if(test_failed)stop 1

endprogram test_init
