`timescale 1ns / 1ps
`default_nettype none

module tb ();

  // Testbench signals
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Instantiate DUT
  tt_um_digital_trainer_kit dut (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .ui_in(ui_in),
    .uo_out(uo_out),
    .uio_in(uio_in),
    .uio_out(uio_out),
    .uio_oe(uio_oe)
  );

  // Clock (not actually used in logic, but Tiny Tapeout top-level requires it)
  initial clk = 0;
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);

    // Initialize
    rst_n  = 1;
    ena    = 1;
    uio_in = 8'b0;

    // Test all input combinations for A (ui_in[0]) and B (ui_in[1])
    $display(" A B | AND OR NOTA NAND NOR XOR XNOR ");
    for (integer i = 0; i < 4; i = i + 1) begin
      ui_in[0] = i[0];   // A
      ui_in[1] = i[1];   // B
      #10; // small delay for outputs to settle
      $display(" %b %b |  %b   %b    %b    %b    %b    %b    %b",
               ui_in[0], ui_in[1],
               uo_out[0], uo_out[1], uo_out[2],
               uo_out[3], uo_out[4], uo_out[5], uo_out[6]);
    end

    $finish;
  end

endmodule
