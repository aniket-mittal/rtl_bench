// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03927 dut (
    .clock_clk(clk),
    .avs_s0_address(in_vec[42:39]),
    .avs_s0_read(in_vec[38:38]),
    .avs_s0_write(in_vec[37:37]),
    .avs_s0_writedata(in_vec[36:5]),
    .avs_s0_byteenable(in_vec[4:1]),
    .reset_reset(in_vec[0:0]),
    .avs_s0_readdata(out_vec[34:3]),
    .avs_s0_readdatavalid(out_vec[2:2]),
    .avs_s0_waitrequest(out_vec[1:1]),
    .ins_irq0_irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h3b21f3182d5;
    stim[1] = 43'h7433b89a957;
    stim[2] = 43'h21700e24044;
    stim[3] = 43'h06479f1b0e4;
    stim[4] = 43'h1cf284535de;
    stim[5] = 43'h2bcb8d9718c;
    stim[6] = 43'h23d7661ce0e;
    stim[7] = 43'h08e0fcfb266;
    stim[8] = 43'h26357ff91d6;
    stim[9] = 43'h169729d9688;
    stim[10] = 43'h6fb70e8cde4;
    stim[11] = 43'h689c5656e58;
    stim[12] = 43'h14b0eac2bb8;
    stim[13] = 43'h5dc78f0ac42;
    stim[14] = 43'h1dc5d0343dc;
    stim[15] = 43'h50ffb938056;
    stim[16] = 43'h09deb50d3d6;
    stim[17] = 43'h70367937b56;
    stim[18] = 43'h3a0c2a409e4;
    stim[19] = 43'h19b8bca389a;
    stim[20] = 43'h5c7e22ba162;
    stim[21] = 43'h51f4fe24dfc;
    stim[22] = 43'h1b86c3173f0;
    stim[23] = 43'h365d05ee98a;
    stim[24] = 43'h1bed494dda8;
    stim[25] = 43'h35ddbc0f284;
    stim[26] = 43'h4c468faaf6c;
    stim[27] = 43'h2f88c516a02;
    stim[28] = 43'h5831c054f94;
    stim[29] = 43'h695feb5c356;
    stim[30] = 43'h69e904f1e9a;
    stim[31] = 43'h7bdc141e628;
    stim[32] = 43'h442f4e31564;
    stim[33] = 43'h44be710a8e2;
    stim[34] = 43'h375ad2bd4d8;
    stim[35] = 43'h5a52530da4e;
    stim[36] = 43'h2b855dc6336;
    stim[37] = 43'h0423f01f0e2;
    stim[38] = 43'h0eb0382a8b4;
    stim[39] = 43'h19c59af95f6;
    stim[40] = 43'h30dd51a43be;
    stim[41] = 43'h147fdd577c2;
    stim[42] = 43'h32a51516678;
    stim[43] = 43'h49f532b1e12;
    stim[44] = 43'h291c65e2b0e;
    stim[45] = 43'h1328d5457a8;
    stim[46] = 43'h23d00545fc0;
    stim[47] = 43'h0d01e9ccf4e;
    stim[48] = 43'h52285ef67ea;
    stim[49] = 43'h7dbd22221dc;
    stim[50] = 43'h2f04b12ea26;
    stim[51] = 43'h7d7a76b9944;
    stim[52] = 43'h56597c2726e;
    stim[53] = 43'h759b9679c7c;
    stim[54] = 43'h65f6d6da780;
    stim[55] = 43'h185f235b0c9;
    stim[56] = 43'h2359f69e02c;
    stim[57] = 43'h32794bc9a32;
    stim[58] = 43'h7ead2cae99c;
    stim[59] = 43'h3b51304fc4a;
    stim[60] = 43'h2c73183ed7c;
    stim[61] = 43'h5a4bef3aa0a;
    stim[62] = 43'h6f1ab7b81ba;
    stim[63] = 43'h56ed72e2b9c;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000000;
      expv[10] = 35'h000000000;
      expv[11] = 35'h000000000;
      expv[12] = 35'h000000000;
      expv[13] = 35'h000000000;
      expv[14] = 35'h000000000;
      expv[15] = 35'h000000000;
      expv[16] = 35'h000000000;
      expv[17] = 35'h000000000;
      expv[18] = 35'h000000000;
      expv[19] = 35'h000000000;
      expv[20] = 35'h000000000;
      expv[21] = 35'h000000000;
      expv[22] = 35'h000000000;
      expv[23] = 35'h000000000;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000000;
      expv[26] = 35'h000000000;
      expv[27] = 35'h000000000;
      expv[28] = 35'h000000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000000;
      expv[36] = 35'h000000000;
      expv[37] = 35'h000000000;
      expv[38] = 35'h000000000;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h000000000;
      expv[43] = 35'h000000000;
      expv[44] = 35'h000000000;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h000000000;
      expv[48] = 35'h000000000;
      expv[49] = 35'h000000000;
      expv[50] = 35'h000000000;
      expv[51] = 35'h000000000;
      expv[52] = 35'h000000000;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h000000000;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h000000000;
      expv[62] = 35'h000000000;
      expv[63] = 35'h000000000;
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
