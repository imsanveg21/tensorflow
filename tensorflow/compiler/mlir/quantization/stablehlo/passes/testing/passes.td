/* Copyright 2023 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

// Passes only used for testing purposes.

include "mlir/Pass/PassBase.td"

def TestPreCalibrationComponentPass : Pass<"stablehlo-test-pre-calibration-component", "mlir::ModuleOp"> {
  let summary = "Test-only pass to test the PreCalibrationComponent.";
  let description = [{
    Runs the pre calibration passes for post-training quantization with default
    configuration.
  }];
  let dependentDialects = [
    "mlir::stablehlo::StablehloDialect", "mlir::TF::TensorFlowDialect",
    "mlir::func::FuncDialect", "mlir::tf_executor::TensorFlowExecutorDialect",
    "mlir::mhlo::MhloDialect", "mlir::vhlo::VhloDialect",
  ];
}

def TestPostCalibrationComponentPass : Pass<"stablehlo-test-post-calibration-component", "mlir::ModuleOp"> {
  let summary = "Test-only pass to test the PostCalibrationComponent.";
  let description = [{
    Runs the post-calibration passes for post-training quantization.
  }];
  let dependentDialects = [
    "mlir::stablehlo::StablehloDialect", "mlir::TF::TensorFlowDialect",
    "mlir::func::FuncDialect", "mlir::mhlo::MhloDialect",
    "mlir::quant::QuantizationDialect", "mlir::chlo::ChloDialect",
    "mlir::vhlo::VhloDialect", "mlir::shape::ShapeDialect",
    "mlir::quantfork::QuantizationForkDialect",
  ];
}
