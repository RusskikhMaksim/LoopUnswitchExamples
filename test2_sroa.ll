; ModuleID = 'test2.ll'
source_filename = "test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i1 zeroext %1) #0 {
  %3 = zext i1 %1 to i8
  br label %4

4:                                                ; preds = %17, %2
  %.011 = phi i8 [ %3, %2 ], [ %16, %17 ]
  %.010 = phi i32 [ 1, %2 ], [ %.1, %17 ]
  %.0 = phi i64 [ 0, %2 ], [ %18, %17 ]
  %5 = icmp ult i64 %.0, 1024
  br i1 %5, label %7, label %6

6:                                                ; preds = %4
  br label %19

7:                                                ; preds = %4
  %8 = trunc i8 %.011 to i1
  br i1 %8, label %9, label %13

9:                                                ; preds = %7
  %10 = getelementptr inbounds i32, i32* %0, i64 %.0
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = mul nsw i32 %.010, %11
  br label %13

13:                                               ; preds = %9, %7
  %.1 = phi i32 [ %12, %9 ], [ %.010, %7 ]
  %14 = trunc i8 %.011 to i1
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i8
  br label %17

17:                                               ; preds = %13
  %18 = add i64 %.0, 2
  br label %4

19:                                               ; preds = %6
  ret i32 %.010
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
