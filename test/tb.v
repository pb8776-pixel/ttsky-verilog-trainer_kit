`default_nettype none

`timescale 1ns/1ps

module tb;

    reg  [7:0] ui_in;
    reg  [7:0] uio_in;
    reg        ena;
    reg        clk;
    reg        rst_n;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // DUT instantiation
    tt_um_digital_trainer_kit user_project (
        .ui_in(ui_in),
        .uio_in(uio_in),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n),
        .uo_out(uo_out),
        .uio_out(uio_out),
        .uio_oe(uio_oe)
    );

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        ena   = 1;
        rst_n = 1;
        clk   = 0;
        uio_in = 8'h00;

        $display(" A B | AND OR NOTA NAND NOR XOR XNOR ");

        ui_in = 8'b00; #10;
        $display(" %b %b |  %b   %b    %b    %b    %b    %b    %b",
                  ui_in[0], ui_in[1],
                  uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                  uo_out[4], uo_out[5], uo_out[6]);

        ui_in = 8'b01; #10;
        $display(" %b %b |  %b   %b    %b    %b    %b    %b    %b",
                  ui_in[0], ui_in[1],
                  uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                  uo_out[4], uo_out[5], uo_out[6]);

        ui_in = 8'b10; #10;
        $display(" %b %b |  %b   %b    %b    %b    %b    %b    %b",
                  ui_in[0], ui_in[1],
                  uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                  uo_out[4], uo_out[5], uo_out[6]);

        ui_in = 8'b11; #10;
        $display(" %b %b |  %b   %b    %b    %b    %b    %b    %b",
                  ui_in[0], ui_in[1],
                  uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                  uo_out[4], uo_out[5], uo_out[6]);

        $finish;
    end

    always #5 clk = ~clk;

endmodule
