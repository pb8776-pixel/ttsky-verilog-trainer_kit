module tt_um_digital_trainer_kit (
    input  [7:0] ui_in,    // dedicated inputs
    output [7:0] uo_out,   // dedicated outputs
    input  [7:0] uio_in,   // unused
    output [7:0] uio_out,  // unused
    output [7:0] uio_oe    // unused
);

    wire a = ui_in[0];
    wire b = ui_in[1];

    assign uo_out[0] = a & b;   // AND
    assign uo_out[1] = a | b;   // OR
    assign uo_out[2] = ~a;      // NOT
    assign uo_out[3] = ~(a & b);// NAND
    assign uo_out[4] = ~(a | b);// NOR
    assign uo_out[5] = a ^ b;   // XOR
    assign uo_out[6] = ~(a ^ b);// XNOR
    assign uo_out[7] = 1'b0;    // unused

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
