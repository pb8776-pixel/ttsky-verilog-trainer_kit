/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

module tt_um_digital_trainer_kit (
    input  wire        clk,      // system clock (not used here)
    input  wire        rst_n,    // reset (not used here)
    input  wire        ena,      // enable (not used here)
    input  wire [7:0]  ui_in,    // dedicated inputs
    output wire [7:0]  uo_out,   // dedicated outputs
    input  wire [7:0]  uio_in,   // bidirectional input
    output wire [7:0]  uio_out,  // bidirectional output
    output wire [7:0]  uio_oe    // bidirectional enable
);

    // assign unused bidir signals
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Map inputs
    wire a = ui_in[0];
    wire b = ui_in[1];

    // Logic gates
    assign uo_out[0] = a & b;   // AND
    assign uo_out[1] = a | b;   // OR
    assign uo_out[2] = ~a;      // NOT A
    assign uo_out[3] = ~(a & b);// NAND
    assign uo_out[4] = ~(a | b);// NOR
    assign uo_out[5] = a ^ b;   // XOR
    assign uo_out[6] = ~(a ^ b);// XNOR
    assign uo_out[7] = 1'b0;    // unused

endmodule
