; ModuleID = './401_36.c'
source_filename = "./401_36.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@staticTrue = internal global i32 1, align 4
@.str.2 = private unnamed_addr constant [9 x i8] c"A String\00", align 1
@staticFalse = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !22 {
entry:
  ret i32 1, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !26 {
entry:
  ret i32 0, !dbg !27
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !28 {
entry:
  %call = call i32 @rand() #4, !dbg !29
  %rem = srem i32 %call, 2, !dbg !30
  ret i32 %rem, !dbg !31
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !32 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !37, metadata !38), !dbg !39
  %0 = load i8*, i8** %line.addr, align 8, !dbg !40
  %cmp = icmp ne i8* %0, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !49 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !52, metadata !38), !dbg !53
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !54
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @bad36() #0 !dbg !57 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !38), !dbg !61
  store i8* null, i8** %data, align 8, !dbg !62
  %0 = load i32, i32* @staticTrue, align 4, !dbg !63
  %tobool = icmp ne i32 %0, 0, !dbg !63
  br i1 %tobool, label %if.then, label %if.end3, !dbg !65

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !66
  %call = call i8* @realloc(i8* %1, i64 100) #4, !dbg !68
  store i8* %call, i8** %data, align 8, !dbg !69
  %2 = load i8*, i8** %data, align 8, !dbg !70
  %cmp = icmp eq i8* %2, null, !dbg !72
  br i1 %cmp, label %if.then1, label %if.end, !dbg !73

if.then1:                                         ; preds = %if.then
  br label %if.end6, !dbg !74

if.end:                                           ; preds = %if.then
  %3 = load i8*, i8** %data, align 8, !dbg !76
  %call2 = call i8* @strcpy(i8* %3, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %4), !dbg !79
  br label %if.end3, !dbg !80

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticTrue, align 4, !dbg !81
  %tobool4 = icmp ne i32 %5, 0, !dbg !81
  br i1 %tobool4, label %if.then5, label %if.end6, !dbg !83

if.then5:                                         ; preds = %if.end3
  br label %if.end6, !dbg !84

if.end6:                                          ; preds = %if.then1, %if.then5, %if.end3
  ret void, !dbg !86
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define void @good36() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !38), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %0 = load i32, i32* @staticTrue, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.end3, !dbg !93

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %call = call i8* @realloc(i8* %1, i64 100) #4, !dbg !96
  store i8* %call, i8** %data, align 8, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  %cmp = icmp eq i8* %2, null, !dbg !100
  br i1 %cmp, label %if.then1, label %if.end, !dbg !101

if.then1:                                         ; preds = %if.then
  br label %if.end6, !dbg !102

if.end:                                           ; preds = %if.then
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %call2 = call i8* @strcpy(i8* %3, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %4), !dbg !107
  br label %if.end3, !dbg !108

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFalse, align 4, !dbg !109
  %tobool4 = icmp ne i32 %5, 0, !dbg !109
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !111

if.then5:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !112
  br label %if.end6, !dbg !114

if.else:                                          ; preds = %if.end3
  %6 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %6) #4, !dbg !117
  br label %if.end6

if.end6:                                          ; preds = %if.then1, %if.else, %if.then5
  ret void, !dbg !118
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good36(), !dbg !120
  call void @bad36(), !dbg !121
  ret i32 1, !dbg !122
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "401_36.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{!8, !12, !13, !14, !15, !16, !17, !18}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_36.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 15, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 16, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 17, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !9, line: 47, type: !11, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!18 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !9, line: 48, type: !11, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
!19 = !{i32 2, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!22 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 19, type: !23, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!11}
!25 = !DILocation(line: 21, column: 5, scope: !22)
!26 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 24, type: !23, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 26, column: 5, scope: !26)
!28 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 29, type: !23, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!29 = !DILocation(line: 31, column: 13, scope: !28)
!30 = !DILocation(line: 31, column: 20, scope: !28)
!31 = !DILocation(line: 31, column: 5, scope: !28)
!32 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 34, type: !33, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64, align: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!37 = !DILocalVariable(name: "line", arg: 1, scope: !32, file: !9, line: 34, type: !35)
!38 = !DIExpression()
!39 = !DILocation(line: 34, column: 30, scope: !32)
!40 = !DILocation(line: 36, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !9, line: 36, column: 8)
!42 = !DILocation(line: 36, column: 13, scope: !41)
!43 = !DILocation(line: 36, column: 8, scope: !32)
!44 = !DILocation(line: 38, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !9, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 9, scope: !45)
!47 = !DILocation(line: 39, column: 5, scope: !45)
!48 = !DILocation(line: 40, column: 1, scope: !32)
!49 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 42, type: !50, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !11}
!52 = !DILocalVariable(name: "intNumber", arg: 1, scope: !49, file: !9, line: 42, type: !11)
!53 = !DILocation(line: 42, column: 24, scope: !49)
!54 = !DILocation(line: 44, column: 20, scope: !49)
!55 = !DILocation(line: 44, column: 5, scope: !49)
!56 = !DILocation(line: 45, column: 1, scope: !49)
!57 = distinct !DISubprogram(name: "bad36", scope: !9, file: !9, line: 52, type: !58, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !9, line: 54, type: !5)
!61 = !DILocation(line: 54, column: 12, scope: !57)
!62 = !DILocation(line: 55, column: 10, scope: !57)
!63 = !DILocation(line: 56, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !9, line: 56, column: 8)
!65 = !DILocation(line: 56, column: 8, scope: !57)
!66 = !DILocation(line: 59, column: 32, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !9, line: 57, column: 5)
!68 = !DILocation(line: 59, column: 24, scope: !67)
!69 = !DILocation(line: 59, column: 14, scope: !67)
!70 = !DILocation(line: 60, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !9, line: 60, column: 13)
!72 = !DILocation(line: 60, column: 18, scope: !71)
!73 = !DILocation(line: 60, column: 13, scope: !67)
!74 = !DILocation(line: 60, column: 27, scope: !75)
!75 = !DILexicalBlockFile(scope: !71, file: !9, discriminator: 1)
!76 = !DILocation(line: 62, column: 16, scope: !67)
!77 = !DILocation(line: 62, column: 9, scope: !67)
!78 = !DILocation(line: 63, column: 19, scope: !67)
!79 = !DILocation(line: 63, column: 9, scope: !67)
!80 = !DILocation(line: 64, column: 5, scope: !67)
!81 = !DILocation(line: 65, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !57, file: !9, line: 65, column: 8)
!83 = !DILocation(line: 65, column: 8, scope: !57)
!84 = !DILocation(line: 69, column: 5, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !9, line: 66, column: 5)
!86 = !DILocation(line: 70, column: 1, scope: !57)
!87 = distinct !DISubprogram(name: "good36", scope: !9, file: !9, line: 77, type: !58, isLocal: false, isDefinition: true, scopeLine: 78, isOptimized: false, unit: !0, variables: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !9, line: 79, type: !5)
!89 = !DILocation(line: 79, column: 12, scope: !87)
!90 = !DILocation(line: 80, column: 10, scope: !87)
!91 = !DILocation(line: 81, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !9, line: 81, column: 8)
!93 = !DILocation(line: 81, column: 8, scope: !87)
!94 = !DILocation(line: 84, column: 32, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !9, line: 82, column: 5)
!96 = !DILocation(line: 84, column: 24, scope: !95)
!97 = !DILocation(line: 84, column: 14, scope: !95)
!98 = !DILocation(line: 85, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !9, line: 85, column: 13)
!100 = !DILocation(line: 85, column: 18, scope: !99)
!101 = !DILocation(line: 85, column: 13, scope: !95)
!102 = !DILocation(line: 85, column: 27, scope: !103)
!103 = !DILexicalBlockFile(scope: !99, file: !9, discriminator: 1)
!104 = !DILocation(line: 87, column: 16, scope: !95)
!105 = !DILocation(line: 87, column: 9, scope: !95)
!106 = !DILocation(line: 88, column: 19, scope: !95)
!107 = !DILocation(line: 88, column: 9, scope: !95)
!108 = !DILocation(line: 89, column: 5, scope: !95)
!109 = !DILocation(line: 90, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !87, file: !9, line: 90, column: 8)
!111 = !DILocation(line: 90, column: 8, scope: !87)
!112 = !DILocation(line: 93, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !9, line: 91, column: 5)
!114 = !DILocation(line: 94, column: 5, scope: !113)
!115 = !DILocation(line: 98, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !9, line: 96, column: 5)
!117 = !DILocation(line: 98, column: 9, scope: !116)
!118 = !DILocation(line: 100, column: 1, scope: !87)
!119 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 104, type: !23, isLocal: false, isDefinition: true, scopeLine: 104, isOptimized: false, unit: !0, variables: !2)
!120 = !DILocation(line: 105, column: 5, scope: !119)
!121 = !DILocation(line: 106, column: 2, scope: !119)
!122 = !DILocation(line: 107, column: 5, scope: !119)
