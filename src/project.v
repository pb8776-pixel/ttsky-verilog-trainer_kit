`default_nettype none
module tt_um_digital_trainer_kit (
    input  wire [7:0] ui_in,    // inputs
    output wire [7:0] uo_out,   // outputs
    input  wire [7:0] uio_in,   // unused
    output wire [7:0] uio_out,  // unused
    output wire [7:0] uio_oe,   // unused
    input  wire       ena,      // unused
    input  wire       clk,      // unused
    input  wire       rst_n     // unused
);

    // Unused IO defaults
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Example: implement basic gates with ui_in[0], ui_in[1]
    wire a = ui_in[0];
    wire b = ui_in[1];

    assign uo_out[0] = a & b;   // AND
    assign uo_out[1] = a | b;   // OR
    assign uo_out[2] = a ^ b;   // XOR
    assign uo_out[3] = ~(a & b); // NAND
    assign uo_out[4] = ~(a | b); // NOR
    assign uo_out[5] = ~(a ^ b); // XNOR
    assign uo_out[6] = ~a;       // NOT A
    assign uo_out[7] = ~b;       // NOT B

endmodule
