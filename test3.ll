; ModuleID = 'test3.c'
source_filename = "test3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i32 %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32* %0, i32** %3, align 8, !tbaa !2
  store i32 %1, i32* %4, align 4, !tbaa !6
  %7 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #2
  store i32 1, i32* %5, align 4, !tbaa !6
  %8 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #2
  store i32 0, i32* %6, align 4, !tbaa !6
  br label %9

9:                                                ; preds = %26, %2
  %10 = load i32, i32* %6, align 4, !tbaa !6
  %11 = icmp slt i32 %10, 1024
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #2
  br label %29

14:                                               ; preds = %9
  %15 = load i32, i32* %4, align 4, !tbaa !6
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %25

17:                                               ; preds = %14
  %18 = load i32*, i32** %3, align 8, !tbaa !2
  %19 = load i32, i32* %6, align 4, !tbaa !6
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32* %18, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !6
  %23 = load i32, i32* %5, align 4, !tbaa !6
  %24 = mul nsw i32 %23, %22
  store i32 %24, i32* %5, align 4, !tbaa !6
  br label %25

25:                                               ; preds = %17, %14
  br label %26

26:                                               ; preds = %25
  %27 = load i32, i32* %6, align 4, !tbaa !6
  %28 = add nsw i32 %27, 2
  store i32 %28, i32* %6, align 4, !tbaa !6
  br label %9

29:                                               ; preds = %12
  %30 = load i32, i32* %5, align 4, !tbaa !6
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
!7 = !{!"int", !4, i64 0}
