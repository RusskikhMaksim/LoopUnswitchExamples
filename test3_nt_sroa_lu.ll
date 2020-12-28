; ModuleID = 'test3_nt_sroa.ll'
source_filename = "test3_nt.c"
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

4:                                                ; preds = %15, %.split.us
  %.013.us = phi i32 [ 1, %.split.us ], [ %14, %15 ]
  %.0.us = phi i32 [ 0, %.split.us ], [ %16, %15 ]
  %5 = icmp slt i32 %.0.us, 1024
  br i1 %5, label %6, label %.us-lcssa.us

6:                                                ; preds = %4
  %7 = mul nsw i32 %.013.us, 3
  br i1 true, label %8, label %13

8:                                                ; preds = %6
  %9 = sext i32 %.0.us to i64
  %10 = getelementptr inbounds i32, i32* %0, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = mul nsw i32 %7, %11
  br label %13

13:                                               ; preds = %8, %6
  %.1.us = phi i32 [ %12, %8 ], [ %7, %6 ]
  %14 = add nsw i32 %.1.us, 1
  br label %15

15:                                               ; preds = %13
  %16 = add nsw i32 %.0.us, 2
  br label %4

.us-lcssa.us:                                     ; preds = %4
  %.013.lcssa.ph.us = phi i32 [ %.013.us, %4 ]
  br label %19

.split:                                           ; preds = %..split_crit_edge
  br label %17

17:                                               ; preds = %29, %.split
  %.013 = phi i32 [ 1, %.split ], [ %28, %29 ]
  %.0 = phi i32 [ 0, %.split ], [ %30, %29 ]
  %18 = icmp slt i32 %.0, 1024
  br i1 %18, label %20, label %.us-lcssa

.us-lcssa:                                        ; preds = %17
  %.013.lcssa.ph = phi i32 [ %.013, %17 ]
  br label %19

19:                                               ; preds = %.us-lcssa.us, %.us-lcssa
  %.013.lcssa = phi i32 [ %.013.lcssa.ph, %.us-lcssa ], [ %.013.lcssa.ph.us, %.us-lcssa.us ]
  br label %31

20:                                               ; preds = %17
  %21 = mul nsw i32 %.013, 3
  br i1 false, label %22, label %27

22:                                               ; preds = %20
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds i32, i32* %0, i64 %23
  %25 = load i32, i32* %24, align 4, !tbaa !2
  %26 = mul nsw i32 %21, %25
  br label %27

27:                                               ; preds = %22, %20
  %.1 = phi i32 [ %26, %22 ], [ %21, %20 ]
  %28 = add nsw i32 %.1, 1
  br label %29

29:                                               ; preds = %27
  %30 = add nsw i32 %.0, 2
  br label %17

31:                                               ; preds = %19
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
