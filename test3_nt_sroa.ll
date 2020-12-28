; ModuleID = 'test3_nt.ll'
source_filename = "test3_nt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i32 %1) #0 {
  br label %3

3:                                                ; preds = %16, %2
  %.013 = phi i32 [ 1, %2 ], [ %15, %16 ]
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %4 = icmp slt i32 %.0, 1024
  br i1 %4, label %6, label %5

5:                                                ; preds = %3
  br label %18

6:                                                ; preds = %3
  %7 = mul nsw i32 %.013, 3
  %8 = icmp ne i32 %1, 0
  br i1 %8, label %9, label %14

9:                                                ; preds = %6
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds i32, i32* %0, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %13 = mul nsw i32 %7, %12
  br label %14

14:                                               ; preds = %9, %6
  %.1 = phi i32 [ %13, %9 ], [ %7, %6 ]
  %15 = add nsw i32 %.1, 1
  br label %16

16:                                               ; preds = %14
  %17 = add nsw i32 %.0, 2
  br label %3

18:                                               ; preds = %5
  ret i32 %.013
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
