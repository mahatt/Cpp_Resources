; ModuleID = 'doubleiv.cpp.ll'
source_filename = "doubleiv.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @kernel_function(i32* noundef %0, i32* noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %12

12:                                               ; preds = %40, %4
  %13 = load i32, i32* %9, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %43

16:                                               ; preds = %12
  %17 = load i32, i32* %7, align 4
  store i32 %17, i32* %10, align 4
  br label %18

18:                                               ; preds = %36, %16
  %19 = load i32, i32* %10, align 4
  %20 = icmp sge i32 %19, 0
  br i1 %20, label %21, label %39

21:                                               ; preds = %18
  %22 = load i32, i32* %9, align 4
  %23 = load i32, i32* %10, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, i32* %7, align 4
  %26 = srem i32 %24, %25
  store i32 %26, i32* %11, align 4
  %27 = load i32*, i32** %5, align 8
  %28 = load i32, i32* %11, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32* %27, i64 %29
  %31 = load i32, i32* %30, align 4
  %32 = load i32*, i32** %6, align 8
  %33 = load i32, i32* %11, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32* %32, i64 %34
  store i32 %31, i32* %35, align 4
  br label %36

36:                                               ; preds = %21
  %37 = load i32, i32* %10, align 4
  %38 = add nsw i32 %37, -1
  store i32 %38, i32* %10, align 4
  br label %18, !llvm.loop !6, !doubleiv.cpp !8, !\30 !9

39:                                               ; preds = %18
  br label %40

40:                                               ; preds = %39
  %41 = load i32, i32* %9, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %9, align 4
  br label %12, !llvm.loop !10, !doubleiv.cpp !8, !\30 !9

43:                                               ; preds = %12
  ret void
}

attributes #0 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"Q.BackEdge.File"}
!9 = !{!"Q.BackEdge.Loc"}
!10 = distinct !{!10, !7}
