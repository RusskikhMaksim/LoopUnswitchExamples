; ModuleID = 'test_nt_sroa.ll'
source_filename = "test_nt.c"
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

5:                                                ; preds = %15, %.split.us
  %.013.us = phi i32 [ 1, %.split.us ], [ %14, %15 ]
  %.0.us = phi i64 [ 0, %.split.us ], [ %16, %15 ]
  %6 = icmp ult i64 %.0.us, 1024
  br i1 %6, label %7, label %.us-lcssa.us

7:                                                ; preds = %5
  %8 = add nsw i32 %.013.us, 1
  br i1 true, label %9, label %13

9:                                                ; preds = %7
  %10 = getelementptr inbounds i32, i32* %0, i64 %.0.us
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = mul nsw i32 %8, %11
  br label %13

13:                                               ; preds = %9, %7
  %.1.us = phi i32 [ %12, %9 ], [ %8, %7 ]
  %14 = sub nsw i32 %.1.us, 2
  br label %15

15:                                               ; preds = %13
  %16 = add i64 %.0.us, 2
  br label %5

.us-lcssa.us:                                     ; preds = %5
  %.013.lcssa.ph.us = phi i32 [ %.013.us, %5 ]
  br label %19

.split:                                           ; preds = %..split_crit_edge
  br label %17

17:                                               ; preds = %28, %.split
  %.013 = phi i32 [ 1, %.split ], [ %27, %28 ]
  %.0 = phi i64 [ 0, %.split ], [ %29, %28 ]
  %18 = icmp ult i64 %.0, 1024
  br i1 %18, label %20, label %.us-lcssa

.us-lcssa:                                        ; preds = %17
  %.013.lcssa.ph = phi i32 [ %.013, %17 ]
  br label %19

19:                                               ; preds = %.us-lcssa.us, %.us-lcssa
  %.013.lcssa = phi i32 [ %.013.lcssa.ph, %.us-lcssa ], [ %.013.lcssa.ph.us, %.us-lcssa.us ]
  br label %30

20:                                               ; preds = %17
  %21 = add nsw i32 %.013, 1
  br i1 false, label %22, label %26

22:                                               ; preds = %20
  %23 = getelementptr inbounds i32, i32* %0, i64 %.0
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = mul nsw i32 %21, %24
  br label %26

26:                                               ; preds = %22, %20
  %.1 = phi i32 [ %25, %22 ], [ %21, %20 ]
  %27 = sub nsw i32 %.1, 2
  br label %28

28:                                               ; preds = %26
  %29 = add i64 %.0, 2
  br label %17

30:                                               ; preds = %19
  ret i32 %.013.lcssa
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
