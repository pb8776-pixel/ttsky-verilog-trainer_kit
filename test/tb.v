`timescale 1ns / 1ps
`default_nettype none

module tb_digital_trainer;

    reg a, b;
    wire and_out, or_out, not_a, nand_out, nor_out, xor_out, xnor_out;

    // Instantiate the DUT
    tt_um_digital_trainer_kit user_project (
        .a(a), .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .not_a(not_a),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out)
    );

    // Stimulus
    initial begin
        $dumpfile("tb_digital_trainer.vcd");
        $dumpvars(0, tb_digital_trainer);

        $display("A B | AND OR NOT NAND NOR XOR XNOR");

        // Loop through all input combinations
        a = 0; b = 0; #10 display_outputs();
        a = 0; b = 1; #10 display_outputs();
        a = 1; b = 0; #10 display_outputs();
        a = 1; b = 1; #10 display_outputs();

        $finish;
    end

    task display_outputs;
        begin
            $display("%b %b |  %b   %b   %b    %b    %b    %b    %b",
                a, b,
                and_out, or_out, not_a, nand_out, nor_out, xor_out, xnor_out
            );
        end
    endtask

endmodule
