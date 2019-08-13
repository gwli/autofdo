wrk="/autofdo/algo/C/hash/"
cd $wrk

CC=clang-5.0

#CC -o -gmlt bin_a.out hash.c hash.h test.c
$CC  -fdebug-info-for-profiling hash.c hash.h test_program.c
mv a.out bin_a.out
time ./bin_a.out
perf record -c 2 -e  branch-instructions -b -o perf.data -- ./bin_a.out
/autofdo/create_llvm_prof --binary=./bin_a.out --profile=perf.data --out=llvm_profile.data
$CC  -fprofile-sample-use=./llvm_profile.data hash.c hash.h test_program.c
mv a.out bin_b.out
time ./bin_b.out
time ./bin_a.out
