/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (1=output)
    input  wire       ena,      // always 1 when powered
    input  wire       clk,      // clock
    input  wire       rst_n     // reset (active low)
);

    // 8x8 multiplier
    wire [15:0] product;

    assign product = ui_in * uio_in;

    assign uo_out  = product[7:0];
    assign uio_out = product[15:8];
    assign uio_oe  = 8'b11111111;

    // Prevent unused warnings
    wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
