// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01364 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h188e051721;
    stim[1] = 37'h0c8bd5ecee;
    stim[2] = 37'h0b56975ff4;
    stim[3] = 37'h0fe6c1863e;
    stim[4] = 37'h1341a753e8;
    stim[5] = 37'h0e15194da3;
    stim[6] = 37'h0e7f57a856;
    stim[7] = 37'h1f83395419;
    stim[8] = 37'h038d2693e4;
    stim[9] = 37'h12eaf2b96f;
    stim[10] = 37'h06591c9aff;
    stim[11] = 37'h0358c23a4a;
    stim[12] = 37'h1aa5ceac24;
    stim[13] = 37'h073d211909;
    stim[14] = 37'h0b9f0c0a03;
    stim[15] = 37'h1eeacedfd7;
    stim[16] = 37'h0d45aaee9a;
    stim[17] = 37'h12df653475;
    stim[18] = 37'h171e91d35c;
    stim[19] = 37'h024f71fff2;
    stim[20] = 37'h13d873d35a;
    stim[21] = 37'h0a13bad205;
    stim[22] = 37'h17a29ad13d;
    stim[23] = 37'h0e21db5048;
    stim[24] = 37'h0e65fcb4b7;
    stim[25] = 37'h1e895da802;
    stim[26] = 37'h1305a1d0e5;
    stim[27] = 37'h0246486bfc;
    stim[28] = 37'h1baeab8a4e;
    stim[29] = 37'h069e00cff7;
    stim[30] = 37'h02549f65bb;
    stim[31] = 37'h168189d540;
    stim[32] = 37'h1af61362d8;
    stim[33] = 37'h1b4ee12b3e;
    stim[34] = 37'h0c21efde0f;
    stim[35] = 37'h1b84324fdf;
    stim[36] = 37'h1a61312d28;
    stim[37] = 37'h0fe8297d99;
    stim[38] = 37'h0add370757;
    stim[39] = 37'h073dd669da;
    stim[40] = 37'h126540b3b0;
    stim[41] = 37'h1a803870bc;
    stim[42] = 37'h1a6fbfc4a0;
    stim[43] = 37'h0a2da045d5;
    stim[44] = 37'h0b2a04efae;
    stim[45] = 37'h1f2aead7ac;
    stim[46] = 37'h0bf012337f;
    stim[47] = 37'h0a8506caac;
    stim[48] = 37'h1b95654250;
    stim[49] = 37'h176327f4a6;
    stim[50] = 37'h121e2a6267;
    stim[51] = 37'h02d9ce2331;
    stim[52] = 37'h0b7c28d408;
    stim[53] = 37'h0ac86d0c81;
    stim[54] = 37'h1e773b1e86;
    stim[55] = 37'h091ec4780f;
    stim[56] = 37'h177b45b87b;
    stim[57] = 37'h1ad794dbab;
    stim[58] = 37'h13e860b3ae;
    stim[59] = 37'h054fc3940f;
    stim[60] = 37'h173872092a;
    stim[61] = 37'h07dfc0ae98;
    stim[62] = 37'h061d38d001;
    stim[63] = 37'h0ac23f9d54;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h100000001;
      expv[12] = 33'h100000000;
      expv[13] = 33'h100000001;
      expv[14] = 33'h100000000;
      expv[15] = 33'h100000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h100000001;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h100000000;
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
