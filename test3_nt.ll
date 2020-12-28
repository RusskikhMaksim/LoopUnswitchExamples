; ModuleID = 'test3_nt.c'
source_filename = "test3_nt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sum2(i32* %0, i32 %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32* %0, i32** %3, align 8, !tbaa !2
  store i32 %1, i32* %4, align 4, !tbaa !6
  %8 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #2
  store i32 1, i32* %5, align 4, !tbaa !6
  %9 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #2
  store i32 0, i32* %6, align 4, !tbaa !6
  %10 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #2
  store i32 0, i32* %7, align 4, !tbaa !6
  br label %11

11:                                               ; preds = %32, %2
  %12 = load i32, i32* %7, align 4, !tbaa !6
  %13 = icmp slt i32 %12, 1024
  br i1 %13, label %16, label %14

14:                                               ; preds = %11
  %15 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #2
  br label %35

16:                                               ; preds = %11
  %17 = load i32, i32* %5, align 4, !tbaa !6
  %18 = mul nsw i32 %17, 3
  store i32 %18, i32* %5, align 4, !tbaa !6
  %19 = load i32, i32* %4, align 4, !tbaa !6
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %29

21:                                               ; preds = %16
  %22 = load i32*, i32** %3, align 8, !tbaa !2
  %23 = load i32, i32* %7, align 4, !tbaa !6
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %22, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !6
  %27 = load i32, i32* %5, align 4, !tbaa !6
  %28 = mul nsw i32 %27, %26
  store i32 %28, i32* %5, align 4, !tbaa !6
  br label %29

29:                                               ; preds = %21, %16
  %30 = load i32, i32* %5, align 4, !tbaa !6
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %5, align 4, !tbaa !6
  br label %32

32:                                               ; preds = %29
  %33 = load i32, i32* %7, align 4, !tbaa !6
  %34 = add nsw i32 %33, 2
  store i32 %34, i32* %7, align 4, !tbaa !6
  br label %11

35:                                               ; preds = %14
  %36 = load i32, i32* %5, align 4, !tbaa !6
  %37 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #2
  %38 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #2
  ret i32 %36
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
