; RUN: llc < %s -asm-verbose=false | FileCheck %s

; Test that basic immediates assemble as expected.

target datalayout = "e-p:32:32-i64:64-v128:8:128-n32:64-S128"
target triple = "wasm32-unknown-unknown"

; CHECK-LABEL: zero_i32:
; CHECK-NEXT: (setlocal @0 (immediate 0))
; CHECK-NEXT: (return @0)
define i32 @zero_i32() {
  ret i32 0
}

; CHECK-LABEL: one_i32:
; CHECK-NEXT: (setlocal @0 (immediate 1))
; CHECK-NEXT: (return @0)
define i32 @one_i32() {
  ret i32 1
}

; CHECK-LABEL: max_i32:
; CHECK-NEXT: (setlocal @0 (immediate 2147483647))
; CHECK-NEXT: (return @0)
define i32 @max_i32() {
  ret i32 2147483647
}

; CHECK-LABEL: min_i32:
; CHECK-NEXT: (setlocal @0 (immediate -2147483648))
; CHECK-NEXT: (return @0)
define i32 @min_i32() {
  ret i32 -2147483648
}

; CHECK-LABEL: zero_i64:
; CHECK-NEXT: (setlocal @0 (immediate 0))
; CHECK-NEXT: (return @0)
define i64 @zero_i64() {
  ret i64 0
}

; CHECK-LABEL: one_i64:
; CHECK-NEXT: (setlocal @0 (immediate 1))
; CHECK-NEXT: (return @0)
define i64 @one_i64() {
  ret i64 1
}

; CHECK-LABEL: max_i64:
; CHECK-NEXT: (setlocal @0 (immediate 9223372036854775807))
; CHECK-NEXT: (return @0)
define i64 @max_i64() {
  ret i64 9223372036854775807
}

; CHECK-LABEL: min_i64:
; CHECK-NEXT: (setlocal @0 (immediate -9223372036854775808))
; CHECK-NEXT: (return @0)
define i64 @min_i64() {
  ret i64 -9223372036854775808
}

; CHECK-LABEL: negzero_f32:
; CHECK-NEXT: (setlocal @0 (immediate -0x0p0))
; CHECK-NEXT: (return @0)
define float @negzero_f32() {
  ret float -0.0
}

; CHECK-LABEL: zero_f32:
; CHECK-NEXT: (setlocal @0 (immediate 0x0p0))
; CHECK-NEXT: (return @0)
define float @zero_f32() {
  ret float 0.0
}

; CHECK-LABEL: one_f32:
; CHECK-NEXT: (setlocal @0 (immediate 0x1p0))
; CHECK-NEXT: (return @0)
define float @one_f32() {
  ret float 1.0
}

; CHECK-LABEL: two_f32:
; CHECK-NEXT: (setlocal @0 (immediate 0x1p1))
; CHECK-NEXT: (return @0)
define float @two_f32() {
  ret float 2.0
}

; CHECK-LABEL: nan_f32:
; CHECK-NEXT: (setlocal @0 (immediate nan))
; CHECK-NEXT: (return @0)
define float @nan_f32() {
  ret float 0x7FF8000000000000
}

; CHECK-LABEL: negnan_f32:
; CHECK-NEXT: (setlocal @0 (immediate -nan))
; CHECK-NEXT: (return @0)
define float @negnan_f32() {
  ret float 0xFFF8000000000000
}

; CHECK-LABEL: inf_f32:
; CHECK-NEXT: (setlocal @0 (immediate infinity))
; CHECK-NEXT: (return @0)
define float @inf_f32() {
  ret float 0x7FF0000000000000
}

; CHECK-LABEL: neginf_f32:
; CHECK-NEXT: (setlocal @0 (immediate -infinity))
; CHECK-NEXT: (return @0)
define float @neginf_f32() {
  ret float 0xFFF0000000000000
}

; CHECK-LABEL: negzero_f64:
; CHECK-NEXT: (setlocal @0 (immediate -0x0p0))
; CHECK-NEXT: (return @0)
define double @negzero_f64() {
  ret double -0.0
}

; CHECK-LABEL: zero_f64:
; CHECK-NEXT: (setlocal @0 (immediate 0x0p0))
; CHECK-NEXT: (return @0)
define double @zero_f64() {
  ret double 0.0
}

; CHECK-LABEL: one_f64:
; CHECK-NEXT: (setlocal @0 (immediate 0x1p0))
; CHECK-NEXT: (return @0)
define double @one_f64() {
  ret double 1.0
}

; CHECK-LABEL: two_f64:
; CHECK-NEXT: (setlocal @0 (immediate 0x1p1))
; CHECK-NEXT: (return @0)
define double @two_f64() {
  ret double 2.0
}

; CHECK-LABEL: nan_f64:
; CHECK-NEXT: (setlocal @0 (immediate nan))
; CHECK-NEXT: (return @0)
define double @nan_f64() {
  ret double 0x7FF8000000000000
}

; CHECK-LABEL: negnan_f64:
; CHECK-NEXT: (setlocal @0 (immediate -nan))
; CHECK-NEXT: (return @0)
define double @negnan_f64() {
  ret double 0xFFF8000000000000
}

; CHECK-LABEL: inf_f64:
; CHECK-NEXT: (setlocal @0 (immediate infinity))
; CHECK-NEXT: (return @0)
define double @inf_f64() {
  ret double 0x7FF0000000000000
}

; CHECK-LABEL: neginf_f64:
; CHECK-NEXT: (setlocal @0 (immediate -infinity))
; CHECK-NEXT: (return @0)
define double @neginf_f64() {
  ret double 0xFFF0000000000000
}
