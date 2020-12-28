# LoopUnswitchExamples

Опции компиляции:

clang-11 -S -O3 -emit-llvm -mllvm -disable-llvm-optzns source_file_name.c

opt-11 -S -o source_file_name_sroa.ll source_file_name.ll -sroa

opt-11 -S -o source_file_name_sroa_lu.ll source_file_name_sroa.ll -loop-unswitch
