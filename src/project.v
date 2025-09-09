/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`timescale 1ns / 1ps
`default_nettype none

// Digital Trainer Kit with all basic gates
module digital_trainer_kit (
    input  wire a, b,       // two input signals
    output wire and_out,
    output wire or_out,
    output wire not_a,
    output wire nand_out,
    output wire nor_out,
    output wire xor_out,
    output wire xnor_out
);

    assign and_out  = a & b;    // AND gate
    assign or_out   = a | b;    // OR gate
    assign not_a    = ~a;       // NOT gate (on 'a')
    assign nand_out = ~(a & b); // NAND gate
    assign nor_out  = ~(a | b); // NOR gate
    assign xor_out  = a ^ b;    // XOR gate
    assign xnor_out = ~(a ^ b); // XNOR gate

endmodule

