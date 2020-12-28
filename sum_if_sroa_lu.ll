; ModuleID = 'sum_if_sroa.ll'
source_filename = "sum_if.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i1 zeroext %1) #0 {
  %3 = zext i1 %1 to i8
  %4 = trunc i8 %3 to i1
  br i1 %4, label %.split.us, label %..split_crit_edge

..split_crit_edge:                                ; preds = %2
  br label %.split

.split.us:                                        ; preds = %2
  br label %5

5:                                                ; preds = %13, %.split.us
  %.09.us = phi i32 [ 1, %.split.us ], [ %.1.us, %13 ]
  %.0.us = phi i64 [ 0, %.split.us ], [ %14, %13 ]
  %6 = icmp ult i64 %.0.us, 1024
  br i1 %6, label %7, label %.us-lcssa.us

7:                                                ; preds = %5
  br i1 true, label %8, label %12

8:                                                ; preds = %7
  %9 = getelementptr inbounds i32, i32* %0, i64 %.0.us
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = mul nsw i32 %.09.us, %10
  br label %12

12:                                               ; preds = %8, %7
  %.1.us = phi i32 [ %11, %8 ], [ %.09.us, %7 ]
  br label %13

13:                                               ; preds = %12
  %14 = add i64 %.0.us, 2
  br label %5

.us-lcssa.us:                                     ; preds = %5
  %.09.lcssa.ph.us = phi i32 [ %.09.us, %5 ]
  br label %17

.split:                                           ; preds = %..split_crit_edge
  br label %15

15:                                               ; preds = %24, %.split
  %.09 = phi i32 [ 1, %.split ], [ %.1, %24 ]
  %.0 = phi i64 [ 0, %.split ], [ %25, %24 ]
  %16 = icmp ult i64 %.0, 1024
  br i1 %16, label %18, label %.us-lcssa

.us-lcssa:                                        ; preds = %15
  %.09.lcssa.ph = phi i32 [ %.09, %15 ]
  br label %17

17:                                               ; preds = %.us-lcssa.us, %.us-lcssa
  %.09.lcssa = phi i32 [ %.09.lcssa.ph, %.us-lcssa ], [ %.09.lcssa.ph.us, %.us-lcssa.us ]
  br label %26

18:                                               ; preds = %15
  br i1 false, label %19, label %23

19:                                               ; preds = %18
  %20 = getelementptr inbounds i32, i32* %0, i64 %.0
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = mul nsw i32 %.09, %21
  br label %23

23:                                               ; preds = %19, %18
  %.1 = phi i32 [ %22, %19 ], [ %.09, %18 ]
  br label %24

24:                                               ; preds = %23
  %25 = add i64 %.0, 2
  br label %15

26:                                               ; preds = %17
  ret i32 %.09.lcssa
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.1-++20201103062913+ef4ffcafbb2-1~exp1~20201103053528.128"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
