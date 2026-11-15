// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091965 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .orig_data(in_vec[24:1]),
    .orig_ready(in_vec[0:0]),
    .request(out_vec[38:38]),
    .orig_addr(out_vec[37:24]),
    .imgproc_ready(out_vec[23:23]),
    .imgproc_addr(out_vec[22:9]),
    .imgproc_data(out_vec[8:1]),
    .finish(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h2f2b853;
    stim[1] = 26'h2a0ba43;
    stim[2] = 26'h1c3f331;
    stim[3] = 26'h157a123;
    stim[4] = 26'h0ee5bde;
    stim[5] = 26'h0e6f534;
    stim[6] = 26'h00e1e6d;
    stim[7] = 26'h19a349e;
    stim[8] = 26'h02af519;
    stim[9] = 26'h1e41197;
    stim[10] = 26'h0613c0a;
    stim[11] = 26'h1d7b604;
    stim[12] = 26'h1fdf287;
    stim[13] = 26'h0a81391;
    stim[14] = 26'h1e107bb;
    stim[15] = 26'h1177343;
    stim[16] = 26'h00948c9;
    stim[17] = 26'h056f222;
    stim[18] = 26'h09f9573;
    stim[19] = 26'h17a612b;
    stim[20] = 26'h1647cba;
    stim[21] = 26'h1e6d0e9;
    stim[22] = 26'h069da39;
    stim[23] = 26'h1baa58a;
    stim[24] = 26'h1a12515;
    stim[25] = 26'h14d85b5;
    stim[26] = 26'h1f28c23;
    stim[27] = 26'h39c897f;
    stim[28] = 26'h1e58af4;
    stim[29] = 26'h128d975;
    stim[30] = 26'h0ca7c1c;
    stim[31] = 26'h1da4567;
    stim[32] = 26'h153edd6;
    stim[33] = 26'h15c622b;
    stim[34] = 26'h166b2c9;
    stim[35] = 26'h13fc756;
    stim[36] = 26'h0cd4b04;
    stim[37] = 26'h1ddfb5f;
    stim[38] = 26'h3f396c7;
    stim[39] = 26'h10588b8;
    stim[40] = 26'h08fd42e;
    stim[41] = 26'h0042f65;
    stim[42] = 26'h106bb72;
    stim[43] = 26'h0102149;
    stim[44] = 26'h09e3709;
    stim[45] = 26'h151d1e4;
    stim[46] = 26'h0ddcbd2;
    stim[47] = 26'h04889a4;
    stim[48] = 26'h1252ddd;
    stim[49] = 26'h11b59c4;
    stim[50] = 26'h132c0a5;
    stim[51] = 26'h0282d15;
    stim[52] = 26'h0cdde46;
    stim[53] = 26'h130c4fe;
    stim[54] = 26'h070c86a;
    stim[55] = 26'h1839368;
    stim[56] = 26'h1ffacfc;
    stim[57] = 26'h16b99a7;
    stim[58] = 26'h089cd61;
    stim[59] = 26'h003d881;
    stim[60] = 26'h01edeec;
    stim[61] = 26'h1343f69;
    stim[62] = 26'h05571e3;
    stim[63] = 26'h0c9f696;
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
      expv[0] = 39'h4000000000;
      expv[1] = 39'h4000000000;
      expv[2] = 39'h4000000000;
      expv[3] = 39'h4001800130;
      expv[4] = 39'h4002800322;
      expv[5] = 39'h0002000322;
      expv[6] = 39'h0002000322;
      expv[7] = 39'h400380040e;
      expv[8] = 39'h000300040e;
      expv[9] = 39'h400480062a;
      expv[10] = 39'h4005800810;
      expv[11] = 39'h0005000810;
      expv[12] = 39'h0005000810;
      expv[13] = 39'h4006800a86;
      expv[14] = 39'h4007800c12;
      expv[15] = 39'h4008800f06;
      expv[16] = 39'h4009801116;
      expv[17] = 39'h400a801208;
      expv[18] = 39'h000a001208;
      expv[19] = 39'h400b80149e;
      expv[20] = 39'h400c801660;
      expv[21] = 39'h000c001660;
      expv[22] = 39'h400d8018d0;
      expv[23] = 39'h400e801a38;
      expv[24] = 39'h000e001a38;
      expv[25] = 39'h400f801d14;
      expv[26] = 39'h4010801f4c;
      expv[27] = 39'h4000000000;
      expv[28] = 39'h4000000000;
      expv[29] = 39'h0000000000;
      expv[30] = 39'h40018000d8;
      expv[31] = 39'h00010000d8;
      expv[32] = 39'h4002800244;
      expv[33] = 39'h0002000244;
      expv[34] = 39'h400380042a;
      expv[35] = 39'h40048006b2;
      expv[36] = 39'h00040006b2;
      expv[37] = 39'h00040006b2;
      expv[38] = 39'h4000000000;
      expv[39] = 39'h4000000000;
      expv[40] = 39'h0000000000;
      expv[41] = 39'h0000000000;
      expv[42] = 39'h4001800004;
      expv[43] = 39'h0001000004;
      expv[44] = 39'h4002800210;
      expv[45] = 39'h4003800436;
      expv[46] = 39'h0003000436;
      expv[47] = 39'h0003000436;
      expv[48] = 39'h0003000436;
      expv[49] = 39'h4004800724;
      expv[50] = 39'h0004000724;
      expv[51] = 39'h40058008a4;
      expv[52] = 39'h4006800a28;
      expv[53] = 39'h0006000a28;
      expv[54] = 39'h0006000a28;
      expv[55] = 39'h0006000a28;
      expv[56] = 39'h0006000a28;
      expv[57] = 39'h0006000a28;
      expv[58] = 39'h4007800d6a;
      expv[59] = 39'h4008800e88;
      expv[60] = 39'h4009801002;
      expv[61] = 39'h0009001002;
      expv[62] = 39'h400a80123e;
      expv[63] = 39'h400b801454;
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
