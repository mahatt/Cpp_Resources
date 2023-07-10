; ModuleID = 'nested4.cpp.ll'
source_filename = "nested4.cpp"
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
  %12 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %13

13:                                               ; preds = %55, %4
  %14 = load i32, i32* %9, align 4
  %15 = load i32, i32* %7, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %58

17:                                               ; preds = %13
  %18 = load i32, i32* %7, align 4
  store i32 %18, i32* %10, align 4
  br label %19

19:                                               ; preds = %51, %17
  %20 = load i32, i32* %10, align 4
  %21 = icmp sge i32 %20, 0
  br i1 %21, label %22, label %54

22:                                               ; preds = %19
  store i32 0, i32* %11, align 4
  br label %23

23:                                               ; preds = %47, %22
  %24 = load i32, i32* %11, align 4
  %25 = load i32, i32* %10, align 4
  %26 = srem i32 %25, 4
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %50

28:                                               ; preds = %23
  %29 = load i32, i32* %9, align 4
  %30 = load i32, i32* %10, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, i32* %7, align 4
  %33 = srem i32 %31, %32
  store i32 %33, i32* %12, align 4
  %34 = load i32*, i32** %5, align 8
  %35 = load i32, i32* %12, align 4
  %36 = load i32, i32* %11, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %34, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = load i32*, i32** %6, align 8
  %42 = load i32, i32* %12, align 4
  %43 = load i32, i32* %11, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %41, i64 %45
  store i32 %40, i32* %46, align 4
  br label %47

47:                                               ; preds = %28
  %48 = load i32, i32* %11, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %11, align 4
  br label %23, !llvm.loop !6, !nested4.cpp !8, !\30 !9

50:                                               ; preds = %23
  br label %51

51:                                               ; preds = %50
  %52 = load i32, i32* %10, align 4
  %53 = add nsw i32 %52, -1
  store i32 %53, i32* %10, align 4
  br label %19, !llvm.loop !10, !nested4.cpp !8, !\30 !9

54:                                               ; preds = %19
  br label %55

55:                                               ; preds = %54
  %56 = load i32, i32* %9, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %9, align 4
  br label %13, !llvm.loop !11, !nested4.cpp !8, !\30 !9

58:                                               ; preds = %13
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
!11 = distinct !{!11, !7}
