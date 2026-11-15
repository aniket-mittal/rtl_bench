// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mult_unit dut (
    .clock0(clk),
    .aclr0(in_vec[33:33]),
    .dataa(in_vec[32:17]),
    .datab(in_vec[16:1]),
    .ena0(in_vec[0:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2eeeea3c1;
    stim[1] = 34'h3de24d8c7;
    stim[2] = 34'h08be8e419;
    stim[3] = 34'h03a0d083b;
    stim[4] = 34'h0c1d57085;
    stim[5] = 34'h06ce00d47;
    stim[6] = 34'h17c6c3b02;
    stim[7] = 34'h1c676bed4;
    stim[8] = 34'h1d48ef363;
    stim[9] = 34'h00e8ce718;
    stim[10] = 34'h0defa263f;
    stim[11] = 34'h0d5c9f086;
    stim[12] = 34'h0ddb72748;
    stim[13] = 34'h00ad33991;
    stim[14] = 34'h02d5df579;
    stim[15] = 34'h131223b54;
    stim[16] = 34'h0d528a945;
    stim[17] = 34'h06514df8e;
    stim[18] = 34'h05c7a108d;
    stim[19] = 34'h042828859;
    stim[20] = 34'h09640f622;
    stim[21] = 34'h0a332e70d;
    stim[22] = 34'h1fad41495;
    stim[23] = 34'h08f7d8765;
    stim[24] = 34'h1e3371cd9;
    stim[25] = 34'h040c3d8c6;
    stim[26] = 34'h00d6b7f8e;
    stim[27] = 34'h19e003350;
    stim[28] = 34'h03995afdd;
    stim[29] = 34'h0a2c85b2a;
    stim[30] = 34'h1cb81a990;
    stim[31] = 34'h1289c5c7e;
    stim[32] = 34'h0869cc7f0;
    stim[33] = 34'h0aa08ba28;
    stim[34] = 34'h120901a54;
    stim[35] = 34'h0f19b3dcb;
    stim[36] = 34'h1fa513ec4;
    stim[37] = 34'h186f74955;
    stim[38] = 34'h000546bbe;
    stim[39] = 34'h008619b7c;
    stim[40] = 34'h05c805eda;
    stim[41] = 34'h1061a3338;
    stim[42] = 34'h0925f3085;
    stim[43] = 34'h1778f87b0;
    stim[44] = 34'h25315aef8;
    stim[45] = 34'h0570eb81a;
    stim[46] = 34'h1be037273;
    stim[47] = 34'h0bb68475a;
    stim[48] = 34'h139e5e239;
    stim[49] = 34'h025becd9e;
    stim[50] = 34'h1f5b53d5d;
    stim[51] = 34'h105d3dbc9;
    stim[52] = 34'h09121dd81;
    stim[53] = 34'h0c0bc27fb;
    stim[54] = 34'h07445ffd3;
    stim[55] = 34'h04e7cdca6;
    stim[56] = 34'h174e5dbd6;
    stim[57] = 34'h0d597ec30;
    stim[58] = 34'h1f5d692a0;
    stim[59] = 34'h002d918b5;
    stim[60] = 34'h0d5bcb09c;
    stim[61] = 34'h12d9fd2de;
    stim[62] = 34'h0317975b2;
    stim[63] = 34'h0dfe6b911;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h1f29ef70;
      expv[4] = 32'h0efa61ae;
      expv[5] = 32'h45c12c54;
      expv[6] = 32'h01694950;
      expv[7] = 32'h01694950;
      expv[8] = 32'h01694950;
      expv[9] = 32'h6f5d8a17;
      expv[10] = 32'h6f5d8a17;
      expv[11] = 32'h0853c723;
      expv[12] = 32'h0853c723;
      expv[13] = 32'h0853c723;
      expv[14] = 32'h03503608;
      expv[15] = 32'h163693c8;
      expv[16] = 32'h163693c8;
      expv[17] = 32'h233c01a8;
      expv[18] = 32'h233c01a8;
      expv[19] = 32'h017e8cae;
      expv[20] = 32'h08dafb2c;
      expv[21] = 32'h08dafb2c;
      expv[22] = 32'h24d27116;
      expv[23] = 32'h0a2f64a4;
      expv[24] = 32'h36d79c1c;
      expv[25] = 32'h8669e764;
      expv[26] = 32'h8669e764;
      expv[27] = 32'h8669e764;
      expv[28] = 32'h8669e764;
      expv[29] = 32'h184869cc;
      expv[30] = 32'h184869cc;
      expv[31] = 32'h184869cc;
      expv[32] = 32'h184869cc;
      expv[33] = 32'h184869cc;
      expv[34] = 32'h184869cc;
      expv[35] = 32'h184869cc;
      expv[36] = 32'h4afa9561;
      expv[37] = 32'h4afa9561;
      expv[38] = 32'h7dbc9bae;
      expv[39] = 32'h7dbc9bae;
      expv[40] = 32'h7dbc9bae;
      expv[41] = 32'h7dbc9bae;
      expv[42] = 32'h7dbc9bae;
      expv[43] = 32'h2b86c61e;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'ha1596039;
      expv[48] = 32'ha1596039;
      expv[49] = 32'h93d0fc78;
      expv[50] = 32'h93d0fc78;
      expv[51] = 32'h9b7d0c2c;
      expv[52] = 32'h79a64c84;
      expv[53] = 32'h43ac4c00;
      expv[54] = 32'h078636e6;
      expv[55] = 32'h3a1cc6f2;
      expv[56] = 32'h3a1cc6f2;
      expv[57] = 32'h3a1cc6f2;
      expv[58] = 32'h3a1cc6f2;
      expv[59] = 32'h3a1cc6f2;
      expv[60] = 32'h00c78ff8;
      expv[61] = 32'h00c78ff8;
      expv[62] = 32'h00c78ff8;
      expv[63] = 32'h00c78ff8;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
