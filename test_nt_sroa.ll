; ModuleID = 'test_nt.ll'
source_filename = "test_nt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i1 zeroext %1) #0 {
  %3 = zext i1 %1 to i8
  br label %4

4:                                                ; preds = %16, %2
  %.013 = phi i32 [ 1, %2 ], [ %15, %16 ]
  %.0 = phi i64 [ 0, %2 ], [ %17, %16 ]
  %5 = icmp ult i64 %.0, 1024
  br i1 %5, label %7, label %6

6:                                                ; preds = %4
  br label %18

7:                                                ; preds = %4
  %8 = add nsw i32 %.013, 1
  %9 = trunc i8 %3 to i1
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = getelementptr inbounds i32, i32* %0, i64 %.0
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %13 = mul nsw i32 %8, %12
  br label %14

14:                                               ; preds = %10, %7
  %.1 = phi i32 [ %13, %10 ], [ %8, %7 ]
  %15 = sub nsw i32 %.1, 2
  br label %16

16:                                               ; preds = %14
  %17 = add i64 %.0, 2
  br label %4

18:                                               ; preds = %6
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
