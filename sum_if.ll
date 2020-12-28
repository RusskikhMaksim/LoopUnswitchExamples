; ModuleID = 'sum_if.c'
source_filename = "sum_if.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i1 zeroext %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store i32* %0, i32** %3, align 8, !tbaa !2
  %7 = zext i1 %1 to i8
  store i8 %7, i8* %4, align 1, !tbaa !6
  %8 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #2
  store i32 1, i32* %5, align 4, !tbaa !8
  %9 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #2
  store i64 0, i64* %6, align 8, !tbaa !10
  br label %10

10:                                               ; preds = %26, %2
  %11 = load i64, i64* %6, align 8, !tbaa !10
  %12 = icmp ult i64 %11, 1024
  br i1 %12, label %15, label %13

13:                                               ; preds = %10
  %14 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #2
  br label %29

15:                                               ; preds = %10
  %16 = load i8, i8* %4, align 1, !tbaa !6, !range !12
  %17 = trunc i8 %16 to i1
  br i1 %17, label %18, label %25

18:                                               ; preds = %15
  %19 = load i32*, i32** %3, align 8, !tbaa !2
  %20 = load i64, i64* %6, align 8, !tbaa !10
  %21 = getelementptr inbounds i32, i32* %19, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !8
  %23 = load i32, i32* %5, align 4, !tbaa !8
  %24 = mul nsw i32 %23, %22
  store i32 %24, i32* %5, align 4, !tbaa !8
  br label %25

25:                                               ; preds = %18, %15
  br label %26

26:                                               ; preds = %25
  %27 = load i64, i64* %6, align 8, !tbaa !10
  %28 = add i64 %27, 2
  store i64 %28, i64* %6, align 8, !tbaa !10
  br label %10

29:                                               ; preds = %13
  %30 = load i32, i32* %5, align 4, !tbaa !8
  %31 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #2
  ret i32 %30
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.1-++20201103062913+ef4ffcafbb2-1~exp1~20201103053528.128"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"_Bool", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !4, i64 0}
!12 = !{i8 0, i8 2}
