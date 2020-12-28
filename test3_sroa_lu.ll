; ModuleID = 'test3_sroa.ll'
source_filename = "test3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i32 %1) #0 {
  %3 = icmp ne i32 %1, 0
  br i1 %3, label %.split.us, label %..split_crit_edge

..split_crit_edge:                                ; preds = %2
  br label %.split

.split.us:                                        ; preds = %2
  br label %4

4:                                                ; preds = %13, %.split.us
  %.09.us = phi i32 [ 1, %.split.us ], [ %.1.us, %13 ]
  %.0.us = phi i32 [ 0, %.split.us ], [ %14, %13 ]
  %5 = icmp slt i32 %.0.us, 1024
  br i1 %5, label %6, label %.us-lcssa.us

6:                                                ; preds = %4
  br i1 true, label %7, label %12

7:                                                ; preds = %6
  %8 = sext i32 %.0.us to i64
  %9 = getelementptr inbounds i32, i32* %0, i64 %8
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = mul nsw i32 %.09.us, %10
  br label %12

12:                                               ; preds = %7, %6
  %.1.us = phi i32 [ %11, %7 ], [ %.09.us, %6 ]
  br label %13

13:                                               ; preds = %12
  %14 = add nsw i32 %.0.us, 2
  br label %4

.us-lcssa.us:                                     ; preds = %4
  %.09.lcssa.ph.us = phi i32 [ %.09.us, %4 ]
  br label %17

.split:                                           ; preds = %..split_crit_edge
  br label %15

15:                                               ; preds = %25, %.split
  %.09 = phi i32 [ 1, %.split ], [ %.1, %25 ]
  %.0 = phi i32 [ 0, %.split ], [ %26, %25 ]
  %16 = icmp slt i32 %.0, 1024
  br i1 %16, label %18, label %.us-lcssa

.us-lcssa:                                        ; preds = %15
  %.09.lcssa.ph = phi i32 [ %.09, %15 ]
  br label %17

17:                                               ; preds = %.us-lcssa.us, %.us-lcssa
  %.09.lcssa = phi i32 [ %.09.lcssa.ph, %.us-lcssa ], [ %.09.lcssa.ph.us, %.us-lcssa.us ]
  br label %27

18:                                               ; preds = %15
  br i1 false, label %19, label %24

19:                                               ; preds = %18
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds i32, i32* %0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = mul nsw i32 %.09, %22
  br label %24

24:                                               ; preds = %19, %18
  %.1 = phi i32 [ %23, %19 ], [ %.09, %18 ]
  br label %25

25:                                               ; preds = %24
  %26 = add nsw i32 %.0, 2
  br label %15

27:                                               ; preds = %17
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
